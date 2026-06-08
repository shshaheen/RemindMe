import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/enums/reminder_filter.dart';
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

  const factory RemindersEvent.snoozeReminder({required String reminderId}) =
      SnoozeReminder;

  const factory RemindersEvent.filterChanged({required ReminderFilter filter}) =
      FilterChanged;

  /// Enter selection mode with [firstSelectedId] pre-selected.
  const factory RemindersEvent.enterSelectionMode({
    required String firstSelectedId,
  }) = EnterSelectionMode;

  /// Toggle the selected state of a single reminder while in selection mode.
  const factory RemindersEvent.toggleReminderSelection({required String id}) =
      ToggleReminderSelection;

  /// Clear all selections and exit selection mode.
  const factory RemindersEvent.clearSelection() = ClearSelection;

  /// Delete all currently selected reminders (after confirmation in the UI).
  const factory RemindersEvent.bulkDeleteReminders() = BulkDeleteReminders;
}
