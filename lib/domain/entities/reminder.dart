class Reminder {
  final int id;
  final String title;
  final String body;
  final DateTime dateTime;
  final bool isEnabled;

  const Reminder({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.isEnabled,
  });

  /// standard copy helper
  Reminder copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? dateTime,
    bool? isEnabled,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      dateTime: dateTime ?? this.dateTime,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reminder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          body == other.body &&
          dateTime == other.dateTime &&
          isEnabled == other.isEnabled;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      body.hashCode ^
      dateTime.hashCode ^
      isEnabled.hashCode;

  @override
  String toString() =>
      'Reminder(id: $id, title: $title, body: $body, dateTime: $dateTime, isEnabled: $isEnabled)';
}
