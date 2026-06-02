// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthStartedImplCopyWith<$Res> {
  factory _$$AuthStartedImplCopyWith(
    _$AuthStartedImpl value,
    $Res Function(_$AuthStartedImpl) then,
  ) = __$$AuthStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStartedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStartedImpl>
    implements _$$AuthStartedImplCopyWith<$Res> {
  __$$AuthStartedImplCopyWithImpl(
    _$AuthStartedImpl _value,
    $Res Function(_$AuthStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStartedImpl implements AuthStarted {
  const _$AuthStartedImpl();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AuthStarted implements AuthEvent {
  const factory AuthStarted() = _$AuthStartedImpl;
}

/// @nodoc
abstract class _$$CreatePasswordImplCopyWith<$Res> {
  factory _$$CreatePasswordImplCopyWith(
    _$CreatePasswordImpl value,
    $Res Function(_$CreatePasswordImpl) then,
  ) = __$$CreatePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$CreatePasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CreatePasswordImpl>
    implements _$$CreatePasswordImplCopyWith<$Res> {
  __$$CreatePasswordImplCopyWithImpl(
    _$CreatePasswordImpl _value,
    $Res Function(_$CreatePasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null}) {
    return _then(
      _$CreatePasswordImpl(
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CreatePasswordImpl implements CreatePassword {
  const _$CreatePasswordImpl({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.createPassword(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePasswordImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePasswordImplCopyWith<_$CreatePasswordImpl> get copyWith =>
      __$$CreatePasswordImplCopyWithImpl<_$CreatePasswordImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return createPassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return createPassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (createPassword != null) {
      return createPassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return createPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return createPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (createPassword != null) {
      return createPassword(this);
    }
    return orElse();
  }
}

abstract class CreatePassword implements AuthEvent {
  const factory CreatePassword({required final String password}) =
      _$CreatePasswordImpl;

  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePasswordImplCopyWith<_$CreatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginRequestedImplCopyWith<$Res> {
  factory _$$LoginRequestedImplCopyWith(
    _$LoginRequestedImpl value,
    $Res Function(_$LoginRequestedImpl) then,
  ) = __$$LoginRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$LoginRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginRequestedImpl>
    implements _$$LoginRequestedImplCopyWith<$Res> {
  __$$LoginRequestedImplCopyWithImpl(
    _$LoginRequestedImpl _value,
    $Res Function(_$LoginRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null}) {
    return _then(
      _$LoginRequestedImpl(
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginRequestedImpl implements LoginRequested {
  const _$LoginRequestedImpl({required this.password});

  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginRequested(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      __$$LoginRequestedImplCopyWithImpl<_$LoginRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return loginRequested(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return loginRequested?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return loginRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return loginRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (loginRequested != null) {
      return loginRequested(this);
    }
    return orElse();
  }
}

abstract class LoginRequested implements AuthEvent {
  const factory LoginRequested({required final String password}) =
      _$LoginRequestedImpl;

  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestedImplCopyWith<_$LoginRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordRequestedImplCopyWith<$Res> {
  factory _$$ChangePasswordRequestedImplCopyWith(
    _$ChangePasswordRequestedImpl value,
    $Res Function(_$ChangePasswordRequestedImpl) then,
  ) = __$$ChangePasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$ChangePasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangePasswordRequestedImpl>
    implements _$$ChangePasswordRequestedImplCopyWith<$Res> {
  __$$ChangePasswordRequestedImplCopyWithImpl(
    _$ChangePasswordRequestedImpl _value,
    $Res Function(_$ChangePasswordRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldPassword = null, Object? newPassword = null}) {
    return _then(
      _$ChangePasswordRequestedImpl(
        oldPassword: null == oldPassword
            ? _value.oldPassword
            : oldPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ChangePasswordRequestedImpl implements ChangePasswordRequested {
  const _$ChangePasswordRequestedImpl({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'AuthEvent.changePasswordRequested(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestedImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestedImplCopyWith<_$ChangePasswordRequestedImpl>
  get copyWith =>
      __$$ChangePasswordRequestedImplCopyWithImpl<
        _$ChangePasswordRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return changePasswordRequested(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return changePasswordRequested?.call(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (changePasswordRequested != null) {
      return changePasswordRequested(oldPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return changePasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return changePasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (changePasswordRequested != null) {
      return changePasswordRequested(this);
    }
    return orElse();
  }
}

abstract class ChangePasswordRequested implements AuthEvent {
  const factory ChangePasswordRequested({
    required final String oldPassword,
    required final String newPassword,
  }) = _$ChangePasswordRequestedImpl;

  String get oldPassword;
  String get newPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordRequestedImplCopyWith<_$ChangePasswordRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(
    _$LogoutRequestedImpl value,
    $Res Function(_$LogoutRequestedImpl) then,
  ) = __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
    _$LogoutRequestedImpl _value,
    $Res Function(_$LogoutRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutRequestedImpl implements LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String password) createPassword,
    required TResult Function(String password) loginRequested,
    required TResult Function(String oldPassword, String newPassword)
    changePasswordRequested,
    required TResult Function() logoutRequested,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String password)? createPassword,
    TResult? Function(String password)? loginRequested,
    TResult? Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult? Function()? logoutRequested,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String password)? createPassword,
    TResult Function(String password)? loginRequested,
    TResult Function(String oldPassword, String newPassword)?
    changePasswordRequested,
    TResult Function()? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(CreatePassword value) createPassword,
    required TResult Function(LoginRequested value) loginRequested,
    required TResult Function(ChangePasswordRequested value)
    changePasswordRequested,
    required TResult Function(LogoutRequested value) logoutRequested,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStarted value)? started,
    TResult? Function(CreatePassword value)? createPassword,
    TResult? Function(LoginRequested value)? loginRequested,
    TResult? Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult? Function(LogoutRequested value)? logoutRequested,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(CreatePassword value)? createPassword,
    TResult Function(LoginRequested value)? loginRequested,
    TResult Function(ChangePasswordRequested value)? changePasswordRequested,
    TResult Function(LogoutRequested value)? logoutRequested,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class LogoutRequested implements AuthEvent {
  const factory LogoutRequested() = _$LogoutRequestedImpl;
}
