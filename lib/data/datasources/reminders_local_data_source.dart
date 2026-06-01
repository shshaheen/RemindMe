import '../models/reminder_model.dart';

abstract class RemindersLocalDataSource {
  /// Retrieves all stored reminder models from local cache
  Future<List<ReminderModel>> getCachedReminders();

  /// Writes/updates a reminder model inside local cache
  Future<void> cacheReminder(ReminderModel reminder);

  /// Deletes a reminder model from local cache using id
  Future<void> deleteCachedReminder(int id);
}

class RemindersLocalDataSourceImpl implements RemindersLocalDataSource {
  const RemindersLocalDataSourceImpl();

  @override
  Future<List<ReminderModel>> getCachedReminders() async {
    // Logic to fetch from Hive remindersBox
    return const [];
  }

  @override
  Future<void> cacheReminder(ReminderModel reminder) async {
    // Logic to write/put inside Hive remindersBox
  }

  @override
  Future<void> deleteCachedReminder(int id) async {
    // Logic to delete key from Hive remindersBox
  }
}
