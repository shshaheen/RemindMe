import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/permissions/app_permission.dart';
import '../../../../core/permissions/app_permission_status.dart';
import '../../../../core/permissions/permission_manager.dart';
import '../../../../core/services/speech_recognition_service.dart';
import 'speech_input_state.dart';
import 'speech_target_field.dart';

class SpeechInputCubit extends Cubit<SpeechInputState> {
  final SpeechRecognitionService speechService;
  final PermissionManager permissionManager;

  SpeechInputCubit({
    required this.speechService,
    required this.permissionManager,
  })  : super(const SpeechInputState.initial());

  Future<void> startListening({required SpeechTargetField targetField}) async {
    // Force cancel any active speech recognition session to clean up state and avoid carryover
    await speechService.cancelListening();

    // 1. Check microphone permission status
    var status = await permissionManager.getPermissionStatus(AppPermission.microphone);

    if (status == AppPermissionStatus.undetermined || status == AppPermissionStatus.denied) {
      status = await permissionManager.requestPermission(AppPermission.microphone);
    }

    if (status != AppPermissionStatus.granted && status != AppPermissionStatus.limited) {
      final permanently = status == AppPermissionStatus.permanentlyDenied;
      emit(SpeechInputState.permissionDenied(
        targetField: targetField,
        permanently: permanently,
      ));
      return;
    }

    // 2. Initialize and start listening
    emit(SpeechInputState.listening(
      targetField: targetField,
      recognizedText: '',
      soundLevel: 0.0,
    ));

    speechService.startListening(
      onResult: (text, isFinal) {
        if (isClosed) return;
        if (state is! SpeechInputListening) return;
        if (isFinal) {
          emit(SpeechInputState.success(
            targetField: targetField,
            recognizedText: text,
          ));
        } else {
          emit(SpeechInputState.listening(
            targetField: targetField,
            recognizedText: text,
            soundLevel: (state as SpeechInputListening).soundLevel,
          ));
        }
      },
      onError: (err) {
        if (isClosed) return;
        if (state is! SpeechInputListening) return;
        emit(SpeechInputState.failure(
          targetField: targetField,
          errorMessage: err,
        ));
      },
      onSoundLevelChanged: (level) {
        if (isClosed) return;
        final currentState = state;
        if (currentState is SpeechInputListening) {
          emit(currentState.copyWith(soundLevel: level));
        }
      },
    );
  }

  Future<void> stopListening() async {
    final currentState = state;
    if (currentState is SpeechInputListening) {
      await speechService.stopListening();
      if (isClosed) return;
      if (state is SpeechInputListening) {
        emit(SpeechInputState.success(
          targetField: currentState.targetField,
          recognizedText: currentState.recognizedText,
        ));
      }
    }
  }

  Future<void> cancelListening() async {
    emit(const SpeechInputState.initial());
    await speechService.cancelListening();
  }

  void reset() {
    emit(const SpeechInputState.initial());
  }

  @override
  Future<void> close() async {
    await speechService.cancelListening();
    return super.close();
  }
}
