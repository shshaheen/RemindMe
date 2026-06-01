import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/app_settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({required AppSettings settings}) = _Loaded;
  const factory SettingsState.error({required String message}) = _Error;
}
