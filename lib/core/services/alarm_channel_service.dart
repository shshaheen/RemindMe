import 'package:flutter/services.dart';

class AlarmChannelService {
  AlarmChannelService();

  /// Starts playing the looping alarm ringtone.
  Future<void> startRingtone() async {
    // Managed automatically by the alarm package upon triggering.
  }

  /// Stops the alarm ringtone.
  Future<void> stopRingtone() async {
    // Managed automatically by the alarm package when the alarm is cancelled/stopped.
  }

  /// Request the system to dismiss the keyguard/lockscreen on Android 8.0+.
  Future<void> dismissKeyguard() async {
    // Handled by the alarm package's fullScreenIntent activity.
  }

  /// Close the application activity cleanly.
  Future<void> closeApp() async {
    try {
      await SystemNavigator.pop();
    } catch (_) {
      // Ignore or log error
    }
  }

  /// Explicitly wake the screen and set show when locked flags.
  Future<void> turnScreenOn() async {
    // Handled by the alarm package's fullScreenIntent activity.
  }
}
