import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/reminder.dart';
import '../blocs/reminders_bloc.dart';
import '../blocs/reminders_state.dart';
import 'reminder_list_tile.dart';
import 'reminders_empty_state.dart';

/// Reactive list area that maps every [RemindersState] to the correct UI.
///
/// [onEdit] and [onDelete] are callbacks so this widget stays presentational
/// while the page owns Bloc dispatch.
class RemindersListView extends StatelessWidget {
  final bool isDarkMode;

  /// Called with the full [Reminder] when the user selects "Edit".
  final void Function(Reminder reminder) onEdit;

  /// Called with the reminder [id] after the user confirms deletion.
  final void Function(String id) onDelete;

  const RemindersListView({
    super.key,
    required this.isDarkMode,
    required this.onEdit,
    required this.onDelete,
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
          loaded: (reminders) {
            if (reminders.isEmpty) return const RemindersEmptyState();

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: reminders.length,
              itemBuilder: (_, index) {
                final reminder = reminders[index];
                return ReminderListTile(
                  key: ValueKey(reminder.id),
                  reminder: reminder,
                  isDarkMode: isDarkMode,
                  onEdit: () => onEdit(reminder),
                  onDelete: () => onDelete(reminder.id),
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
