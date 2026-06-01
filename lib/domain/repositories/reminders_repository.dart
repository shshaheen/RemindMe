import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/reminder.dart';

abstract class RemindersRepository {
  /// Loads all reminders stored locally
  Future<Either<Failure, List<Reminder>>> getReminders();

  /// Saves a reminder, updating or adding it to storage and triggering notifications
  Future<Either<Failure, void>> saveReminder(Reminder reminder);

  /// Deletes a reminder, clearing notifications and storage
  Future<Either<Failure, void>> deleteReminder(int id);
}
