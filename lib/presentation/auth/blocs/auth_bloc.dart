import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        started: (e) async => _onStarted(e, emit),
        loginSubmitted: (e) async => _onLoginSubmitted(e, emit),
        logoutRequested: (e) async => _onLogoutRequested(e, emit),
      );
    });
  }

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) {
    emit(const AuthState.unauthenticated());
  }
 
  Future<void> _onLoginSubmitted(AuthLoginSubmitted event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await loginUseCase(
      LoginParams(username: event.username, password: event.password),
    );
 
    result.fold(
      (failure) => emit(AuthState.error(message: failure.message)),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }
 
  Future<void> _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.unauthenticated());
  }
}
