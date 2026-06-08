import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../domain/entities/reminder.dart';

/// Glassmorphism card representing a single reminder in the list.
///
/// All user actions are surfaced as callbacks so the widget stays purely
/// presentational and the page controls all Bloc dispatch.
///
/// ### Normal mode
/// - Long-press → [onLongPress] (enters selection mode in the parent).
/// - Popup menu → Edit / Delete.
///
/// ### Selection mode
/// - Tap → [onToggleSelect].
/// - Checkbox indicator shown; popup menu hidden.
/// - Selected cards receive a primary-colour highlight overlay.
class ReminderListTile extends StatelessWidget {
  final Reminder reminder;
  final bool isDarkMode;

  /// Called when the user selects "Edit" from the popup menu (normal mode).
  final VoidCallback onEdit;

  /// Called **after** the user confirms single-item deletion (normal mode).
  final VoidCallback onDelete;

  /// Whether the list is currently in multi-selection mode.
  final bool isSelectionMode;

  /// Whether this specific card is currently selected.
  final bool isSelected;

  /// Called on long-press in normal mode to enter selection mode.
  final VoidCallback onLongPress;

  /// Called on tap in selection mode to toggle this card's selection.
  final VoidCallback onToggleSelect;

  const ReminderListTile({
    super.key,
    required this.reminder,
    required this.isDarkMode,
    required this.onEdit,
    required this.onDelete,
    this.isSelectionMode = false,
    this.isSelected = false,
    required this.onLongPress,
    required this.onToggleSelect,
  });

  // ── Date / time helpers ────────────────────────────────────────────────────

  static String _formatDate(DateTime dt) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  static String _formatTime(DateTime dt) {
    final hour = dt.hour == 0 ? 12 : (dt.hour > 12 ? dt.hour - 12 : dt.hour);
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  // ── Delete confirmation ────────────────────────────────────────────────────

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Reminder'),
        content: const Text(
          'Are you sure you want to permanently delete this reminder?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogCtx).pop();
              onDelete();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onLongPress: isSelectionMode ? null : onLongPress,
      onTap: isSelectionMode ? onToggleSelect : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDarkMode
                    ? [
                        Colors.white.withOpacity(0.10),
                        Colors.white.withOpacity(0.03),
                      ]
                    : [
                        colorScheme.primary.withOpacity(0.06),
                        Colors.white.withOpacity(0.55),
                      ],
              ),
              border: Border.all(
                color: isSelected
                    ? colorScheme.primary.withOpacity(0.7)
                    : isDarkMode
                    ? Colors.white.withOpacity(0.15)
                    : colorScheme.primary.withOpacity(0.22),
                width: isSelected ? 1.8 : 1.2,
              ),
              boxShadow: isDarkMode
                  ? []
                  : [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
            ),
            child: Stack(
              children: [
                // Glass reflection highlight
                Positioned(
                  top: -40,
                  left: -20,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.08)
                          : colorScheme.primary.withOpacity(0.06),
                    ),
                  ),
                ),

                // Selection highlight overlay
                if (isSelected)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: colorScheme.primary.withOpacity(0.10),
                      ),
                    ),
                  ),

                _CardContent(
                  reminder: reminder,
                  onEdit: onEdit,
                  onDelete: () => _showDeleteDialog(context),
                  isSelectionMode: isSelectionMode,
                  isSelected: isSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Private inner widget for the card body ─────────────────────────────────

class _CardContent extends StatelessWidget {
  final Reminder reminder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool isSelectionMode;
  final bool isSelected;

  const _CardContent({
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
    required this.isSelectionMode,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Selection indicator (visible only in selection mode) ────────────
          if (isSelectionMode) ...[
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 12),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: isSelected
                    ? Icon(
                        Icons.check_circle_rounded,
                        key: const ValueKey('checked'),
                        color: colorScheme.primary,
                        size: 24,
                      )
                    : Icon(
                        Icons.radio_button_unchecked_rounded,
                        key: const ValueKey('unchecked'),
                        color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                        size: 24,
                      ),
              ),
            ),
          ],

          // ── Main content ───────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        reminder.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                      ),
                    ),
                    // Hide popup menu in selection mode
                    if (!isSelectionMode)
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_vert,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onSelected: (value) {
                            if (value == 'edit') onEdit();
                            if (value == 'delete') onDelete();
                          },
                          itemBuilder: (_) => const [
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  Icon(Icons.edit_outlined, size: 20),
                                  SizedBox(width: 12),
                                  Text('Edit'),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outline_rounded,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                if (reminder.description.isNotEmpty) ...[
                  Text(
                    reminder.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                _DateTimeChip(dateTime: reminder.reminderDateTime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Date/time pill ─────────────────────────────────────────────────────────

class _DateTimeChip extends StatelessWidget {
  final DateTime dateTime;
  const _DateTimeChip({required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFF3F9DED).withOpacity(0.12),
        border: Border.all(color: const Color(0xFF3F9DED).withOpacity(0.20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.schedule_rounded,
            size: 15,
            color: Color(0xFF3F9DED),
          ),
          const SizedBox(width: 8),
          Text(
            '${ReminderListTile._formatDate(dateTime)} • ${ReminderListTile._formatTime(dateTime)}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3F9DED),
            ),
          ),
        ],
      ),
    );
  }
}
