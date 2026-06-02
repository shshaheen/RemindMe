import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reminder.dart';

part 'reminders_event.freezed.dart';

@freezed
class RemindersEvent with _$RemindersEvent {
  const factory RemindersEvent.loadReminders() = LoadReminders;

  const factory RemindersEvent.addReminder({required Reminder reminder}) =
      AddReminder;

  const factory RemindersEvent.updateReminder({required Reminder reminder}) =
      UpdateReminder;

  const factory RemindersEvent.deleteReminder({required String id}) =
      DeleteReminder;

  const factory RemindersEvent.searchReminders({required String query}) =
      SearchReminders;
}
