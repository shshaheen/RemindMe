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
    // Fetches settings map from Hive settingsBox
    return null;
  }

  @override
  Future<void> saveSettings(SettingsModel settings) async {
    // Writes settings to Hive settingsBox
  }
}
