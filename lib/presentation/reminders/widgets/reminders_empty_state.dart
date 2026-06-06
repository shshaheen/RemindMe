import 'package:flutter/material.dart';

/// Illustrated placeholder shown when there are no reminders.
class RemindersEmptyState extends StatelessWidget {
  const RemindersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 84,
              color: Theme.of(context).colorScheme.primary.withAlpha(80),
            ),
            const SizedBox(height: 16),
            Text(
              'No Reminders Yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the "+" button below to set your first secure local reminder.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
