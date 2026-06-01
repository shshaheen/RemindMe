import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reminder.dart';

part 'reminders_state.freezed.dart';

@freezed
class RemindersState with _$RemindersState {
  const factory RemindersState.initial() = _Initial;
  const factory RemindersState.loading() = _Loading;
  const factory RemindersState.loaded({required List<Reminder> reminders}) = _Loaded;
  const factory RemindersState.error({required String message}) = _Error;
}
