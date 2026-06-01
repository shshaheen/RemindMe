// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      isDarkMode: json['isDarkMode'] as bool,
      isSoundEnabled: json['isSoundEnabled'] as bool,
      isVibrationEnabled: json['isVibrationEnabled'] as bool,
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
      'isSoundEnabled': instance.isSoundEnabled,
      'isVibrationEnabled': instance.isVibrationEnabled,
    };
