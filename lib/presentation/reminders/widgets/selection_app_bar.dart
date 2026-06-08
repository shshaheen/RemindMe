import 'package:flutter/material.dart';

/// AppBar shown when the reminder list is in multi-selection mode.
///
/// Implements [PreferredSizeWidget] so it can be dropped directly into
/// [Scaffold.appBar] without any wrapper.
class SelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Number of reminders currently selected.
  final int selectedCount;

  /// Called when the user taps the delete icon. The parent is responsible
  /// for showing the confirmation dialog before dispatching the Bloc event.
  final VoidCallback onDelete;

  /// Called when the user taps the close icon — clears selection and exits
  /// selection mode.
  final VoidCallback onClearSelection;

  const SelectionAppBar({
    super.key,
    required this.selectedCount,
    required this.onDelete,
    required this.onClearSelection,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      elevation: 0,
      backgroundColor: colorScheme.primaryContainer,
      leading: IconButton(
        icon: const Icon(Icons.close),
        tooltip: 'Clear selection',
        onPressed: onClearSelection,
      ),
      title: Text(
        '$selectedCount ${selectedCount == 1 ? 'Selected' : 'Selected'}',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          tooltip: 'Delete selected',
          onPressed: selectedCount > 0 ? onDelete : null,
        ),
      ],
    );
  }
}
