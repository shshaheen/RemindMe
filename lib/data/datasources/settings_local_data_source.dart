import '../../core/services/hive_service.dart';
import '../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  /// Loads preference settings from cache
  Future<SettingsModel?> getSettings();

  /// Persists preference changes to local cache
  Future<void> saveSettings(SettingsModel settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  const SettingsLocalDataSourceImpl();

  @override
  Future<SettingsModel?> getSettings() async {
    final rawData = HiveService.settingsBox.get('app_settings');
    if (rawData == null) return null;
    if (rawData is Map) {
      final json = Map<String, dynamic>.from(rawData);
      return SettingsModel.fromJson(json);
    }
    return null;
  }

  @override
  Future<void> saveSettings(SettingsModel settings) async {
    await HiveService.settingsBox.put('app_settings', settings.toJson());
  }
}
