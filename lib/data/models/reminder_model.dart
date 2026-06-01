import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/reminder.dart';

part 'reminder_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ReminderModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final DateTime dateTime;

  @HiveField(4)
  final bool isEnabled;

  ReminderModel({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.isEnabled,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReminderModelToJson(this);

  /// Converts this data model to its pure domain Entity counterpart
  Reminder toDomain() {
    return Reminder(
      id: id,
      title: title,
      body: body,
      dateTime: dateTime,
      isEnabled: isEnabled,
    );
  }

  /// Factory constructor to convert a pure domain Entity into this serializable Data Model
  factory ReminderModel.fromDomain(Reminder reminder) {
    return ReminderModel(
      id: reminder.id,
      title: reminder.title,
      body: reminder.body,
      dateTime: reminder.dateTime,
      isEnabled: reminder.isEnabled,
    );
  }
}
