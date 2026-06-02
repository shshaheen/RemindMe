import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = AuthStarted;

  const factory AuthEvent.createPassword({required String password}) =
      CreatePassword;

  const factory AuthEvent.loginRequested({required String password}) =
      LoginRequested;

  const factory AuthEvent.changePasswordRequested({
    required String oldPassword,
    required String newPassword,
  }) = ChangePasswordRequested;

  const factory AuthEvent.logoutRequested() = LogoutRequested;
}
