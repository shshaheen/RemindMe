import 'package:flutter/material.dart';

/// Gradient welcome card showing today's date and the total reminder count.
///
/// Accepts [reminderCount] so the parent can feed it from a [BlocSelector],
/// keeping this widget purely presentational and easy to test.
class RemindersHeaderCard extends StatelessWidget {
  final bool isDarkMode;
  final int reminderCount;

  static const _dayImage = AssetImage('assets/images/day_sky.jpg');
  static const _nightImage = AssetImage('assets/images/night_sky.jpg');

  const RemindersHeaderCard({
    super.key,
    required this.isDarkMode,
    required this.reminderCount,
  });

  String _formattedDate() {
    final now = DateTime.now();
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      'Friday', 'Saturday', 'Sunday',
    ];
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${weekdays[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  String _countLabel() {
    if (reminderCount == 0) return 'No reminders scheduled';
    if (reminderCount == 1) return '1 active reminder';
    return '$reminderCount active reminders';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: isDarkMode ? _nightImage : _dayImage,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formattedDate(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.85),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 14,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Secure',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Your Reminders',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _countLabel(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
