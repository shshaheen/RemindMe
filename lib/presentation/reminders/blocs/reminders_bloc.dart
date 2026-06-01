import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/reminders_repository.dart';
import '../../../domain/usecases/create_reminder_use_case.dart';
import 'reminders_event.dart';
import 'reminders_state.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  final RemindersRepository repository;
  final CreateReminderUseCase createReminderUseCase;

  RemindersBloc({
    required this.repository,
    required this.createReminderUseCase,
  }) : super(const RemindersState.initial()) {
    on<RemindersEvent>((event, emit) async {
      await event.map(
        started: (e) async => _onStarted(e, emit),
        reminderAdded: (e) async => _onReminderAdded(e, emit),
        reminderDeleted: (e) async => _onReminderDeleted(e, emit),
      );
    });
  }

  Future<void> _onStarted(RemindersStarted event, Emitter<RemindersState> emit) async {
    emit(const RemindersState.loading());
    final result = await repository.getReminders();
    result.fold(
      (failure) => emit(RemindersState.error(message: failure.message)),
      (reminders) => emit(RemindersState.loaded(reminders: reminders)),
    );
  }
 
  Future<void> _onReminderAdded(ReminderAdded event, Emitter<RemindersState> emit) async {
    emit(const RemindersState.loading());
    final result = await createReminderUseCase(
      CreateReminderParams(reminder: event.reminder),
    );
 
    await result.fold(
      (failure) async => emit(RemindersState.error(message: failure.message)),
      (success) async => add(const RemindersEvent.started()),
    );
  }
 
  Future<void> _onReminderDeleted(ReminderDeleted event, Emitter<RemindersState> emit) async {
    emit(const RemindersState.loading());
    final result = await repository.deleteReminder(event.id);
 
    await result.fold(
      (failure) async => emit(RemindersState.error(message: failure.message)),
      (success) async => add(const RemindersEvent.started()),
    );
  }
}
