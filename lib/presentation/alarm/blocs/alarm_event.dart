import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_event.freezed.dart';

/// All events the [AlarmBloc] can react to.
@freezed
class AlarmEvent with _$AlarmEvent {
  /// Screen mounted — load the reminder and begin the alarm.
  const factory AlarmEvent.started({required String reminderId}) = AlarmStarted;

  /// User accepted (swiped) — stop ringtone and speak the reminder via TTS.
  const factory AlarmEvent.accepted() = AlarmAccepted;

  /// TTS engine finished speaking — mark as delivered and close.
  const factory AlarmEvent.speechFinished() = AlarmSpeechFinished;

  /// User tapped Snooze — reschedule 10 min out via the repository.
  const factory AlarmEvent.snoozed() = AlarmSnoozed;

  /// User tapped Dismiss — cancel notification and close immediately.
  const factory AlarmEvent.dismissed() = AlarmDismissed;
}
