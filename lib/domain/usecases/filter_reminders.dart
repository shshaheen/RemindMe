import '../../core/enums/reminder_filter.dart';
import '../entities/reminder.dart';

/// Pure domain use case that applies a [ReminderFilter] and an optional text
/// [query] to a list of [Reminder] objects.
///
/// No repository dependency — the caller supplies the full list so this class
/// remains stateless and trivially testable.
class FilterRemindersUseCase {
  const FilterRemindersUseCase();

  /// Returns the subset of [reminders] that match [filter] AND [query].
  ///
  /// Filtering order:
  ///   1. Apply the date-based [filter] window.
  ///   2. Apply the case-insensitive text [query] (title or description).
  List<Reminder> call({
    required List<Reminder> reminders,
    required ReminderFilter filter,
    String query = '',
  }) {
    final dateFiltered = _applyDateFilter(reminders, filter);
    return _applyTextSearch(dateFiltered, query);
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  List<Reminder> _applyDateFilter(
    List<Reminder> reminders,
    ReminderFilter filter,
  ) {
    if (filter == ReminderFilter.all) return reminders;

    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = todayStart.add(const Duration(days: 1));
    final tomorrowStart = todayEnd;
    final tomorrowEnd = tomorrowStart.add(const Duration(days: 1));
    final weekEnd = todayStart.add(const Duration(days: 7));

    return reminders.where((r) {
      final dt = r.reminderDateTime;
      switch (filter) {
        case ReminderFilter.all:
          return true;
        case ReminderFilter.today:
          return dt.isAfter(todayStart.subtract(const Duration(microseconds: 1))) &&
              dt.isBefore(todayEnd);
        case ReminderFilter.tomorrow:
          return dt.isAfter(tomorrowStart.subtract(const Duration(microseconds: 1))) &&
              dt.isBefore(tomorrowEnd);
        case ReminderFilter.thisWeek:
          return dt.isAfter(todayStart.subtract(const Duration(microseconds: 1))) &&
              dt.isBefore(weekEnd);
        case ReminderFilter.upcoming:
          return dt.isAfter(todayStart.subtract(const Duration(microseconds: 1)));
      }
    }).toList();
  }

  List<Reminder> _applyTextSearch(List<Reminder> reminders, String query) {
    if (query.isEmpty) return reminders;
    final lower = query.toLowerCase();
    return reminders.where((r) {
      return r.title.toLowerCase().contains(lower) ||
          r.description.toLowerCase().contains(lower);
    }).toList();
  }
}
