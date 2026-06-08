/// Strongly-typed filter that the user can select on the dashboard.
enum ReminderFilter {
  all,
  today,
  tomorrow,
  thisWeek,
  upcoming;

  /// Short label shown inside the filter chip.
  String get label {
    switch (this) {
      case ReminderFilter.all:
        return 'All';
      case ReminderFilter.today:
        return 'Today';
      case ReminderFilter.tomorrow:
        return 'Tomorrow';
      case ReminderFilter.thisWeek:
        return 'This Week';
      case ReminderFilter.upcoming:
        return 'Upcoming';
    }
  }

  /// Dynamic subtitle shown in the header card based on the current count.
  String subtitle(int count) {
    if (count == 0) {
      switch (this) {
        case ReminderFilter.all:
          return 'No reminders scheduled';
        case ReminderFilter.today:
          return 'Nothing scheduled for today';
        case ReminderFilter.tomorrow:
          return 'Nothing scheduled for tomorrow';
        case ReminderFilter.thisWeek:
          return 'Nothing scheduled this week';
        case ReminderFilter.upcoming:
          return 'No upcoming reminders';
      }
    }
    final noun = count == 1 ? 'reminder' : 'reminders';
    switch (this) {
      case ReminderFilter.all:
        return '$count active $noun';
      case ReminderFilter.today:
        return '$count $noun today';
      case ReminderFilter.tomorrow:
        return '$count $noun tomorrow';
      case ReminderFilter.thisWeek:
        return '$count $noun this week';
      case ReminderFilter.upcoming:
        return '$count upcoming $noun';
    }
  }
}
