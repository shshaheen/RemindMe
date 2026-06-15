import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isInitialized = false;

  Future<bool> initialize() async {
    if (_isInitialized) return true;
    try {
      _isInitialized = await _speechToText.initialize(
        onError: (errorNotification) {
          debugPrint('SpeechRecognitionService [ERROR]: ${errorNotification.errorMsg}');
        },
        onStatus: (status) {
          debugPrint('SpeechRecognitionService [STATUS]: $status');
        },
      );
    } catch (e) {
      debugPrint('SpeechRecognitionService [ERROR] Init failed: $e');
      _isInitialized = false;
    }
    return _isInitialized;
  }

  void startListening({
    required Function(String text, bool isFinal) onResult,
    required Function(String error) onError,
    required Function(double soundLevel) onSoundLevelChanged,
  }) async {
    final initialized = await initialize();
    if (!initialized) {
      onError('Speech recognition failed to initialize.');
      return;
    }

    try {
      await _speechToText.listen(
        onResult: (result) {
          onResult(result.recognizedWords, result.finalResult);
        },
        onSoundLevelChange: onSoundLevelChanged,
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 4), // 4 seconds of silence auto-timeout
      );
    } catch (e) {
      debugPrint('SpeechRecognitionService [ERROR] Listen failed: $e');
      onError(e.toString());
    }
  }

  Future<void> stopListening() async {
    try {
      await _speechToText.stop();
    } catch (e) {
      debugPrint('SpeechRecognitionService [ERROR] Stop failed: $e');
    }
  }

  Future<void> cancelListening() async {
    try {
      await _speechToText.cancel();
    } catch (e) {
      debugPrint('SpeechRecognitionService [ERROR] Cancel failed: $e');
    }
  }

  bool get isListening => _speechToText.isListening;
}
