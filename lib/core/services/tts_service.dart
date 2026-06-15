import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;
  VoidCallback? _onCompleteCallback;

  Future<void> _init() async {
    if (_isInitialized) return;
    try {
      await _flutterTts.setLanguage("en-IN");
      await _flutterTts.setSpeechRate(0.5); // Clear and natural speed
      await _flutterTts.setVolume(1.0); // Max volume
      await _flutterTts.setPitch(1.0); // Normal pitch

      _flutterTts.setCompletionHandler(() {
        if (_onCompleteCallback != null) {
          _onCompleteCallback!();
        }
      });
      _isInitialized = true;
    } catch (e) {
      debugPrint("TtsService [ERROR]: Failed to initialize TTS: $e");
    }
  }

  /// Speaks the reminder title and description.
  Future<void> speakReminder({
    required String title,
    required String description,
    VoidCallback? onComplete,
  }) async {
    await _init();
    await stop(); // Ensure any active speech session is stopped first
    _onCompleteCallback = onComplete;

    final cleanTitle = title.trim();
    final cleanDesc = description.trim();

    String textToSpeak = "Hello. This is your reminder. $cleanTitle.";
    if (cleanDesc.isNotEmpty) {
      textToSpeak += " $cleanDesc.";
    }

    try {
      await _flutterTts.speak(textToSpeak);
    } catch (e) {
      debugPrint("TtsService [ERROR]: Failed to play TTS: $e");
    }
  }

  /// Stops any currently playing speech.
  Future<void> stop() async {
    _onCompleteCallback = null;
    try {
      await _flutterTts.stop();
    } catch (e) {
      debugPrint("TtsService [ERROR]: Failed to stop TTS: $e");
    }
  }
}
