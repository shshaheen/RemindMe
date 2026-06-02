import '../models/reminder_model.dart';
import '../../core/services/hive_service.dart';

abstract class RemindersLocalDataSource {
  /// Retrieves all stored reminder models from local cache
  Future<List<ReminderModel>> getCachedReminders();

  /// Writes/updates a reminder model inside local cache
  Future<void> cacheReminder(ReminderModel reminder);

  /// Deletes a reminder model from local cache using a String id
  Future<void> deleteCachedReminder(String id);
}

class RemindersLocalDataSourceImpl implements RemindersLocalDataSource {
  const RemindersLocalDataSourceImpl();

  @override
  Future<List<ReminderModel>> getCachedReminders() async {
    final box = HiveService.remindersBox;
    return box.values.cast<ReminderModel>().toList();
  }

  @override
  Future<void> cacheReminder(ReminderModel reminder) async {
    final box = HiveService.remindersBox;
    await box.put(reminder.id, reminder);
  }

  @override
  Future<void> deleteCachedReminder(String id) async {
    final box = HiveService.remindersBox;
    await box.delete(id);
  }
}
