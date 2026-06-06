// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AlarmEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmEventCopyWith<$Res> {
  factory $AlarmEventCopyWith(
    AlarmEvent value,
    $Res Function(AlarmEvent) then,
  ) = _$AlarmEventCopyWithImpl<$Res, AlarmEvent>;
}

/// @nodoc
class _$AlarmEventCopyWithImpl<$Res, $Val extends AlarmEvent>
    implements $AlarmEventCopyWith<$Res> {
  _$AlarmEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AlarmStartedImplCopyWith<$Res> {
  factory _$$AlarmStartedImplCopyWith(
    _$AlarmStartedImpl value,
    $Res Function(_$AlarmStartedImpl) then,
  ) = __$$AlarmStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reminderId});
}

/// @nodoc
class __$$AlarmStartedImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$AlarmStartedImpl>
    implements _$$AlarmStartedImplCopyWith<$Res> {
  __$$AlarmStartedImplCopyWithImpl(
    _$AlarmStartedImpl _value,
    $Res Function(_$AlarmStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reminderId = null}) {
    return _then(
      _$AlarmStartedImpl(
        reminderId: null == reminderId
            ? _value.reminderId
            : reminderId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AlarmStartedImpl implements AlarmStarted {
  const _$AlarmStartedImpl({required this.reminderId});

  @override
  final String reminderId;

  @override
  String toString() {
    return 'AlarmEvent.started(reminderId: $reminderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmStartedImpl &&
            (identical(other.reminderId, reminderId) ||
                other.reminderId == reminderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reminderId);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmStartedImplCopyWith<_$AlarmStartedImpl> get copyWith =>
      __$$AlarmStartedImplCopyWithImpl<_$AlarmStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) {
    return started(reminderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) {
    return started?.call(reminderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(reminderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AlarmStarted implements AlarmEvent {
  const factory AlarmStarted({required final String reminderId}) =
      _$AlarmStartedImpl;

  String get reminderId;

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlarmStartedImplCopyWith<_$AlarmStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlarmAcceptedImplCopyWith<$Res> {
  factory _$$AlarmAcceptedImplCopyWith(
    _$AlarmAcceptedImpl value,
    $Res Function(_$AlarmAcceptedImpl) then,
  ) = __$$AlarmAcceptedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmAcceptedImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$AlarmAcceptedImpl>
    implements _$$AlarmAcceptedImplCopyWith<$Res> {
  __$$AlarmAcceptedImplCopyWithImpl(
    _$AlarmAcceptedImpl _value,
    $Res Function(_$AlarmAcceptedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmAcceptedImpl implements AlarmAccepted {
  const _$AlarmAcceptedImpl();

  @override
  String toString() {
    return 'AlarmEvent.accepted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmAcceptedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) {
    return accepted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) {
    return accepted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) {
    return accepted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) {
    return accepted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(this);
    }
    return orElse();
  }
}

abstract class AlarmAccepted implements AlarmEvent {
  const factory AlarmAccepted() = _$AlarmAcceptedImpl;
}

/// @nodoc
abstract class _$$AlarmSpeechFinishedImplCopyWith<$Res> {
  factory _$$AlarmSpeechFinishedImplCopyWith(
    _$AlarmSpeechFinishedImpl value,
    $Res Function(_$AlarmSpeechFinishedImpl) then,
  ) = __$$AlarmSpeechFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmSpeechFinishedImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$AlarmSpeechFinishedImpl>
    implements _$$AlarmSpeechFinishedImplCopyWith<$Res> {
  __$$AlarmSpeechFinishedImplCopyWithImpl(
    _$AlarmSpeechFinishedImpl _value,
    $Res Function(_$AlarmSpeechFinishedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmSpeechFinishedImpl implements AlarmSpeechFinished {
  const _$AlarmSpeechFinishedImpl();

  @override
  String toString() {
    return 'AlarmEvent.speechFinished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmSpeechFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) {
    return speechFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) {
    return speechFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    if (speechFinished != null) {
      return speechFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) {
    return speechFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) {
    return speechFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (speechFinished != null) {
      return speechFinished(this);
    }
    return orElse();
  }
}

abstract class AlarmSpeechFinished implements AlarmEvent {
  const factory AlarmSpeechFinished() = _$AlarmSpeechFinishedImpl;
}

/// @nodoc
abstract class _$$AlarmSnoozedImplCopyWith<$Res> {
  factory _$$AlarmSnoozedImplCopyWith(
    _$AlarmSnoozedImpl value,
    $Res Function(_$AlarmSnoozedImpl) then,
  ) = __$$AlarmSnoozedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmSnoozedImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$AlarmSnoozedImpl>
    implements _$$AlarmSnoozedImplCopyWith<$Res> {
  __$$AlarmSnoozedImplCopyWithImpl(
    _$AlarmSnoozedImpl _value,
    $Res Function(_$AlarmSnoozedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmSnoozedImpl implements AlarmSnoozed {
  const _$AlarmSnoozedImpl();

  @override
  String toString() {
    return 'AlarmEvent.snoozed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmSnoozedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) {
    return snoozed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) {
    return snoozed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    if (snoozed != null) {
      return snoozed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) {
    return snoozed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) {
    return snoozed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (snoozed != null) {
      return snoozed(this);
    }
    return orElse();
  }
}

abstract class AlarmSnoozed implements AlarmEvent {
  const factory AlarmSnoozed() = _$AlarmSnoozedImpl;
}

/// @nodoc
abstract class _$$AlarmDismissedImplCopyWith<$Res> {
  factory _$$AlarmDismissedImplCopyWith(
    _$AlarmDismissedImpl value,
    $Res Function(_$AlarmDismissedImpl) then,
  ) = __$$AlarmDismissedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlarmDismissedImplCopyWithImpl<$Res>
    extends _$AlarmEventCopyWithImpl<$Res, _$AlarmDismissedImpl>
    implements _$$AlarmDismissedImplCopyWith<$Res> {
  __$$AlarmDismissedImplCopyWithImpl(
    _$AlarmDismissedImpl _value,
    $Res Function(_$AlarmDismissedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlarmEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlarmDismissedImpl implements AlarmDismissed {
  const _$AlarmDismissedImpl();

  @override
  String toString() {
    return 'AlarmEvent.dismissed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlarmDismissedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String reminderId) started,
    required TResult Function() accepted,
    required TResult Function() speechFinished,
    required TResult Function() snoozed,
    required TResult Function() dismissed,
  }) {
    return dismissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String reminderId)? started,
    TResult? Function()? accepted,
    TResult? Function()? speechFinished,
    TResult? Function()? snoozed,
    TResult? Function()? dismissed,
  }) {
    return dismissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String reminderId)? started,
    TResult Function()? accepted,
    TResult Function()? speechFinished,
    TResult Function()? snoozed,
    TResult Function()? dismissed,
    required TResult orElse(),
  }) {
    if (dismissed != null) {
      return dismissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AlarmStarted value) started,
    required TResult Function(AlarmAccepted value) accepted,
    required TResult Function(AlarmSpeechFinished value) speechFinished,
    required TResult Function(AlarmSnoozed value) snoozed,
    required TResult Function(AlarmDismissed value) dismissed,
  }) {
    return dismissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AlarmStarted value)? started,
    TResult? Function(AlarmAccepted value)? accepted,
    TResult? Function(AlarmSpeechFinished value)? speechFinished,
    TResult? Function(AlarmSnoozed value)? snoozed,
    TResult? Function(AlarmDismissed value)? dismissed,
  }) {
    return dismissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AlarmStarted value)? started,
    TResult Function(AlarmAccepted value)? accepted,
    TResult Function(AlarmSpeechFinished value)? speechFinished,
    TResult Function(AlarmSnoozed value)? snoozed,
    TResult Function(AlarmDismissed value)? dismissed,
    required TResult orElse(),
  }) {
    if (dismissed != null) {
      return dismissed(this);
    }
    return orElse();
  }
}

abstract class AlarmDismissed implements AlarmEvent {
  const factory AlarmDismissed() = _$AlarmDismissedImpl;
}
