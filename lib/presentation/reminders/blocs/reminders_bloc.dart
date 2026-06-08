import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/reminder_filter.dart';
import '../../../domain/entities/reminder.dart';
import '../../../domain/repositories/reminders_repository.dart';
import '../../../domain/usecases/bulk_delete_reminders.dart';
import '../../../domain/usecases/filter_reminders.dart';
import 'reminders_event.dart';
import 'reminders_state.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  final RemindersRepository repository;
  final FilterRemindersUseCase filterReminders;
  final BulkDeleteRemindersUseCase bulkDeleteReminders;

  // ── Internal state ──────────────────────────────────────────────────────────

  /// Full unfiltered list fetched from the repository.
  List<Reminder> _allReminders = [];

  /// Currently active date filter — preserved across filter/search changes.
  ReminderFilter _activeFilter = ReminderFilter.all;

  /// Current search query — preserved across filter changes.
  String _activeQuery = '';

  /// Whether the UI is in multi-selection mode.
  bool _isSelectionMode = false;

  /// IDs of reminders currently selected by the user.
  Set<String> _selectedReminderIds = {};

  RemindersBloc({
    required this.repository,
    required this.filterReminders,
    required this.bulkDeleteReminders,
  }) : super(const RemindersState.initial()) {
    on<RemindersEvent>((event, emit) async {
      await event.map(
        loadReminders: (e) async => _onLoadReminders(e, emit),
        addReminder: (e) async => _onAddReminder(e, emit),
        updateReminder: (e) async => _onUpdateReminder(e, emit),
        deleteReminder: (e) async => _onDeleteReminder(e, emit),
        searchReminders: (e) async => _onSearchReminders(e, emit),
        snoozeReminder: (e) async => _onSnoozeReminder(e, emit),
        filterChanged: (e) async => _onFilterChanged(e, emit),
        enterSelectionMode: (e) async => _onEnterSelectionMode(e, emit),
        toggleReminderSelection: (e) async =>
            _onToggleReminderSelection(e, emit),
        clearSelection: (e) async => _onClearSelection(e, emit),
        bulkDeleteReminders: (e) async => _onBulkDeleteReminders(e, emit),
      );
    });
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  /// Applies the current filter + query to [_allReminders] and emits a loaded
  /// state — never triggers a loading flash.
  ///
  /// Pass [clearSelection: true] when a data operation (load/add/update/delete)
  /// should exit selection mode automatically.
  void _emitFiltered(
    Emitter<RemindersState> emit, {
    bool clearSelection = false,
  }) {
    if (clearSelection) {
      _isSelectionMode = false;
      _selectedReminderIds = {};
    }
    final filtered = filterReminders(
      reminders: _allReminders,
      filter: _activeFilter,
      query: _activeQuery,
    );
    emit(
      RemindersState.loaded(
        reminders: filtered,
        activeFilter: _activeFilter,
        isSelectionMode: _isSelectionMode,
        selectedReminderIds: Set<String>.unmodifiable(_selectedReminderIds),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Data operation handlers — all clear selection on completion
  // ---------------------------------------------------------------------------

  Future<void> _onLoadReminders(
    LoadReminders event,
    Emitter<RemindersState> emit,
  ) async {
    emit(const RemindersState.loading());
    try {
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit, clearSelection: true);
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
      _emitFiltered(emit, clearSelection: true);
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
      _emitFiltered(emit, clearSelection: true);
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
      _emitFiltered(emit, clearSelection: true);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to delete reminder: $e'));
    }
  }

  // ---------------------------------------------------------------------------
  // Filter / search handlers — preserve selection
  // ---------------------------------------------------------------------------

  Future<void> _onSearchReminders(
    SearchReminders event,
    Emitter<RemindersState> emit,
  ) async {
    _activeQuery = event.query;
    _emitFiltered(emit);
  }

  Future<void> _onFilterChanged(
    FilterChanged event,
    Emitter<RemindersState> emit,
  ) async {
    _activeFilter = event.filter;
    _emitFiltered(emit);
  }

  // ---------------------------------------------------------------------------
  // Selection handlers
  // ---------------------------------------------------------------------------

  Future<void> _onEnterSelectionMode(
    EnterSelectionMode event,
    Emitter<RemindersState> emit,
  ) async {
    _isSelectionMode = true;
    _selectedReminderIds = {event.firstSelectedId};
    _emitFiltered(emit);
  }

  Future<void> _onToggleReminderSelection(
    ToggleReminderSelection event,
    Emitter<RemindersState> emit,
  ) async {
    if (_selectedReminderIds.contains(event.id)) {
      _selectedReminderIds.remove(event.id);
      // Auto-exit when the last selection is removed.
      if (_selectedReminderIds.isEmpty) _isSelectionMode = false;
    } else {
      _selectedReminderIds.add(event.id);
    }
    _emitFiltered(emit);
  }

  Future<void> _onClearSelection(
    ClearSelection event,
    Emitter<RemindersState> emit,
  ) async {
    _emitFiltered(emit, clearSelection: true);
  }

  Future<void> _onBulkDeleteReminders(
    BulkDeleteReminders event,
    Emitter<RemindersState> emit,
  ) async {
    if (_selectedReminderIds.isEmpty) return;
    final idsToDelete = Set<String>.from(_selectedReminderIds);
    emit(const RemindersState.loading());
    try {
      await bulkDeleteReminders(ids: idsToDelete);
      _allReminders = await repository.getAllReminders();
      _emitFiltered(emit, clearSelection: true);
    } catch (e) {
      emit(RemindersState.error(message: 'Failed to delete reminders: $e'));
    }
  }

  // ---------------------------------------------------------------------------
  // Snooze
  // ---------------------------------------------------------------------------

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
