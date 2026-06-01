import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/services/notification_service.dart';
import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminders_repository.dart';
import '../datasources/reminders_local_data_source.dart';
import '../models/reminder_model.dart';

class RemindersRepositoryImpl implements RemindersRepository {
  final RemindersLocalDataSource localDataSource;
  final NotificationService notificationService;

  RemindersRepositoryImpl({
    required this.localDataSource,
    required this.notificationService,
  });

  @override
  Future<Either<Failure, List<Reminder>>> getReminders() async {
    try {
      final models = await localDataSource.getCachedReminders();
      final domainList = models.map((m) => m.toDomain()).toList();
      return Right(domainList);
    } catch (e) {
      return Left(CacheFailure('Failed to load reminders from database: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> saveReminder(Reminder reminder) async {
    try {
      final model = ReminderModel.fromDomain(reminder);
      await localDataSource.cacheReminder(model);

      if (reminder.isEnabled) {
        // Schedule timezone-aware local notification
        await notificationService.scheduleNotification(
          id: reminder.id,
          title: reminder.title,
          body: reminder.body,
          scheduledDate: reminder.dateTime,
        );
      } else {
        // Cancel notification alarm if disabled
        await notificationService.cancelNotification(reminder.id);
      }
      return const Right(null);
    } catch (e) {
      return Left(NotificationFailure('Failed to schedule local alarm system: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReminder(int id) async {
    try {
      await localDataSource.deleteCachedReminder(id);
      await notificationService.cancelNotification(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear reminder records: ${e.toString()}'));
    }
  }
}
