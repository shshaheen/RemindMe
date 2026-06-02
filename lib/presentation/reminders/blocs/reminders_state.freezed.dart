// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RemindersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Reminder> reminders) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Reminder> reminders)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Reminder> reminders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersInitial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersLoaded value) loaded,
    required TResult Function(RemindersError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersInitial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersLoaded value)? loaded,
    TResult? Function(RemindersError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersInitial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersLoaded value)? loaded,
    TResult Function(RemindersError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersStateCopyWith<$Res> {
  factory $RemindersStateCopyWith(
    RemindersState value,
    $Res Function(RemindersState) then,
  ) = _$RemindersStateCopyWithImpl<$Res, RemindersState>;
}

/// @nodoc
class _$RemindersStateCopyWithImpl<$Res, $Val extends RemindersState>
    implements $RemindersStateCopyWith<$Res> {
  _$RemindersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemindersInitialImplCopyWith<$Res> {
  factory _$$RemindersInitialImplCopyWith(
    _$RemindersInitialImpl value,
    $Res Function(_$RemindersInitialImpl) then,
  ) = __$$RemindersInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemindersInitialImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersInitialImpl>
    implements _$$RemindersInitialImplCopyWith<$Res> {
  __$$RemindersInitialImplCopyWithImpl(
    _$RemindersInitialImpl _value,
    $Res Function(_$RemindersInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemindersInitialImpl implements RemindersInitial {
  const _$RemindersInitialImpl();

  @override
  String toString() {
    return 'RemindersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemindersInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Reminder> reminders) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Reminder> reminders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Reminder> reminders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersInitial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersLoaded value) loaded,
    required TResult Function(RemindersError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersInitial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersLoaded value)? loaded,
    TResult? Function(RemindersError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersInitial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersLoaded value)? loaded,
    TResult Function(RemindersError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RemindersInitial implements RemindersState {
  const factory RemindersInitial() = _$RemindersInitialImpl;
}

/// @nodoc
abstract class _$$RemindersLoadingImplCopyWith<$Res> {
  factory _$$RemindersLoadingImplCopyWith(
    _$RemindersLoadingImpl value,
    $Res Function(_$RemindersLoadingImpl) then,
  ) = __$$RemindersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemindersLoadingImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersLoadingImpl>
    implements _$$RemindersLoadingImplCopyWith<$Res> {
  __$$RemindersLoadingImplCopyWithImpl(
    _$RemindersLoadingImpl _value,
    $Res Function(_$RemindersLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemindersLoadingImpl implements RemindersLoading {
  const _$RemindersLoadingImpl();

  @override
  String toString() {
    return 'RemindersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemindersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Reminder> reminders) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Reminder> reminders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Reminder> reminders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersInitial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersLoaded value) loaded,
    required TResult Function(RemindersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersInitial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersLoaded value)? loaded,
    TResult? Function(RemindersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersInitial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersLoaded value)? loaded,
    TResult Function(RemindersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RemindersLoading implements RemindersState {
  const factory RemindersLoading() = _$RemindersLoadingImpl;
}

/// @nodoc
abstract class _$$RemindersLoadedImplCopyWith<$Res> {
  factory _$$RemindersLoadedImplCopyWith(
    _$RemindersLoadedImpl value,
    $Res Function(_$RemindersLoadedImpl) then,
  ) = __$$RemindersLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Reminder> reminders});
}

/// @nodoc
class __$$RemindersLoadedImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersLoadedImpl>
    implements _$$RemindersLoadedImplCopyWith<$Res> {
  __$$RemindersLoadedImplCopyWithImpl(
    _$RemindersLoadedImpl _value,
    $Res Function(_$RemindersLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reminders = null}) {
    return _then(
      _$RemindersLoadedImpl(
        reminders: null == reminders
            ? _value._reminders
            : reminders // ignore: cast_nullable_to_non_nullable
                  as List<Reminder>,
      ),
    );
  }
}

/// @nodoc

class _$RemindersLoadedImpl implements RemindersLoaded {
  const _$RemindersLoadedImpl({required final List<Reminder> reminders})
    : _reminders = reminders;

  final List<Reminder> _reminders;
  @override
  List<Reminder> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'RemindersState.loaded(reminders: $reminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._reminders,
              _reminders,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_reminders));

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersLoadedImplCopyWith<_$RemindersLoadedImpl> get copyWith =>
      __$$RemindersLoadedImplCopyWithImpl<_$RemindersLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Reminder> reminders) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(reminders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Reminder> reminders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(reminders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Reminder> reminders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(reminders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersInitial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersLoaded value) loaded,
    required TResult Function(RemindersError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersInitial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersLoaded value)? loaded,
    TResult? Function(RemindersError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersInitial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersLoaded value)? loaded,
    TResult Function(RemindersError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RemindersLoaded implements RemindersState {
  const factory RemindersLoaded({required final List<Reminder> reminders}) =
      _$RemindersLoadedImpl;

  List<Reminder> get reminders;

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemindersLoadedImplCopyWith<_$RemindersLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemindersErrorImplCopyWith<$Res> {
  factory _$$RemindersErrorImplCopyWith(
    _$RemindersErrorImpl value,
    $Res Function(_$RemindersErrorImpl) then,
  ) = __$$RemindersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RemindersErrorImplCopyWithImpl<$Res>
    extends _$RemindersStateCopyWithImpl<$Res, _$RemindersErrorImpl>
    implements _$$RemindersErrorImplCopyWith<$Res> {
  __$$RemindersErrorImplCopyWithImpl(
    _$RemindersErrorImpl _value,
    $Res Function(_$RemindersErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RemindersErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RemindersErrorImpl implements RemindersError {
  const _$RemindersErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'RemindersState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersErrorImplCopyWith<_$RemindersErrorImpl> get copyWith =>
      __$$RemindersErrorImplCopyWithImpl<_$RemindersErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Reminder> reminders) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Reminder> reminders)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Reminder> reminders)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersInitial value) initial,
    required TResult Function(RemindersLoading value) loading,
    required TResult Function(RemindersLoaded value) loaded,
    required TResult Function(RemindersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersInitial value)? initial,
    TResult? Function(RemindersLoading value)? loading,
    TResult? Function(RemindersLoaded value)? loaded,
    TResult? Function(RemindersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersInitial value)? initial,
    TResult Function(RemindersLoading value)? loading,
    TResult Function(RemindersLoaded value)? loaded,
    TResult Function(RemindersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RemindersError implements RemindersState {
  const factory RemindersError({required final String message}) =
      _$RemindersErrorImpl;

  String get message;

  /// Create a copy of RemindersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemindersErrorImplCopyWith<_$RemindersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
