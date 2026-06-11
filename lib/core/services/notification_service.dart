import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';
import '../router/app_router.dart';

class NotificationService with WidgetsBindingObserver {
  final Map<int, Timer> _timeoutTimers = {};

  NotificationService();

  /// Initializes the timezone databases and the alarm package.
  Future<void> init() async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Starting initialization...');
    }

    // Register this class as a lifecycle observer
    WidgetsBinding.instance.addObserver(this);

    // 1. Initialize timezone database and set local location
    tz.initializeTimeZones();
    try {
      final TimezoneInfo timeZoneInfo =
          await FlutterTimezone.getLocalTimezone();
      final safeLocation = _getSafeLocation(timeZoneInfo.identifier);
      tz.setLocalLocation(safeLocation);
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Timezone configured successfully to ${tz.local.name}. Current Time: ${tz.TZDateTime.now(tz.local)}',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Error setting local location: $e. Falling back to UTC.',
        );
      }
    }

    // 2. Initialize the Alarm package
    await Alarm.init();

    // 3. Listen to the alarm ring stream to start a 60-second timeout timer
    Alarm.ringStream.stream.listen((alarmSettings) {
      if (kDebugMode) {
        debugPrint('NotificationService [DEBUG]: Alarm ringing: ${alarmSettings.id}');
      }
      _startTimeoutTimer(alarmSettings.id);
    });

    // Listen to ringing status changes globally to cancel timeout timers
    Alarm.ringing.listen((AlarmSet ringingAlarms) {
      final activeTimerIds = List<int>.from(_timeoutTimers.keys);
      for (final id in activeTimerIds) {
        if (!ringingAlarms.containsId(id)) {
          if (kDebugMode) {
            debugPrint('NotificationService: Canceling timeout timer for stopped alarm $id.');
          }
          _timeoutTimers[id]?.cancel();
          _timeoutTimers.remove(id);
        }
      }
    });

    // 4. Proactively request notifications permissions on app startup
    final permissionGranted = await requestNotificationPermissions();
    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: Notification Permissions Granted? $permissionGranted',
      );
    }

    // 5. Navigate immediately if an alarm is already ringing on launch
    await _checkAndNavigateToRingingAlarm();
  }

  void _startTimeoutTimer(int alarmId) {
    _timeoutTimers[alarmId]?.cancel();
    _timeoutTimers[alarmId] = Timer(const Duration(seconds: 60), () async {
      final isRinging = await Alarm.isRinging(alarmId);
      if (isRinging) {
        if (kDebugMode) {
          debugPrint('NotificationService: Alarm $alarmId timed out after 60 seconds. Stopping.');
        }
        await cancelNotification(alarmId);
      }
      _timeoutTimers.remove(alarmId);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkAndNavigateToRingingAlarm();
    }
  }

  Future<void> _checkAndNavigateToRingingAlarm() async {
    final ringingSet = Alarm.ringing.value.alarms;
    if (ringingSet.isNotEmpty) {
      final activeAlarm = ringingSet.first;
      final payload = activeAlarm.payload;
      if (payload != null && payload.isNotEmpty) {
        final currentRoute =
            AppRouter.router.routeInformationProvider.value.uri.path;
        if (currentRoute != '/alarm') {
          if (kDebugMode) {
            debugPrint(
              'NotificationService: Ringing alarm detected on resume. Navigating to alarm screen.',
            );
          }
          AppRouter.router.go('/alarm?id=$payload');
        }
      }
    }
  }

  /// Check and request notification permissions dynamically using permission_handler.
  /// Returns true if permission is granted, false otherwise.
  Future<bool> requestNotificationPermissions() async {
    final status = await Permission.notification.status;
    if (status.isGranted) {
      return true;
    }
    final result = await Permission.notification.request();
    return result.isGranted;
  }

  /// Check current notification permission status.
  Future<PermissionStatus> getPermissionStatus() async {
    return await Permission.notification.status;
  }

  /// Schedule a local timezone-aware alarm.
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    final tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);
    final tzNow = tz.TZDateTime.now(tz.local);

    if (tzScheduledDate.isBefore(tzNow)) {
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Error - target time $tzScheduledDate is in the past compared to system time $tzNow',
        );
      }
      throw ArgumentError('Scheduled date must be in the future.');
    }

    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: Scheduling Alarm ID $id at $tzScheduledDate via Alarm package',
      );
    }

    try {
      final alarmSettings = AlarmSettings(
        id: id,
        dateTime: scheduledDate,
        assetAudioPath: 'assets/music_alarm.mp3',
        loopAudio: true,
        vibrate: true,
        volumeSettings: const VolumeSettings.fixed(
          volume: 1.0,
          volumeEnforced: true,
          showSystemUI: false,
        ),
        androidFullScreenIntent: true,
        notificationSettings: NotificationSettings(
          title: title,
          body: body,
          stopButton: 'Stop',
        ),
        payload: payload,
      );
      await Alarm.set(alarmSettings: alarmSettings);
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Alarm ID $id successfully registered in OS via Alarm package.',
        );
      }
    } catch (e, stack) {
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Failed to register Alarm ID $id in OS: $e',
        );
        debugPrint(stack.toString());
      }
      rethrow;
    }
  }

  /// Trigger an immediate notification for testing/debugging purposes
  Future<void> triggerImmediateNotification() async {
    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: triggerImmediateNotification requested.',
      );
    }

    try {
      final alarmSettings = AlarmSettings(
        id: 999,
        dateTime: DateTime.now().add(const Duration(milliseconds: 50)),
        assetAudioPath: 'assets/music_alarm.mp3',
        loopAudio: true,
        vibrate: true,
        volumeSettings: const VolumeSettings.fixed(
          volume: 1.0,
          volumeEnforced: true,
          showSystemUI: false,
        ),
        androidFullScreenIntent: true,
        notificationSettings: const NotificationSettings(
          title: 'Immediate Debug Alarm',
          body: 'This is a test notification triggered immediately!',
          stopButton: 'Stop',
        ),
        payload: 'debug_immediate_payload',
      );
      await Alarm.set(alarmSettings: alarmSettings);
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Immediate alarm triggered successfully.',
        );
      }
    } catch (e, stack) {
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: ERROR in triggerImmediateNotification: $e',
        );
        debugPrint(stack.toString());
      }
    }
  }

  /// Re-schedule an alarm after a snooze delay.
  /// Cancels any existing alarm with [id] before scheduling.
  Future<void> scheduleSnoozeNotification({
    required int id,
    required int snoozeDurationMinutes,
    String? payload,
  }) async {
    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: Snoozing alarm ID $id for $snoozeDurationMinutes min.',
      );
    }
    final snoozeTime = DateTime.now().add(
      Duration(minutes: snoozeDurationMinutes),
    );
    await scheduleNotification(
      id: id,
      title: 'Incoming Reminder',
      body: 'You have a scheduled reminder.',
      scheduledDate: snoozeTime,
      payload: payload,
    );
  }

  /// Cancel a specific alarm by ID.
  Future<void> cancelNotification(int id) async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Canceling alarm ID: $id');
    }
    await Alarm.stop(id);
  }

  /// Cancel all scheduled alarms.
  Future<void> cancelAllNotifications() async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Canceling all alarms');
    }
    await Alarm.stopAll();
  }

  /// Maps common timezone aliases (such as Asia/Calcutta) to database compatible equivalents
  static tz.Location _getSafeLocation(String timeZoneName) {
    final Map<String, String> aliasMap = {
      'Asia/Calcutta': 'Asia/Kolkata',
      'Asia/Saigon': 'Asia/Ho_Chi_Minh',
      'Asia/Katmandu': 'Asia/Kathmandu',
      'America/Buenos_Aires': 'America/Argentina/Buenos_Aires',
    };

    final cleanName = aliasMap[timeZoneName] ?? timeZoneName;
    try {
      return tz.getLocation(cleanName);
    } catch (e) {
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Location $cleanName not found in database, searching for a fallback...',
        );
      }
      // If still not found, search the database for a matching suffix
      for (final key in tz.timeZoneDatabase.locations.keys) {
        if (key.endsWith(cleanName.split('/').last)) {
          if (kDebugMode) {
            debugPrint(
              'NotificationService [DEBUG]: Using matching database suffix location: $key',
            );
          }
          return tz.getLocation(key);
        }
      }
      rethrow;
    }
  }
}
