class Reminder {
  final String id;
  final String title;
  final String description;
  final DateTime reminderDateTime;

  const Reminder({
    required this.id,
    required this.title,
    this.description = '',
    required this.reminderDateTime,
  });

  /// standard copy helper
  Reminder copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? reminderDateTime,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      reminderDateTime: reminderDateTime ?? this.reminderDateTime,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reminder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          reminderDateTime == other.reminderDateTime;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      reminderDateTime.hashCode;

  @override
  String toString() =>
      'Reminder(id: $id, title: $title, description: $description, reminderDateTime: $reminderDateTime)';
}
