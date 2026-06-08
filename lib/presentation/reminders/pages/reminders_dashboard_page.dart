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

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: _buildAppBar(context),
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
        child: Column(
          children: [
            _buildSearchBar(context),

            // Filter chips — BlocSelector rebuilds only when activeFilter changes
            BlocSelector<RemindersBloc, RemindersState, ReminderFilter>(
              selector: (state) => state.maybeWhen(
                loaded: (_, filter) => filter,
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

            // Header card — BlocSelector rebuilds only when count or filter changes
            BlocSelector<RemindersBloc, RemindersState, (int, ReminderFilter)>(
              selector: (state) => state.maybeWhen(
                loaded: (reminders, filter) => (reminders.length, filter),
                orElse: () => (0, ReminderFilter.all),
              ),
              builder: (_, record) => RemindersHeaderCard(
                isDarkMode: isDarkMode,
                reminderCount: record.$1,
                activeFilter: record.$2,
              ),
            ),

            // Reactive list area
            Expanded(
              child: RemindersListView(
                isDarkMode: isDarkMode,
                onEdit: _onEdit,
                onDelete: _onDelete,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFab(context, isDarkMode),
    );
  }

  // ── Private build helpers ──────────────────────────────────────────────────

  AppBar _buildAppBar(BuildContext context) {
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
