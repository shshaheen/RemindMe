import 'package:flutter/material.dart';
import '../../../core/enums/reminder_filter.dart';

/// Horizontally scrollable row of filter chips.
///
/// Purely presentational — the parent owns all state and dispatch.
class ReminderFilterChips extends StatelessWidget {
  final ReminderFilter activeFilter;
  final void Function(ReminderFilter filter) onFilterSelected;

  const ReminderFilterChips({
    super.key,
    required this.activeFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: ReminderFilter.values.map((filter) {
          final isSelected = filter == activeFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filter.label),
              selected: isSelected,
              onSelected: (_) => onFilterSelected(filter),
              backgroundColor: colorScheme.surfaceVariant.withOpacity(0.4),
              selectedColor: colorScheme.primary,
              checkmarkColor: colorScheme.onPrimary,
              labelStyle: TextStyle(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.outline.withOpacity(0.2),
                ),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
          );
        }).toList(),
      ),
    );
  }
}
