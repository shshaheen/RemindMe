import 'package:freezed_annotation/freezed_annotation.dart';
import 'speech_target_field.dart';

part 'speech_input_state.freezed.dart';

@freezed
class SpeechInputState with _$SpeechInputState {
  const factory SpeechInputState.initial() = SpeechInputInitial;

  const factory SpeechInputState.listening({
    required SpeechTargetField targetField,
    required String recognizedText,
    required double soundLevel,
  }) = SpeechInputListening;

  const factory SpeechInputState.success({
    required SpeechTargetField targetField,
    required String recognizedText,
  }) = SpeechInputSuccess;

  const factory SpeechInputState.failure({
    required SpeechTargetField targetField,
    required String errorMessage,
  }) = SpeechInputFailure;

  const factory SpeechInputState.permissionDenied({
    required SpeechTargetField targetField,
    required bool permanently,
  }) = SpeechInputPermissionDenied;
}
