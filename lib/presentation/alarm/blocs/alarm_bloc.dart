import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  AlarmBloc({
    required RemindersRepository repository,
    required AlarmChannelService alarmChannelService,
    required TtsService ttsService,
    required NotificationService notificationService,
  })  : _repository = repository,
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

  Future<void> _onStarted(
    AlarmStarted event,
    Emitter<AlarmState> emit,
  ) async {
    _reminderId = event.reminderId;
    emit(const AlarmState.loading());
    try {
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
    } catch (e, st) {
      if (kDebugMode) debugPrint('AlarmBloc [started] error: $e\n$st');
      emit(AlarmState.error(message: 'Failed to load reminder: $e'));
    }
  }

  Future<void> _onAccepted(
    AlarmAccepted event,
    Emitter<AlarmState> emit,
  ) async {
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

  Future<void> _onSnoozed(
    AlarmSnoozed event,
    Emitter<AlarmState> emit,
  ) async {
    await _alarmChannelService.stopRingtone();
    await _ttsService.stop();

    const snoozedMinutes = 10;
    final ringAt = DateTime.now().add(const Duration(minutes: snoozedMinutes));

    if (_reminderId != null) {
      try {
        await _repository.snoozeReminder(_reminderId!);
      } catch (e) {
        if (kDebugMode) debugPrint('AlarmBloc [snoozed] snoozeReminder error: $e');
      }
    }

    emit(AlarmState.snoozedConfirmation(
      snoozedMinutes: snoozedMinutes,
      ringAt: ringAt,
    ));

    Future.delayed(
      const Duration(milliseconds: 2400),
      _alarmChannelService.closeApp,
    );
  }

  Future<void> _onDismissed(
    AlarmDismissed event,
    Emitter<AlarmState> emit,
  ) async {
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
    // Ensure audio stops even if the widget tree is torn down unexpectedly.
    _alarmChannelService.stopRingtone();
    _ttsService.stop();
    return super.close();
  }
}
