import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/reminder.dart';

part 'reminders_event.freezed.dart';

@freezed
class RemindersEvent with _$RemindersEvent {
  const factory RemindersEvent.started() = RemindersStarted;
  const factory RemindersEvent.reminderAdded({required Reminder reminder}) = ReminderAdded;
  const factory RemindersEvent.reminderDeleted({required int id}) = ReminderDeleted;
}
