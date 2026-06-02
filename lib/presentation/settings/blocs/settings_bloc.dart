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
        settingsChanged: (e) async => _onSettingsChanged(e, emit),
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

  Future<void> _onSettingsChanged(
    SettingsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final result = await repository.updateSettings(event.settings);

    await result.fold(
      (failure) async => emit(SettingsState.error(message: failure.message)),
      (success) async => add(const SettingsEvent.started()),
    );
  }
}
