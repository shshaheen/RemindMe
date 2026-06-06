import '../models/reminder_model.dart';
import '../../core/services/hive_service.dart';

abstract class RemindersLocalDataSource {
  /// Retrieves all stored reminder models from local cache
  Future<List<ReminderModel>> getCachedReminders();

  /// Retrieves a single reminder model by its unique ID, or null if not found.
  Future<ReminderModel?> getCachedReminderById(String id);

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
  Future<ReminderModel?> getCachedReminderById(String id) async {
    final box = HiveService.remindersBox;
    return box.get(id) as ReminderModel?;
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
