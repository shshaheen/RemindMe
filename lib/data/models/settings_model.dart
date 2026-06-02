import '../../domain/entities/app_settings.dart';

class SettingsModel {
  final bool isDarkMode;
  final bool isSoundEnabled;
  final bool isVibrationEnabled;

  const SettingsModel({
    required this.isDarkMode,
    required this.isSoundEnabled,
    required this.isVibrationEnabled,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      isDarkMode: json['isDarkMode'] as bool,
      isSoundEnabled: json['isSoundEnabled'] as bool,
      isVibrationEnabled: json['isVibrationEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'isSoundEnabled': isSoundEnabled,
      'isVibrationEnabled': isVibrationEnabled,
    };
  }

  /// Converts this data model to its pure domain Entity counterpart
  AppSettings toDomain() {
    return AppSettings(
      isDarkMode: isDarkMode,
      isSoundEnabled: isSoundEnabled,
      isVibrationEnabled: isVibrationEnabled,
    );
  }

  /// Factory constructor to convert a pure domain Entity into this serializable Data Model
  factory SettingsModel.fromDomain(AppSettings settings) {
    return SettingsModel(
      isDarkMode: settings.isDarkMode,
      isSoundEnabled: settings.isSoundEnabled,
      isVibrationEnabled: settings.isVibrationEnabled,
    );
  }
}
