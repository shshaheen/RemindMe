import 'package:hive/hive.dart';
import '../../domain/entities/reminder.dart';

class ReminderModel extends HiveObject {
  final String id;
  final String title;
  final String description;
  final DateTime reminderDateTime;

  ReminderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.reminderDateTime,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      reminderDateTime: DateTime.parse(json['reminderDateTime'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'reminderDateTime': reminderDateTime.toIso8601String(),
    };
  }

  /// Converts this data model to its pure domain Entity counterpart
  Reminder toDomain() {
    return Reminder(
      id: id,
      title: title,
      description: description,
      reminderDateTime: reminderDateTime,
    );
  }

  /// Factory constructor to convert a pure domain Entity into this serializable Data Model
  factory ReminderModel.fromDomain(Reminder reminder) {
    return ReminderModel(
      id: reminder.id,
      title: reminder.title,
      description: reminder.description,
      reminderDateTime: reminder.reminderDateTime,
    );
  }
}

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 0;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      reminderDateTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.reminderDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
