import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../router/app_router.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  bool _canScheduleExact = true;

  NotificationService(this._localNotificationsPlugin);

  static const String channelId = 'reminder_alarm_channel_v7';
  static const String channelName = 'Reminders';
  static const String channelDesc =
      'Notification channel for scheduled reminder alarms';

  /// Initializes the local notifications plugin and timezone databases.
  Future<void> init() async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Starting initialization...');
    }

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

    // 2. Set default initialization settings for platforms
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (kDebugMode) {
          debugPrint(
            'NotificationService [DEBUG]: Notification clicked: ${response.payload}',
          );
        }
        final payload = response.payload;
        if (payload != null && payload.isNotEmpty) {
          AppRouter.router.go('/alarm?id=$payload');
        }
      },
    );

    // 3. Create Android notification channel (essential for Android 8.0+)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      channelId,
      channelName,
      description: channelDesc,
      importance: Importance.max,
      playSound: true,
      sound: UriAndroidNotificationSound(
        'content://settings/system/ringtone',
      ),
      audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
      enableVibration: true,
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    // 4. Proactively request notifications permissions on app startup
    final permissionGranted = await requestNotificationPermissions();
    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: Notification Permissions Granted? $permissionGranted',
      );
    }

    // 5. Check and Request exact alarm permission (Android 12+)
    final androidImplementation = _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (androidImplementation != null) {
      try {
        final exactAllowed = await androidImplementation
            .canScheduleExactNotifications();
        _canScheduleExact = exactAllowed ?? false;
        if (kDebugMode) {
          debugPrint(
            'NotificationService [DEBUG]: Exact Alarms Permitted? $_canScheduleExact',
          );
        }

        if (!_canScheduleExact) {
          if (kDebugMode) {
            debugPrint(
              'NotificationService [DEBUG]: Requesting Exact Alarms Permission at runtime...',
            );
          }
          final requestResult = await androidImplementation
              .requestExactAlarmsPermission();
          if (kDebugMode) {
            debugPrint(
              'NotificationService [DEBUG]: Exact Alarm Request Result: $requestResult',
            );
          }
          final finalExactCheck = await androidImplementation
              .canScheduleExactNotifications();
          _canScheduleExact = finalExactCheck ?? false;
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint(
            'NotificationService [DEBUG]: Error configuring exact alarms permission: $e',
          );
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

  /// Schedule a local timezone-aware notification.
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

    final AndroidNotificationDetails
    androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDesc,
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: const UriAndroidNotificationSound(
        'content://settings/system/ringtone',
      ),
      audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
      category: AndroidNotificationCategory.alarm,
      visibility: NotificationVisibility.public,
      fullScreenIntent: true,
      additionalFlags: Int32List.fromList(<int>[
        4,
      ]), // Insistent (looping) alarm sound/vibration
      actions: <AndroidNotificationAction>[
        const AndroidNotificationAction(
          'dismiss_alarm',
          'Dismiss',
          cancelNotification: true,
        ),
      ],
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Determine the optimal Android schedule mode based on permissions
    final actualScheduleMode = _canScheduleExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;

    if (kDebugMode) {
      debugPrint(
        'NotificationService [DEBUG]: Scheduling Alarm ID $id at $tzScheduledDate (${tzScheduledDate.difference(tzNow).inSeconds}s from now). Mode: $actualScheduleMode',
      );
    }

    try {
      await _localNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzScheduledDate,
        platformDetails,
        androidScheduleMode: actualScheduleMode,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Alarm ID $id successfully registered in OS.',
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

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription: channelDesc,
          importance: Importance.max,
          priority: Priority.max,
          playSound: true,
          sound: UriAndroidNotificationSound(
            'content://settings/system/ringtone',
          ),
          audioAttributesUsage: AudioAttributesUsage.notificationRingtone,
          category: AndroidNotificationCategory.alarm,
          visibility: NotificationVisibility.public,
          fullScreenIntent: true,
        );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    try {
      await _localNotificationsPlugin.show(
        999, // Static ID for immediate debug notifications
        'Immediate Debug Alarm',
        'This is a persistent test notification triggered immediately!',
        platformDetails,
        payload: 'debug_immediate_payload',
      );
      if (kDebugMode) {
        debugPrint(
          'NotificationService [DEBUG]: Immediate notification triggered successfully.',
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

  /// Cancel a specific notification by ID.
  Future<void> cancelNotification(int id) async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Canceling notification ID: $id');
    }
    await _localNotificationsPlugin.cancel(id);
  }

  /// Cancel all scheduled notifications.
  Future<void> cancelAllNotifications() async {
    if (kDebugMode) {
      debugPrint('NotificationService [DEBUG]: Canceling all notifications');
    }
    await _localNotificationsPlugin.cancelAll();
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
