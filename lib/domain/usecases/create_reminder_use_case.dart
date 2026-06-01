import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/reminder.dart';
import '../repositories/reminders_repository.dart';

class CreateReminderParams {
  final Reminder reminder;

  const CreateReminderParams({required this.reminder});
}

class CreateReminderUseCase {
  final RemindersRepository repository;

  const CreateReminderUseCase(this.repository);

  /// Executes saving transaction in reminders database layer
  Future<Either<Failure, void>> call(CreateReminderParams params) async {
    return await repository.saveReminder(params.reminder);
  }
}
