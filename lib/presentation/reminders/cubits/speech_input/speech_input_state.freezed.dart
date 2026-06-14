// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SpeechInputState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechInputStateCopyWith<$Res> {
  factory $SpeechInputStateCopyWith(
    SpeechInputState value,
    $Res Function(SpeechInputState) then,
  ) = _$SpeechInputStateCopyWithImpl<$Res, SpeechInputState>;
}

/// @nodoc
class _$SpeechInputStateCopyWithImpl<$Res, $Val extends SpeechInputState>
    implements $SpeechInputStateCopyWith<$Res> {
  _$SpeechInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SpeechInputInitialImplCopyWith<$Res> {
  factory _$$SpeechInputInitialImplCopyWith(
    _$SpeechInputInitialImpl value,
    $Res Function(_$SpeechInputInitialImpl) then,
  ) = __$$SpeechInputInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeechInputInitialImplCopyWithImpl<$Res>
    extends _$SpeechInputStateCopyWithImpl<$Res, _$SpeechInputInitialImpl>
    implements _$$SpeechInputInitialImplCopyWith<$Res> {
  __$$SpeechInputInitialImplCopyWithImpl(
    _$SpeechInputInitialImpl _value,
    $Res Function(_$SpeechInputInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeechInputInitialImpl implements SpeechInputInitial {
  const _$SpeechInputInitialImpl();

  @override
  String toString() {
    return 'SpeechInputState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SpeechInputInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
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
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SpeechInputInitial implements SpeechInputState {
  const factory SpeechInputInitial() = _$SpeechInputInitialImpl;
}

/// @nodoc
abstract class _$$SpeechInputListeningImplCopyWith<$Res> {
  factory _$$SpeechInputListeningImplCopyWith(
    _$SpeechInputListeningImpl value,
    $Res Function(_$SpeechInputListeningImpl) then,
  ) = __$$SpeechInputListeningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    SpeechTargetField targetField,
    String recognizedText,
    double soundLevel,
  });
}

/// @nodoc
class __$$SpeechInputListeningImplCopyWithImpl<$Res>
    extends _$SpeechInputStateCopyWithImpl<$Res, _$SpeechInputListeningImpl>
    implements _$$SpeechInputListeningImplCopyWith<$Res> {
  __$$SpeechInputListeningImplCopyWithImpl(
    _$SpeechInputListeningImpl _value,
    $Res Function(_$SpeechInputListeningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetField = null,
    Object? recognizedText = null,
    Object? soundLevel = null,
  }) {
    return _then(
      _$SpeechInputListeningImpl(
        targetField: null == targetField
            ? _value.targetField
            : targetField // ignore: cast_nullable_to_non_nullable
                  as SpeechTargetField,
        recognizedText: null == recognizedText
            ? _value.recognizedText
            : recognizedText // ignore: cast_nullable_to_non_nullable
                  as String,
        soundLevel: null == soundLevel
            ? _value.soundLevel
            : soundLevel // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$SpeechInputListeningImpl implements SpeechInputListening {
  const _$SpeechInputListeningImpl({
    required this.targetField,
    required this.recognizedText,
    required this.soundLevel,
  });

  @override
  final SpeechTargetField targetField;
  @override
  final String recognizedText;
  @override
  final double soundLevel;

  @override
  String toString() {
    return 'SpeechInputState.listening(targetField: $targetField, recognizedText: $recognizedText, soundLevel: $soundLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechInputListeningImpl &&
            (identical(other.targetField, targetField) ||
                other.targetField == targetField) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText) &&
            (identical(other.soundLevel, soundLevel) ||
                other.soundLevel == soundLevel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetField, recognizedText, soundLevel);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechInputListeningImplCopyWith<_$SpeechInputListeningImpl>
  get copyWith =>
      __$$SpeechInputListeningImplCopyWithImpl<_$SpeechInputListeningImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) {
    return listening(targetField, recognizedText, soundLevel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) {
    return listening?.call(targetField, recognizedText, soundLevel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(targetField, recognizedText, soundLevel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class SpeechInputListening implements SpeechInputState {
  const factory SpeechInputListening({
    required final SpeechTargetField targetField,
    required final String recognizedText,
    required final double soundLevel,
  }) = _$SpeechInputListeningImpl;

  SpeechTargetField get targetField;
  String get recognizedText;
  double get soundLevel;

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechInputListeningImplCopyWith<_$SpeechInputListeningImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeechInputSuccessImplCopyWith<$Res> {
  factory _$$SpeechInputSuccessImplCopyWith(
    _$SpeechInputSuccessImpl value,
    $Res Function(_$SpeechInputSuccessImpl) then,
  ) = __$$SpeechInputSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SpeechTargetField targetField, String recognizedText});
}

/// @nodoc
class __$$SpeechInputSuccessImplCopyWithImpl<$Res>
    extends _$SpeechInputStateCopyWithImpl<$Res, _$SpeechInputSuccessImpl>
    implements _$$SpeechInputSuccessImplCopyWith<$Res> {
  __$$SpeechInputSuccessImplCopyWithImpl(
    _$SpeechInputSuccessImpl _value,
    $Res Function(_$SpeechInputSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? targetField = null, Object? recognizedText = null}) {
    return _then(
      _$SpeechInputSuccessImpl(
        targetField: null == targetField
            ? _value.targetField
            : targetField // ignore: cast_nullable_to_non_nullable
                  as SpeechTargetField,
        recognizedText: null == recognizedText
            ? _value.recognizedText
            : recognizedText // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SpeechInputSuccessImpl implements SpeechInputSuccess {
  const _$SpeechInputSuccessImpl({
    required this.targetField,
    required this.recognizedText,
  });

  @override
  final SpeechTargetField targetField;
  @override
  final String recognizedText;

  @override
  String toString() {
    return 'SpeechInputState.success(targetField: $targetField, recognizedText: $recognizedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechInputSuccessImpl &&
            (identical(other.targetField, targetField) ||
                other.targetField == targetField) &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetField, recognizedText);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechInputSuccessImplCopyWith<_$SpeechInputSuccessImpl> get copyWith =>
      __$$SpeechInputSuccessImplCopyWithImpl<_$SpeechInputSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) {
    return success(targetField, recognizedText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) {
    return success?.call(targetField, recognizedText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(targetField, recognizedText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SpeechInputSuccess implements SpeechInputState {
  const factory SpeechInputSuccess({
    required final SpeechTargetField targetField,
    required final String recognizedText,
  }) = _$SpeechInputSuccessImpl;

  SpeechTargetField get targetField;
  String get recognizedText;

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechInputSuccessImplCopyWith<_$SpeechInputSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeechInputFailureImplCopyWith<$Res> {
  factory _$$SpeechInputFailureImplCopyWith(
    _$SpeechInputFailureImpl value,
    $Res Function(_$SpeechInputFailureImpl) then,
  ) = __$$SpeechInputFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SpeechTargetField targetField, String errorMessage});
}

/// @nodoc
class __$$SpeechInputFailureImplCopyWithImpl<$Res>
    extends _$SpeechInputStateCopyWithImpl<$Res, _$SpeechInputFailureImpl>
    implements _$$SpeechInputFailureImplCopyWith<$Res> {
  __$$SpeechInputFailureImplCopyWithImpl(
    _$SpeechInputFailureImpl _value,
    $Res Function(_$SpeechInputFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? targetField = null, Object? errorMessage = null}) {
    return _then(
      _$SpeechInputFailureImpl(
        targetField: null == targetField
            ? _value.targetField
            : targetField // ignore: cast_nullable_to_non_nullable
                  as SpeechTargetField,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SpeechInputFailureImpl implements SpeechInputFailure {
  const _$SpeechInputFailureImpl({
    required this.targetField,
    required this.errorMessage,
  });

  @override
  final SpeechTargetField targetField;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'SpeechInputState.failure(targetField: $targetField, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechInputFailureImpl &&
            (identical(other.targetField, targetField) ||
                other.targetField == targetField) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetField, errorMessage);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechInputFailureImplCopyWith<_$SpeechInputFailureImpl> get copyWith =>
      __$$SpeechInputFailureImplCopyWithImpl<_$SpeechInputFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) {
    return failure(targetField, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) {
    return failure?.call(targetField, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(targetField, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SpeechInputFailure implements SpeechInputState {
  const factory SpeechInputFailure({
    required final SpeechTargetField targetField,
    required final String errorMessage,
  }) = _$SpeechInputFailureImpl;

  SpeechTargetField get targetField;
  String get errorMessage;

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechInputFailureImplCopyWith<_$SpeechInputFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeechInputPermissionDeniedImplCopyWith<$Res> {
  factory _$$SpeechInputPermissionDeniedImplCopyWith(
    _$SpeechInputPermissionDeniedImpl value,
    $Res Function(_$SpeechInputPermissionDeniedImpl) then,
  ) = __$$SpeechInputPermissionDeniedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SpeechTargetField targetField, bool permanently});
}

/// @nodoc
class __$$SpeechInputPermissionDeniedImplCopyWithImpl<$Res>
    extends
        _$SpeechInputStateCopyWithImpl<$Res, _$SpeechInputPermissionDeniedImpl>
    implements _$$SpeechInputPermissionDeniedImplCopyWith<$Res> {
  __$$SpeechInputPermissionDeniedImplCopyWithImpl(
    _$SpeechInputPermissionDeniedImpl _value,
    $Res Function(_$SpeechInputPermissionDeniedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? targetField = null, Object? permanently = null}) {
    return _then(
      _$SpeechInputPermissionDeniedImpl(
        targetField: null == targetField
            ? _value.targetField
            : targetField // ignore: cast_nullable_to_non_nullable
                  as SpeechTargetField,
        permanently: null == permanently
            ? _value.permanently
            : permanently // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$SpeechInputPermissionDeniedImpl implements SpeechInputPermissionDenied {
  const _$SpeechInputPermissionDeniedImpl({
    required this.targetField,
    required this.permanently,
  });

  @override
  final SpeechTargetField targetField;
  @override
  final bool permanently;

  @override
  String toString() {
    return 'SpeechInputState.permissionDenied(targetField: $targetField, permanently: $permanently)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechInputPermissionDeniedImpl &&
            (identical(other.targetField, targetField) ||
                other.targetField == targetField) &&
            (identical(other.permanently, permanently) ||
                other.permanently == permanently));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetField, permanently);

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechInputPermissionDeniedImplCopyWith<_$SpeechInputPermissionDeniedImpl>
  get copyWith =>
      __$$SpeechInputPermissionDeniedImplCopyWithImpl<
        _$SpeechInputPermissionDeniedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )
    listening,
    required TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
    )
    success,
    required TResult Function(
      SpeechTargetField targetField,
      String errorMessage,
    )
    failure,
    required TResult Function(SpeechTargetField targetField, bool permanently)
    permissionDenied,
  }) {
    return permissionDenied(targetField, permanently);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult? Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult? Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult? Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
  }) {
    return permissionDenied?.call(targetField, permanently);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      SpeechTargetField targetField,
      String recognizedText,
      double soundLevel,
    )?
    listening,
    TResult Function(SpeechTargetField targetField, String recognizedText)?
    success,
    TResult Function(SpeechTargetField targetField, String errorMessage)?
    failure,
    TResult Function(SpeechTargetField targetField, bool permanently)?
    permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(targetField, permanently);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechInputInitial value) initial,
    required TResult Function(SpeechInputListening value) listening,
    required TResult Function(SpeechInputSuccess value) success,
    required TResult Function(SpeechInputFailure value) failure,
    required TResult Function(SpeechInputPermissionDenied value)
    permissionDenied,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechInputInitial value)? initial,
    TResult? Function(SpeechInputListening value)? listening,
    TResult? Function(SpeechInputSuccess value)? success,
    TResult? Function(SpeechInputFailure value)? failure,
    TResult? Function(SpeechInputPermissionDenied value)? permissionDenied,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechInputInitial value)? initial,
    TResult Function(SpeechInputListening value)? listening,
    TResult Function(SpeechInputSuccess value)? success,
    TResult Function(SpeechInputFailure value)? failure,
    TResult Function(SpeechInputPermissionDenied value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class SpeechInputPermissionDenied implements SpeechInputState {
  const factory SpeechInputPermissionDenied({
    required final SpeechTargetField targetField,
    required final bool permanently,
  }) = _$SpeechInputPermissionDeniedImpl;

  SpeechTargetField get targetField;
  bool get permanently;

  /// Create a copy of SpeechInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechInputPermissionDeniedImplCopyWith<_$SpeechInputPermissionDeniedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
