import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/reminders_repository.dart';
import 'reminders_event.dart';
import 'reminders_state.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  final RemindersRepository repository;

  RemindersBloc({required this.repository})
    : super(const RemindersState.initial()) {
    on<RemindersEvent>((event, emit) async {
      await event.map(
        loadReminders: (e) async => _onLoadReminders(e, emit),
        addReminder: (e) async => _onAddReminder(e, emit),
        updateReminder: (e) async => _onUpdateReminder(e, emit),
        deleteReminder: (e) async => _onDeleteReminder(e, emit),
        searchReminders: (e) async => _onSearchReminders(e, emit),
        snoozeReminder: (e) async => _onSnoozeReminder(e, emit),
      );
    });
  }

  Future<void> _onLoadReminders(
    LoadReminders event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      final reminders = await repository.getAllReminders();
      emit(RemindersState.loaded(reminders: reminders));
    } catch (e) {
      emit(
        RemindersState.error(
          message: 'Failed to load reminders: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onAddReminder(
    AddReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.addReminder(event.reminder);
      add(const RemindersEvent.loadReminders());
    } catch (e) {
      emit(
        RemindersState.error(
          message: 'Failed to add reminder: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onUpdateReminder(
    UpdateReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.updateReminder(event.reminder);
      add(const RemindersEvent.loadReminders());
    } catch (e) {
      emit(
        RemindersState.error(
          message: 'Failed to update reminder: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onDeleteReminder(
    DeleteReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.deleteReminder(event.id);
      add(const RemindersEvent.loadReminders());
    } catch (e) {
      emit(
        RemindersState.error(
          message: 'Failed to delete reminder: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onSearchReminders(
    SearchReminders event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      final reminders = await repository.searchReminders(event.query);
      emit(RemindersState.loaded(reminders: reminders));
    } catch (e) {
      emit(RemindersState.error(message: 'Search failed: ${e.toString()}'));
    }
  }

  Future<void> _onSnoozeReminder(
    SnoozeReminder event,
    Emitter<RemindersState> emit,
  ) async {
    try {
      await repository.snoozeReminder(event.reminderId);
    } catch (e) {
      emit(
        RemindersState.error(
          message: 'Failed to snooze reminder: ${e.toString()}',
        ),
      );
    }
  }
}
