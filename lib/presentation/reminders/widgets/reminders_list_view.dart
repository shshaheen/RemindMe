import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/reminder.dart';
import '../blocs/reminders_bloc.dart';
import '../blocs/reminders_state.dart';
import 'reminder_list_tile.dart';
import 'reminders_empty_state.dart';

/// Reactive list area that maps every [RemindersState] to the correct UI.
///
/// All action callbacks are passed down so this widget stays purely
/// presentational while the page owns all Bloc dispatch.
class RemindersListView extends StatelessWidget {
  final bool isDarkMode;

  /// Called with the full [Reminder] when the user selects "Edit" (normal mode).
  final void Function(Reminder reminder) onEdit;

  /// Called with the reminder [id] after the user confirms single deletion.
  final void Function(String id) onDelete;

  /// Called with the reminder [id] on long-press to enter selection mode.
  final void Function(String id) onLongPress;

  /// Called with the reminder [id] when the user taps a card in selection mode.
  final void Function(String id) onToggleSelect;

  const RemindersListView({
    super.key,
    required this.isDarkMode,
    required this.onEdit,
    required this.onDelete,
    required this.onLongPress,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersBloc, RemindersState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                message,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          loaded: (reminders, _, isSelectionMode, selectedReminderIds) {
            if (reminders.isEmpty) return const RemindersEmptyState();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: reminders.length,
              itemBuilder: (_, index) {
                final reminder = reminders[index];
                final isSelected = selectedReminderIds.contains(reminder.id);
                return ReminderListTile(
                  key: ValueKey(reminder.id),
                  reminder: reminder,
                  isDarkMode: isDarkMode,
                  isSelectionMode: isSelectionMode,
                  isSelected: isSelected,
                  onEdit: () => onEdit(reminder),
                  onDelete: () => onDelete(reminder.id),
                  onLongPress: () => onLongPress(reminder.id),
                  onToggleSelect: () => onToggleSelect(reminder.id),
                );
              },
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
