import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        started: (e) async => _onStarted(e, emit),
        createPassword: (e) async => _onCreatePassword(e, emit),
        loginRequested: (e) async => _onLoginRequested(e, emit),
        changePasswordRequested: (e) async => _onChangePasswordRequested(e, emit),
        logoutRequested: (e) async => _onLogoutRequested(e, emit),
      );
    });
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await repository.hasPassword();
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (hasPassword) {
        if (hasPassword) {
          emit(const AuthState.unauthenticated());
        } else {
          emit(const AuthState.needsPasswordSetup());
        }
      },
    );
  }

  Future<void> _onCreatePassword(CreatePassword event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    if (event.password.length < 6) {
      emit(const AuthState.error(message: 'Password must be at least 6 characters'));
      emit(const AuthState.needsPasswordSetup());
      return;
    }
    
    final result = await repository.setPassword(event.password);
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (_) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await repository.validatePassword(event.password);
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (isValid) {
        if (isValid) {
          emit(const AuthState.authenticated());
        } else {
          emit(const AuthState.error(message: 'Incorrect password'));
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onChangePasswordRequested(ChangePasswordRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    if (event.newPassword.length < 6) {
      emit(const AuthState.error(message: 'New password must be at least 6 characters'));
      emit(const AuthState.authenticated()); // Keep logged in
      return;
    }

    final result = await repository.changePassword(event.oldPassword, event.newPassword);
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (_) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await repository.logout();
    emit(const AuthState.unauthenticated());
  }
}
