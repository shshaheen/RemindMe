import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/reminder_filter.dart';
import '../../../domain/entities/reminder.dart';
import '../../../domain/repositories/reminders_repository.dart';
import '../../../domain/usecases/filter_reminders.dart';
import 'reminders_event.dart';
import 'reminders_state.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  final RemindersRepository repository;
  final FilterRemindersUseCase filterReminders;

  /// Full unfiltered list fetched from the repository.
  List<Reminder> _allReminders = [];

  /// Currently active date filter — preserved across add/update/delete reloads.
  ReminderFilter _activeFilter = ReminderFilter.all;

  /// Current search query — preserved across filter changes.
  String _activeQuery = '';

  RemindersBloc({required this.repository, required this.filterReminders})
    : super(const RemindersState.initial()) {
    on<RemindersEvent>((event, emit) async {
      await event.map(
        loadReminders: (e) async => _onLoadReminders(e, emit),
        addReminder: (e) async => _onAddReminder(e, emit),
        updateReminder: (e) async => _onUpdateReminder(e, emit),
        deleteReminder: (e) async => _onDeleteReminder(e, emit),
        searchReminders: (e) async => _onSearchReminders(e, emit),
        snoozeReminder: (e) async => _onSnoozeReminder(e, emit),
        filterChanged: (e) async => _onFilterChanged(e, emit),
      );
    });
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  /// Computes the filtered list from [_allReminders] using the current
  /// [_activeFilter] and [_activeQuery], then emits a [RemindersLoaded] state.
  /// Never emits a loading flash — only call after [_allReminders] is populated.
  void _emitFiltered(Emitter<RemindersState> emit) {
    final filtered = filterReminders(
      reminders: _allReminders,
      filter: _activeFilter,
      query: _activeQuery,
    );
    emit(
      RemindersState.loaded(reminders: filtered, activeFilter: _activeFilter),
    );
  }

  // ---------------------------------------------------------------------------
  // Event handlers
  // ---------------------------------------------------------------------------

  Future<void> _onLoadReminders(
    LoadReminders event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to load reminders: $e'));
    }
  }

  Future<void> _onAddReminder(
    AddReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.addReminder(event.reminder);
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to add reminder: $e'));
    }
  }

  Future<void> _onUpdateReminder(
    UpdateReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.updateReminder(event.reminder);
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to update reminder: $e'));
    }
  }

  Future<void> _onDeleteReminder(
    DeleteReminder event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      await repository.deleteReminder(event.id);
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to delete reminder: $e'));
    }
  }

  /// Updates [_activeQuery] and re-filters without touching the repository.
  Future<void> _onSearchReminders(
    SearchReminders event,
    Emitter<RemindersState> emit,
  ) async {
    _activeQuery = event.query;
    _emitFiltered(emit);
  }

  /// Updates [_activeFilter] and re-filters without touching the repository.
  Future<void> _onFilterChanged(
    FilterChanged event,
    Emitter<RemindersState> emit,
  ) async {
    _activeFilter = event.filter;
    _emitFiltered(emit);
  }

  Future<void> _onSnoozeReminder(
    SnoozeReminder event,
    Emitter<RemindersState> emit,
  ) async {
    try {
      await repository.snoozeReminder(event.reminderId);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to snooze reminder: $e'));
    }
  }
}
