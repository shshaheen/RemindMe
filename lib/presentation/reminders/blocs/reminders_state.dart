import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reminder.dart';

part 'reminders_state.freezed.dart';

@freezed
class RemindersState with _$RemindersState {
  const factory RemindersState.initial() = RemindersInitial;
  const factory RemindersState.loading() = RemindersLoading;
  const factory RemindersState.loaded({required List<Reminder> reminders}) =
      RemindersLoaded;
  const factory RemindersState.error({required String message}) =
      RemindersError;
}
