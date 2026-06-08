import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/enums/reminder_filter.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/entities/app_settings.dart';
import '../../../domain/entities/reminder.dart';
import '../../settings/blocs/settings_bloc.dart';
import '../../settings/blocs/settings_event.dart';
import '../../settings/blocs/settings_state.dart';
import '../blocs/reminders_bloc.dart';
import '../blocs/reminders_event.dart';
import '../blocs/reminders_state.dart';
import '../widgets/reminder_filter_chips.dart';
import '../widgets/reminders_header_card.dart';
import '../widgets/reminders_list_view.dart';
import '../widgets/selection_app_bar.dart';

class RemindersDashboardPage extends StatefulWidget {
  const RemindersDashboardPage({super.key});

  @override
  State<RemindersDashboardPage> createState() => _RemindersDashboardPageState();
}

class _RemindersDashboardPageState extends State<RemindersDashboardPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RemindersBloc>().add(const RemindersEvent.loadReminders());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ── Bloc dispatchers ───────────────────────────────────────────────────────

  void _onSearchChanged(String query) => context.read<RemindersBloc>().add(
    RemindersEvent.searchReminders(query: query),
  );

  void _onFilterChanged(ReminderFilter filter) => context
      .read<RemindersBloc>()
      .add(RemindersEvent.filterChanged(filter: filter));

  void _onEdit(Reminder reminder) =>
      context.push(AppRouter.editReminderScreen, extra: reminder);

  void _onDelete(String id) =>
      context.read<RemindersBloc>().add(RemindersEvent.deleteReminder(id: id));

  void _onLongPress(String id) => context.read<RemindersBloc>().add(
    RemindersEvent.enterSelectionMode(firstSelectedId: id),
  );

  void _onToggleSelect(String id) => context.read<RemindersBloc>().add(
    RemindersEvent.toggleReminderSelection(id: id),
  );

  void _onClearSelection() =>
      context.read<RemindersBloc>().add(const RemindersEvent.clearSelection());

  /// Shows the bulk-delete confirmation dialog; only dispatches the Bloc event
  /// after the user explicitly confirms.
  Future<void> _onBulkDeleteConfirmation() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Reminders'),
        content: const Text(
          'Are you sure you want to delete the selected reminders?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(true),
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      context.read<RemindersBloc>().add(
        const RemindersEvent.bulkDeleteReminders(),
      );
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // BlocSelector tracks only isSelectionMode so PopScope only rebuilds on
    // mode transitions — not on every list or filter state change.
    return BlocSelector<RemindersBloc, RemindersState, bool>(
      selector: (state) => state.maybeWhen(
        loaded: (_, __, isSelectionMode, ___) => isSelectionMode,
        orElse: () => false,
      ),
      builder: (_, isSelectionMode) => PopScope(
        // Allow the OS back button to pop only when NOT in selection mode.
        canPop: !isSelectionMode,
        onPopInvokedWithResult: (didPop, __) {
          // didPop is false when canPop was false — intercept to exit selection.
          if (!didPop) _onClearSelection();
        },
        child: Scaffold(
          // ── AppBar switches between normal and selection mode ───────────────────
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: BlocSelector<RemindersBloc, RemindersState, (bool, int)>(
              selector: (state) => state.maybeWhen(
                loaded: (_, __, isSelectionMode, selectedIds) =>
                    (isSelectionMode, selectedIds.length),
                orElse: () => (false, 0),
              ),
              builder: (_, selection) {
                final (isSelectionMode, count) = selection;
                if (isSelectionMode) {
                  return SelectionAppBar(
                    selectedCount: count,
                    onDelete: _onBulkDeleteConfirmation,
                    onClearSelection: _onClearSelection,
                  );
                }
                return _buildNormalAppBar(context);
              },
            ),
          ),

          body: Container(
            // Light mode: the gradient gives BackdropFilter a coloured surface to
            // blur against — without it cards blur white-on-white (invisible).
            decoration: BoxDecoration(
              gradient: isDarkMode
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF14213D), Color(0xFF1B263B)],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        const Color(0xFFF5F2FF),
                      ],
                    ),
            ),
            // ── Body collapses search/filter/header during selection mode ──────────
            child: BlocSelector<RemindersBloc, RemindersState, bool>(
              selector: (state) => state.maybeWhen(
                loaded: (_, __, isSelectionMode, ___) => isSelectionMode,
                orElse: () => false,
              ),
              builder: (_, isSelectionMode) => Column(
                children: [
                  if (!isSelectionMode) ...[
                    _buildSearchBar(context),

                    // Filter chips
                    BlocSelector<RemindersBloc, RemindersState, ReminderFilter>(
                      selector: (state) => state.maybeWhen(
                        loaded: (_, filter, __, ___) => filter,
                        orElse: () => ReminderFilter.all,
                      ),
                      builder: (_, activeFilter) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ReminderFilterChips(
                          activeFilter: activeFilter,
                          onFilterSelected: _onFilterChanged,
                        ),
                      ),
                    ),

                    // Header card
                    BlocSelector<
                      RemindersBloc,
                      RemindersState,
                      (int, ReminderFilter)
                    >(
                      selector: (state) => state.maybeWhen(
                        loaded: (reminders, filter, __, ___) =>
                            (reminders.length, filter),
                        orElse: () => (0, ReminderFilter.all),
                      ),
                      builder: (_, record) => RemindersHeaderCard(
                        isDarkMode: isDarkMode,
                        reminderCount: record.$1,
                        activeFilter: record.$2,
                      ),
                    ),
                  ],

                  // Reactive list — always visible
                  Expanded(
                    child: RemindersListView(
                      isDarkMode: isDarkMode,
                      onEdit: _onEdit,
                      onDelete: _onDelete,
                      onLongPress: _onLongPress,
                      onToggleSelect: _onToggleSelect,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Hide FAB in selection mode
          floatingActionButton:
              BlocSelector<RemindersBloc, RemindersState, bool>(
                selector: (state) => state.maybeWhen(
                  loaded: (_, __, isSelectionMode, ___) => isSelectionMode,
                  orElse: () => false,
                ),
                builder: (_, isSelectionMode) => isSelectionMode
                    ? const SizedBox.shrink()
                    : _buildFab(context, isDarkMode),
              ),
        ), // closes Scaffold
      ), // closes PopScope
    ); // closes BlocSelector
  }

  // ── Private build helpers ──────────────────────────────────────────────────

  AppBar _buildNormalAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'RemindMe',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, settingsState) {
            final isDark = settingsState.maybeWhen(
              loaded: (s) => s.isDarkMode,
              orElse: () => false,
            );
            return IconButton(
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              onPressed: () {
                final current = settingsState.maybeWhen(
                  loaded: (s) => s,
                  orElse: () => const AppSettings(
                    isDarkMode: false,
                    isSoundEnabled: true,
                    isVibrationEnabled: true,
                  ),
                );
                context.read<SettingsBloc>().add(
                  SettingsEvent.themeChanged(
                    settings: current.copyWith(isDarkMode: !isDark),
                  ),
                );
              },
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () => context.push(AppRouter.changePasswordScreen),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: TextField(
        controller: _searchController,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search reminders by title or notes...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged('');
                  },
                )
              : null,
          filled: true,
          fillColor: Theme.of(
            context,
          ).colorScheme.surfaceVariant.withOpacity(0.3),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFab(BuildContext context, bool isDarkMode) {
    return FloatingActionButton(
      onPressed: () => context.push(AppRouter.addReminderScreen),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDarkMode
                ? const [Color(0xFF3F9DED), Color(0xFF1A6FBF)]
                : const [Color(0xFF56AAFF), Color(0xFF2575C4)],
          ),
        ),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }
}
