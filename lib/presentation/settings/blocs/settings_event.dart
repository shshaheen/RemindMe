import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/app_settings.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = SettingsStarted;
  const factory SettingsEvent.themeChanged({required AppSettings settings}) =
      themeChanged;
}
