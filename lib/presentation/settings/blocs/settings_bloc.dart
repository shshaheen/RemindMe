import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/settings_repository.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository repository;

  SettingsBloc({required this.repository})
    : super(const SettingsState.initial()) {
    on<SettingsEvent>((event, emit) async {
      await event.map(
        started: (e) async => _onStarted(e, emit),
        themeChanged: (e) async => _onthemeChanged(e, emit),
      );
    });
  }

  Future<void> _onStarted(
    SettingsStarted event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final result = await repository.getSettings();
    result.fold(
      (failure) => emit(SettingsState.error(message: failure.message)),
      (settings) => emit(SettingsState.loaded(settings: settings)),
    );
  }

  Future<void> _onthemeChanged(
    themeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    // Optimistically emit the new settings state immediately to prevent UI flicker
    emit(SettingsState.loaded(settings: event.settings));
    final result = await repository.updateSettings(event.settings);

    result.fold(
      (failure) => emit(SettingsState.error(message: failure.message)),
      (success) => null, // Already updated state optimistically
    );
  }
}
