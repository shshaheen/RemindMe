import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  HiveService._();

  static const String authBoxName = 'auth_box';
  static const String remindersBoxName = 'reminders_box';
  static const String settingsBoxName = 'settings_box';

  /// Initializes Hive and Hive Flutter support
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters here
    // e.g. Hive.registerAdapter(ReminderModelAdapter());

    // Pre-open boxes required for initial use
    await openBoxes();
  }

  /// Helper to open all standard application data boxes
  static Future<void> openBoxes() async {
    await Hive.openBox(authBoxName);
    await Hive.openBox(remindersBoxName);
    await Hive.openBox(settingsBoxName);
  }

  /// Retrieve reference to Auth Box
  static Box get authBox => Hive.box(authBoxName);

  /// Retrieve reference to Reminders Box
  static Box get remindersBox => Hive.box(remindersBoxName);

  /// Retrieve reference to Settings Box
  static Box get settingsBox => Hive.box(settingsBoxName);

  /// Clear all local storage databases (e.g. for complete logout or factory reset)
  static Future<void> clearAll() async {
    await authBox.clear();
    await remindersBox.clear();
    await settingsBox.clear();
  }
}
