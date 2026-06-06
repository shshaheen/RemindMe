import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../domain/entities/reminder.dart';

/// Glassmorphism card representing a single reminder in the list.
///
/// All user actions ([onEdit], [onDelete]) are surfaced as callbacks so
/// the widget stays purely presentational and the page controls Bloc dispatch.
class ReminderListTile extends StatelessWidget {
  final Reminder reminder;
  final bool isDarkMode;

  /// Called when the user selects "Edit" from the popup menu.
  final VoidCallback onEdit;

  /// Called **after** the user confirms deletion in the confirmation dialog.
  final VoidCallback onDelete;

  const ReminderListTile({
    super.key,
    required this.reminder,
    required this.isDarkMode,
    required this.onEdit,
    required this.onDelete,
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
    return ClipRRect(
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
                      Theme.of(context).colorScheme.primary.withOpacity(0.06),
                      Colors.white.withOpacity(0.55),
                    ],
            ),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.15)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.22),
              width: 1.2,
            ),
            boxShadow: isDarkMode
                ? []
                : [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.08),
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
                        : Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.06),
                  ),
                ),
              ),
              _CardContent(
                reminder: reminder,
                onEdit: onEdit,
                onDelete: () => _showDeleteDialog(context),
              ),
            ],
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

  const _CardContent({
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  reminder.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: 32,
                height: 32,
                child: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                          Text('Delete', style: TextStyle(color: Colors.red)),
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
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
          ],
          _DateTimeChip(dateTime: reminder.reminderDateTime),
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
