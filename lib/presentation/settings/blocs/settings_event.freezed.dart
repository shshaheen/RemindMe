// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AppSettings settings) settingsChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AppSettings settings)? settingsChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AppSettings settings)? settingsChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStarted value) started,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStarted value)? started,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStarted value)? started,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
    SettingsEvent value,
    $Res Function(SettingsEvent) then,
  ) = _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SettingsStartedImplCopyWith<$Res> {
  factory _$$SettingsStartedImplCopyWith(
    _$SettingsStartedImpl value,
    $Res Function(_$SettingsStartedImpl) then,
  ) = __$$SettingsStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsStartedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$SettingsStartedImpl>
    implements _$$SettingsStartedImplCopyWith<$Res> {
  __$$SettingsStartedImplCopyWithImpl(
    _$SettingsStartedImpl _value,
    $Res Function(_$SettingsStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsStartedImpl implements SettingsStarted {
  const _$SettingsStartedImpl();

  @override
  String toString() {
    return 'SettingsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AppSettings settings) settingsChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AppSettings settings)? settingsChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AppSettings settings)? settingsChanged,
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
    required TResult Function(SettingsStarted value) started,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStarted value)? started,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStarted value)? started,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SettingsStarted implements SettingsEvent {
  const factory SettingsStarted() = _$SettingsStartedImpl;
}

/// @nodoc
abstract class _$$SettingsChangedImplCopyWith<$Res> {
  factory _$$SettingsChangedImplCopyWith(
    _$SettingsChangedImpl value,
    $Res Function(_$SettingsChangedImpl) then,
  ) = __$$SettingsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppSettings settings});
}

/// @nodoc
class __$$SettingsChangedImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$SettingsChangedImpl>
    implements _$$SettingsChangedImplCopyWith<$Res> {
  __$$SettingsChangedImplCopyWithImpl(
    _$SettingsChangedImpl _value,
    $Res Function(_$SettingsChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? settings = null}) {
    return _then(
      _$SettingsChangedImpl(
        settings: null == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as AppSettings,
      ),
    );
  }
}

/// @nodoc

class _$SettingsChangedImpl implements SettingsChanged {
  const _$SettingsChangedImpl({required this.settings});

  @override
  final AppSettings settings;

  @override
  String toString() {
    return 'SettingsEvent.settingsChanged(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsChangedImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsChangedImplCopyWith<_$SettingsChangedImpl> get copyWith =>
      __$$SettingsChangedImplCopyWithImpl<_$SettingsChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(AppSettings settings) settingsChanged,
  }) {
    return settingsChanged(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AppSettings settings)? settingsChanged,
  }) {
    return settingsChanged?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AppSettings settings)? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsStarted value) started,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return settingsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsStarted value)? started,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return settingsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsStarted value)? started,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged(this);
    }
    return orElse();
  }
}

abstract class SettingsChanged implements SettingsEvent {
  const factory SettingsChanged({required final AppSettings settings}) =
      _$SettingsChangedImpl;

  AppSettings get settings;

  /// Create a copy of SettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsChangedImplCopyWith<_$SettingsChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
