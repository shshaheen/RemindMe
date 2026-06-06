import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reminder.dart';

part 'alarm_state.freezed.dart';

/// Describes every possible UI state of the alarm screen.
@freezed
class AlarmState with _$AlarmState {
  /// Before the [AlarmBloc] has been started.
  const factory AlarmState.initial() = AlarmInitial;

  /// Reminder is being fetched from the repository.
  const factory AlarmState.loading() = AlarmLoading;

  /// Reminder loaded; ringtone is playing, waiting for user action.
  const factory AlarmState.idle({required Reminder reminder}) = AlarmIdle;

  /// User accepted — TTS is actively delivering the reminder.
  const factory AlarmState.speaking({required Reminder reminder}) = AlarmSpeaking;

  /// TTS finished — showing success confirmation.
  const factory AlarmState.delivered() = AlarmDelivered;

  /// User snoozed — showing snooze confirmation with countdown details.
  ///
  /// Named [AlarmSnoozedConfirmation] (not [AlarmSnoozed]) to avoid a name
  /// collision with the [AlarmSnoozed] event class when both are imported.
  const factory AlarmState.snoozedConfirmation({
    required int snoozedMinutes,
    required DateTime ringAt,
  }) = AlarmSnoozedConfirmation;

  /// Something went wrong loading the reminder.
  const factory AlarmState.error({required String message}) = AlarmError;
}
