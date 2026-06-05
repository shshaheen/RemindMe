import 'package:flutter/services.dart';

class AlarmChannelService {
  static const MethodChannel _channel = MethodChannel(
    'com.example.reminder_app/alarm',
  );

  /// Starts playing the looping alarm ringtone.
  Future<void> startRingtone() async {
    try {
      await _channel.invokeMethod('startRingtone');
    } on PlatformException catch (_) {
      // Ignore or log error on non-Android platforms
    }
  }

  /// Stops the alarm ringtone.
  Future<void> stopRingtone() async {
    try {
      await _channel.invokeMethod('stopRingtone');
    } on PlatformException catch (_) {
      // Ignore or log error on non-Android platforms
    }
  }

  /// Request the system to dismiss the keyguard/lockscreen on Android 8.0+.
  Future<void> dismissKeyguard() async {
    try {
      await _channel.invokeMethod('dismissKeyguard');
    } on PlatformException catch (_) {
      // Ignore or log error on non-Android platforms
    }
  }

  /// Close the application activity cleanly.
  Future<void> closeApp() async {
    try {
      await _channel.invokeMethod('closeApp');
    } on PlatformException catch (_) {
      // Ignore or log error on non-Android platforms
    }
  }

  /// Explicitly wake the screen and set show when locked flags.
  Future<void> turnScreenOn() async {
    try {
      await _channel.invokeMethod('turnScreenOn');
    } on PlatformException catch (_) {
      // Ignore or log error on non-Android platforms
    }
  }
}
