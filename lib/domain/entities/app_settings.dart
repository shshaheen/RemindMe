class AppSettings {
  final bool isDarkMode;
  final bool isSoundEnabled;
  final bool isVibrationEnabled;

  const AppSettings({
    required this.isDarkMode,
    required this.isSoundEnabled,
    required this.isVibrationEnabled,
  });

  /// copy helper
  AppSettings copyWith({
    bool? isDarkMode,
    bool? isSoundEnabled,
    bool? isVibrationEnabled,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isSoundEnabled: isSoundEnabled ?? this.isSoundEnabled,
      isVibrationEnabled: isVibrationEnabled ?? this.isVibrationEnabled,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettings &&
          runtimeType == other.runtimeType &&
          isDarkMode == other.isDarkMode &&
          isSoundEnabled == other.isSoundEnabled &&
          isVibrationEnabled == other.isVibrationEnabled;

  @override
  int get hashCode =>
      isDarkMode.hashCode ^ isSoundEnabled.hashCode ^ isVibrationEnabled.hashCode;

  @override
  String toString() =>
      'AppSettings(isDarkMode: $isDarkMode, isSoundEnabled: $isSoundEnabled, isVibrationEnabled: $isVibrationEnabled)';
}
