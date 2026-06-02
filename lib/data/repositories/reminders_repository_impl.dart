import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminders_repository.dart';
import '../datasources/reminders_local_data_source.dart';
import '../models/reminder_model.dart';

class RemindersRepositoryImpl implements RemindersRepository {
  final RemindersLocalDataSource localDataSource;

  RemindersRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Reminder>> getAllReminders() async {
    final models = await localDataSource.getCachedReminders();
    final domainList = models.map((m) => m.toDomain()).toList();
    // Sort chronologically (nearest/upcoming reminder first)
    domainList.sort((a, b) => a.reminderDateTime.compareTo(b.reminderDateTime));
    return domainList;
  }

  @override
  Future<void> addReminder(Reminder reminder) async {
    final model = ReminderModel.fromDomain(reminder);
    await localDataSource.cacheReminder(model);
  }

  @override
  Future<void> updateReminder(Reminder reminder) async {
    final model = ReminderModel.fromDomain(reminder);
    await localDataSource.cacheReminder(model);
  }

  @override
  Future<void> deleteReminder(String id) async {
    await localDataSource.deleteCachedReminder(id);
  }

  @override
  Future<List<Reminder>> searchReminders(String query) async {
    final allReminders = await getAllReminders();
    if (query.isEmpty) return allReminders;
    final lowerQuery = query.toLowerCase();
    return allReminders.where((reminder) {
      return reminder.title.toLowerCase().contains(lowerQuery) ||
          reminder.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
