import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alarm/alarm.dart';
import 'package:alarm/utils/alarm_set.dart';

import '../../../core/router/app_router.dart';
import '../../../core/services/alarm_channel_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/tts_service.dart';
import '../../../domain/repositories/reminders_repository.dart';
import 'alarm_event.dart';
import 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  final RemindersRepository _repository;
  final AlarmChannelService _alarmChannelService;
  final TtsService _ttsService;
  final NotificationService _notificationService;

  /// Cached so that handlers that fire after the initial [AlarmStarted]
  /// event (e.g. [AlarmDismissed]) still have access to the reminder ID.
  String? _reminderId;

  Timer? _timeoutTimer;
  StreamSubscription<AlarmSet>? _ringingSubscription;

  AlarmBloc({
    required RemindersRepository repository,
    required AlarmChannelService alarmChannelService,
    required TtsService ttsService,
    required NotificationService notificationService,
  }) : _repository = repository,
       _alarmChannelService = alarmChannelService,
       _ttsService = ttsService,
       _notificationService = notificationService,
       super(const AlarmState.initial()) {
    on<AlarmEvent>((event, emit) async {
      await event.map(
        started: (e) => _onStarted(e, emit),
        accepted: (e) => _onAccepted(e, emit),
        speechFinished: (e) => _onSpeechFinished(e, emit),
        snoozed: (e) => _onSnoozed(e, emit),
        dismissed: (e) => _onDismissed(e, emit),
      );
    });
  }

  // ---------------------------------------------------------------------------
  // Event handlers
  // ---------------------------------------------------------------------------

  Future<void> _onStarted(AlarmStarted event, Emitter<AlarmState> emit) async {
    _reminderId = event.reminderId;
    emit(const AlarmState.loading());
    try {
      final notificationId = event.reminderId.hashCode.abs() & 0x7FFFFFFF;
      final isRinging = await Alarm.isRinging(notificationId);
      if (!isRinging) {
        if (kDebugMode) {
          debugPrint('AlarmBloc [started] Alarm is not ringing, redirecting to home.');
        }
        AppRouter.router.go('/');
        return;
      }

      // Wake screen and start ringtone concurrently.
      await Future.wait([
        _alarmChannelService.startRingtone(),
        _alarmChannelService.turnScreenOn(),
      ]);
      final reminder = await _repository.getReminderById(event.reminderId);
      if (reminder == null) {
        emit(const AlarmState.error(message: 'Reminder not found.'));
        return;
      }
      emit(AlarmState.idle(reminder: reminder));

      // Start the 60-second timeout timer (Issue #3)
      _timeoutTimer?.cancel();
      _timeoutTimer = Timer(const Duration(seconds: 60), () {
        if (!isClosed) {
          add(const AlarmEvent.dismissed());
        }
      });

      // Listen to active ringing status changes
      _ringingSubscription?.cancel();
      bool wasRingingDetected = true;
      _ringingSubscription = Alarm.ringing.listen((ringingAlarms) {
        final contains = ringingAlarms.containsId(notificationId);
        if (contains) {
          wasRingingDetected = true;
        } else if (wasRingingDetected) {
          if (kDebugMode) {
            debugPrint('AlarmBloc: Alarm $notificationId stopped ringing. Redirecting to home.');
          }
          AppRouter.router.go('/');
        }
      });
    } catch (e, st) {
      if (kDebugMode) debugPrint('AlarmBloc [started] error: $e\n$st');
      emit(AlarmState.error(message: 'Failed to load reminder: $e'));
    }
  }

  Future<void> _onAccepted(
    AlarmAccepted event,
    Emitter<AlarmState> emit,
  ) async {
    _ringingSubscription?.cancel();
    _timeoutTimer?.cancel();
    final reminder = state.maybeWhen(idle: (r) => r, orElse: () => null);
    if (reminder == null) return;

    await _alarmChannelService.stopRingtone();

    final notificationId = _reminderId!.hashCode.abs() & 0x7FFFFFFF;
    await _notificationService.cancelNotification(notificationId);
    await _alarmChannelService.dismissKeyguard();

    emit(AlarmState.speaking(reminder: reminder));

    // Begin TTS; the completion callback fires [AlarmSpeechFinished].
    await _ttsService.speakReminder(
      title: reminder.title,
      description: reminder.description,
      onComplete: () => add(const AlarmEvent.speechFinished()),
    );
  }

  Future<void> _onSpeechFinished(
    AlarmSpeechFinished event,
    Emitter<AlarmState> emit,
  ) async {
    emit(const AlarmState.delivered());
    // Close app after confirmation is visible; fire-and-forget to keep the
    // event handler non-blocking.
    Future.delayed(
      const Duration(milliseconds: 1800),
      _alarmChannelService.closeApp,
    );
  }

  Future<void> _onSnoozed(AlarmSnoozed event, Emitter<AlarmState> emit) async {
    _ringingSubscription?.cancel();
    _timeoutTimer?.cancel();
    await _alarmChannelService.stopRingtone();
    await _ttsService.stop();

    const snoozedMinutes = 10;
    final ringAt = DateTime.now().add(const Duration(minutes: snoozedMinutes));

    if (_reminderId != null) {
      try {
        await _repository.snoozeReminder(_reminderId!);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('AlarmBloc [snoozed] snoozeReminder error: $e');
        }
      }
    }

    emit(
      AlarmState.snoozedConfirmation(
        snoozedMinutes: snoozedMinutes,
        ringAt: ringAt,
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 2400),
      _alarmChannelService.closeApp,
    );
  }

  Future<void> _onDismissed(
    AlarmDismissed event,
    Emitter<AlarmState> emit,
  ) async {
    _ringingSubscription?.cancel();
    _timeoutTimer?.cancel();
    await _alarmChannelService.stopRingtone();
    await _ttsService.stop();

    if (_reminderId != null) {
      final notificationId = _reminderId!.hashCode.abs() & 0x7FFFFFFF;
      await _notificationService.cancelNotification(notificationId);
    }
    await _alarmChannelService.closeApp();
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  Future<void> close() {
    _ringingSubscription?.cancel();
    _timeoutTimer?.cancel();
    // Ensure audio stops even if the widget tree is torn down unexpectedly.
    _alarmChannelService.stopRingtone();
    _ttsService.stop();
    return super.close();
  }
}
