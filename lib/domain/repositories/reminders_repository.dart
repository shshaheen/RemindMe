import '../entities/reminder.dart';

abstract class RemindersRepository {
  /// Loads all reminders stored locally, sorted chronologically (nearest first)
  Future<List<Reminder>> getAllReminders();

  /// Adds a new reminder to storage
  Future<void> addReminder(Reminder reminder);

  /// Updates an existing reminder in storage
  Future<void> updateReminder(Reminder reminder);

  /// Deletes a reminder by its String ID
  Future<void> deleteReminder(String id);

  /// Searches reminders in-memory by checking title and description (case-insensitive)
  Future<List<Reminder>> searchReminders(String query);

  /// Returns a single reminder by its unique ID, or null if not found.
  Future<Reminder?> getReminderById(String id);

  /// Snoozes a reminder by cancelling its current notification and rescheduling
  /// it [snoozeDurationMinutes] minutes from now (default: 10 min).
  Future<void> snoozeReminder(String reminderId);
}
