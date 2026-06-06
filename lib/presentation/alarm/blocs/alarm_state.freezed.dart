// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AlarmState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmStateCopyWith<$Res> {
  factory $AlarmStateCopyWith(
    AlarmState value,
    $Res Function(AlarmState) then,
  ) = _$AlarmStateCopyWithImpl<$Res, AlarmState>;
}

/// @nodoc
class _$AlarmStateCopyWithImpl<$Res, $Val extends AlarmState>
    implements $AlarmStateCopyWith<$Res> {
  _$AlarmStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AlarmInitialImplCopyWith<$Res> {
  factory _$$AlarmInitialImplCopyWith(
    _$AlarmInitialImpl value,
    $Res Function(_$AlarmInitialImpl) then,
  ) = __$$AlarmInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmInitialImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmInitialImpl>
    implements _$$AlarmInitialImplCopyWith<$Res> {
  __$$AlarmInitialImplCopyWithImpl(
    _$AlarmInitialImpl _value,
    $Res Function(_$AlarmInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmInitialImpl implements AlarmInitial {
  const _$AlarmInitialImpl();

  @override
  String toString() {
    return 'AlarmState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
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
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AlarmInitial implements AlarmState {
  const factory AlarmInitial() = _$AlarmInitialImpl;
}

/// @nodoc
abstract class _$$AlarmLoadingImplCopyWith<$Res> {
  factory _$$AlarmLoadingImplCopyWith(
    _$AlarmLoadingImpl value,
    $Res Function(_$AlarmLoadingImpl) then,
  ) = __$$AlarmLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmLoadingImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmLoadingImpl>
    implements _$$AlarmLoadingImplCopyWith<$Res> {
  __$$AlarmLoadingImplCopyWithImpl(
    _$AlarmLoadingImpl _value,
    $Res Function(_$AlarmLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmLoadingImpl implements AlarmLoading {
  const _$AlarmLoadingImpl();

  @override
  String toString() {
    return 'AlarmState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
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
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AlarmLoading implements AlarmState {
  const factory AlarmLoading() = _$AlarmLoadingImpl;
}

/// @nodoc
abstract class _$$AlarmIdleImplCopyWith<$Res> {
  factory _$$AlarmIdleImplCopyWith(
    _$AlarmIdleImpl value,
    $Res Function(_$AlarmIdleImpl) then,
  ) = __$$AlarmIdleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Reminder reminder});
}

/// @nodoc
class __$$AlarmIdleImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmIdleImpl>
    implements _$$AlarmIdleImplCopyWith<$Res> {
  __$$AlarmIdleImplCopyWithImpl(
    _$AlarmIdleImpl _value,
    $Res Function(_$AlarmIdleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reminder = null}) {
    return _then(
      _$AlarmIdleImpl(
        reminder: null == reminder
            ? _value.reminder
            : reminder // ignore: cast_nullable_to_non_nullable
                  as Reminder,
      ),
    );
  }
}

/// @nodoc

class _$AlarmIdleImpl implements AlarmIdle {
  const _$AlarmIdleImpl({required this.reminder});

  @override
  final Reminder reminder;

  @override
  String toString() {
    return 'AlarmState.idle(reminder: $reminder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmIdleImpl &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reminder);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmIdleImplCopyWith<_$AlarmIdleImpl> get copyWith =>
      __$$AlarmIdleImplCopyWithImpl<_$AlarmIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return idle(reminder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return idle?.call(reminder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(reminder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AlarmIdle implements AlarmState {
  const factory AlarmIdle({required final Reminder reminder}) = _$AlarmIdleImpl;

  Reminder get reminder;

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmIdleImplCopyWith<_$AlarmIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlarmSpeakingImplCopyWith<$Res> {
  factory _$$AlarmSpeakingImplCopyWith(
    _$AlarmSpeakingImpl value,
    $Res Function(_$AlarmSpeakingImpl) then,
  ) = __$$AlarmSpeakingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Reminder reminder});
}

/// @nodoc
class __$$AlarmSpeakingImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmSpeakingImpl>
    implements _$$AlarmSpeakingImplCopyWith<$Res> {
  __$$AlarmSpeakingImplCopyWithImpl(
    _$AlarmSpeakingImpl _value,
    $Res Function(_$AlarmSpeakingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reminder = null}) {
    return _then(
      _$AlarmSpeakingImpl(
        reminder: null == reminder
            ? _value.reminder
            : reminder // ignore: cast_nullable_to_non_nullable
                  as Reminder,
      ),
    );
  }
}

/// @nodoc

class _$AlarmSpeakingImpl implements AlarmSpeaking {
  const _$AlarmSpeakingImpl({required this.reminder});

  @override
  final Reminder reminder;

  @override
  String toString() {
    return 'AlarmState.speaking(reminder: $reminder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmSpeakingImpl &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reminder);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmSpeakingImplCopyWith<_$AlarmSpeakingImpl> get copyWith =>
      __$$AlarmSpeakingImplCopyWithImpl<_$AlarmSpeakingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return speaking(reminder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return speaking?.call(reminder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (speaking != null) {
      return speaking(reminder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return speaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return speaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (speaking != null) {
      return speaking(this);
    }
    return orElse();
  }
}

abstract class AlarmSpeaking implements AlarmState {
  const factory AlarmSpeaking({required final Reminder reminder}) =
      _$AlarmSpeakingImpl;

  Reminder get reminder;

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmSpeakingImplCopyWith<_$AlarmSpeakingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlarmDeliveredImplCopyWith<$Res> {
  factory _$$AlarmDeliveredImplCopyWith(
    _$AlarmDeliveredImpl value,
    $Res Function(_$AlarmDeliveredImpl) then,
  ) = __$$AlarmDeliveredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmDeliveredImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmDeliveredImpl>
    implements _$$AlarmDeliveredImplCopyWith<$Res> {
  __$$AlarmDeliveredImplCopyWithImpl(
    _$AlarmDeliveredImpl _value,
    $Res Function(_$AlarmDeliveredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmDeliveredImpl implements AlarmDelivered {
  const _$AlarmDeliveredImpl();

  @override
  String toString() {
    return 'AlarmState.delivered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmDeliveredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return delivered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return delivered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return delivered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return delivered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(this);
    }
    return orElse();
  }
}

abstract class AlarmDelivered implements AlarmState {
  const factory AlarmDelivered() = _$AlarmDeliveredImpl;
}

/// @nodoc
abstract class _$$AlarmSnoozedConfirmationImplCopyWith<$Res> {
  factory _$$AlarmSnoozedConfirmationImplCopyWith(
    _$AlarmSnoozedConfirmationImpl value,
    $Res Function(_$AlarmSnoozedConfirmationImpl) then,
  ) = __$$AlarmSnoozedConfirmationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int snoozedMinutes, DateTime ringAt});
}

/// @nodoc
class __$$AlarmSnoozedConfirmationImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmSnoozedConfirmationImpl>
    implements _$$AlarmSnoozedConfirmationImplCopyWith<$Res> {
  __$$AlarmSnoozedConfirmationImplCopyWithImpl(
    _$AlarmSnoozedConfirmationImpl _value,
    $Res Function(_$AlarmSnoozedConfirmationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snoozedMinutes = null, Object? ringAt = null}) {
    return _then(
      _$AlarmSnoozedConfirmationImpl(
        snoozedMinutes: null == snoozedMinutes
            ? _value.snoozedMinutes
            : snoozedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        ringAt: null == ringAt
            ? _value.ringAt
            : ringAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$AlarmSnoozedConfirmationImpl implements AlarmSnoozedConfirmation {
  const _$AlarmSnoozedConfirmationImpl({
    required this.snoozedMinutes,
    required this.ringAt,
  });

  @override
  final int snoozedMinutes;
  @override
  final DateTime ringAt;

  @override
  String toString() {
    return 'AlarmState.snoozedConfirmation(snoozedMinutes: $snoozedMinutes, ringAt: $ringAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmSnoozedConfirmationImpl &&
            (identical(other.snoozedMinutes, snoozedMinutes) ||
                other.snoozedMinutes == snoozedMinutes) &&
            (identical(other.ringAt, ringAt) || other.ringAt == ringAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snoozedMinutes, ringAt);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmSnoozedConfirmationImplCopyWith<_$AlarmSnoozedConfirmationImpl>
  get copyWith =>
      __$$AlarmSnoozedConfirmationImplCopyWithImpl<
        _$AlarmSnoozedConfirmationImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return snoozedConfirmation(snoozedMinutes, ringAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return snoozedConfirmation?.call(snoozedMinutes, ringAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (snoozedConfirmation != null) {
      return snoozedConfirmation(snoozedMinutes, ringAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return snoozedConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return snoozedConfirmation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (snoozedConfirmation != null) {
      return snoozedConfirmation(this);
    }
    return orElse();
  }
}

abstract class AlarmSnoozedConfirmation implements AlarmState {
  const factory AlarmSnoozedConfirmation({
    required final int snoozedMinutes,
    required final DateTime ringAt,
  }) = _$AlarmSnoozedConfirmationImpl;

  int get snoozedMinutes;
  DateTime get ringAt;

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmSnoozedConfirmationImplCopyWith<_$AlarmSnoozedConfirmationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlarmErrorImplCopyWith<$Res> {
  factory _$$AlarmErrorImplCopyWith(
    _$AlarmErrorImpl value,
    $Res Function(_$AlarmErrorImpl) then,
  ) = __$$AlarmErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AlarmErrorImplCopyWithImpl<$Res>
    extends _$AlarmStateCopyWithImpl<$Res, _$AlarmErrorImpl>
    implements _$$AlarmErrorImplCopyWith<$Res> {
  __$$AlarmErrorImplCopyWithImpl(
    _$AlarmErrorImpl _value,
    $Res Function(_$AlarmErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AlarmErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AlarmErrorImpl implements AlarmError {
  const _$AlarmErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AlarmState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmErrorImplCopyWith<_$AlarmErrorImpl> get copyWith =>
      __$$AlarmErrorImplCopyWithImpl<_$AlarmErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Reminder reminder) idle,
    required TResult Function(Reminder reminder) speaking,
    required TResult Function() delivered,
    required TResult Function(int snoozedMinutes, DateTime ringAt)
    snoozedConfirmation,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Reminder reminder)? idle,
    TResult? Function(Reminder reminder)? speaking,
    TResult? Function()? delivered,
    TResult? Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Reminder reminder)? idle,
    TResult Function(Reminder reminder)? speaking,
    TResult Function()? delivered,
    TResult Function(int snoozedMinutes, DateTime ringAt)? snoozedConfirmation,
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
    required TResult Function(AlarmInitial value) initial,
    required TResult Function(AlarmLoading value) loading,
    required TResult Function(AlarmIdle value) idle,
    required TResult Function(AlarmSpeaking value) speaking,
    required TResult Function(AlarmDelivered value) delivered,
    required TResult Function(AlarmSnoozedConfirmation value)
    snoozedConfirmation,
    required TResult Function(AlarmError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmInitial value)? initial,
    TResult? Function(AlarmLoading value)? loading,
    TResult? Function(AlarmIdle value)? idle,
    TResult? Function(AlarmSpeaking value)? speaking,
    TResult? Function(AlarmDelivered value)? delivered,
    TResult? Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult? Function(AlarmError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmInitial value)? initial,
    TResult Function(AlarmLoading value)? loading,
    TResult Function(AlarmIdle value)? idle,
    TResult Function(AlarmSpeaking value)? speaking,
    TResult Function(AlarmDelivered value)? delivered,
    TResult Function(AlarmSnoozedConfirmation value)? snoozedConfirmation,
    TResult Function(AlarmError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AlarmError implements AlarmState {
  const factory AlarmError({required final String message}) = _$AlarmErrorImpl;

  String get message;

  /// Create a copy of AlarmState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmErrorImplCopyWith<_$AlarmErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
