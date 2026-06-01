import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/app_settings.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {
  final bool isDarkMode;
  final bool isSoundEnabled;
  final bool isVibrationEnabled;

  const SettingsModel({
    required this.isDarkMode,
    required this.isSoundEnabled,
    required this.isVibrationEnabled,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

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
