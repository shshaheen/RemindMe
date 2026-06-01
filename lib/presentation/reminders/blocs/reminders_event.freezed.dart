// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemindersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Reminder reminder) reminderAdded,
    required TResult Function(int id) reminderDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Reminder reminder)? reminderAdded,
    TResult? Function(int id)? reminderDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Reminder reminder)? reminderAdded,
    TResult Function(int id)? reminderDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersStarted value) started,
    required TResult Function(ReminderAdded value) reminderAdded,
    required TResult Function(ReminderDeleted value) reminderDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersStarted value)? started,
    TResult? Function(ReminderAdded value)? reminderAdded,
    TResult? Function(ReminderDeleted value)? reminderDeleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersStarted value)? started,
    TResult Function(ReminderAdded value)? reminderAdded,
    TResult Function(ReminderDeleted value)? reminderDeleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersEventCopyWith<$Res> {
  factory $RemindersEventCopyWith(
          RemindersEvent value, $Res Function(RemindersEvent) then) =
      _$RemindersEventCopyWithImpl<$Res, RemindersEvent>;
}

/// @nodoc
class _$RemindersEventCopyWithImpl<$Res, $Val extends RemindersEvent>
    implements $RemindersEventCopyWith<$Res> {
  _$RemindersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemindersStartedImplCopyWith<$Res> {
  factory _$$RemindersStartedImplCopyWith(_$RemindersStartedImpl value,
          $Res Function(_$RemindersStartedImpl) then) =
      __$$RemindersStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemindersStartedImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$RemindersStartedImpl>
    implements _$$RemindersStartedImplCopyWith<$Res> {
  __$$RemindersStartedImplCopyWithImpl(_$RemindersStartedImpl _value,
      $Res Function(_$RemindersStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemindersStartedImpl implements RemindersStarted {
  const _$RemindersStartedImpl();

  @override
  String toString() {
    return 'RemindersEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemindersStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Reminder reminder) reminderAdded,
    required TResult Function(int id) reminderDeleted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Reminder reminder)? reminderAdded,
    TResult? Function(int id)? reminderDeleted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Reminder reminder)? reminderAdded,
    TResult Function(int id)? reminderDeleted,
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
    required TResult Function(RemindersStarted value) started,
    required TResult Function(ReminderAdded value) reminderAdded,
    required TResult Function(ReminderDeleted value) reminderDeleted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersStarted value)? started,
    TResult? Function(ReminderAdded value)? reminderAdded,
    TResult? Function(ReminderDeleted value)? reminderDeleted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersStarted value)? started,
    TResult Function(ReminderAdded value)? reminderAdded,
    TResult Function(ReminderDeleted value)? reminderDeleted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class RemindersStarted implements RemindersEvent {
  const factory RemindersStarted() = _$RemindersStartedImpl;
}

/// @nodoc
abstract class _$$ReminderAddedImplCopyWith<$Res> {
  factory _$$ReminderAddedImplCopyWith(
          _$ReminderAddedImpl value, $Res Function(_$ReminderAddedImpl) then) =
      __$$ReminderAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Reminder reminder});
}

/// @nodoc
class __$$ReminderAddedImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$ReminderAddedImpl>
    implements _$$ReminderAddedImplCopyWith<$Res> {
  __$$ReminderAddedImplCopyWithImpl(
      _$ReminderAddedImpl _value, $Res Function(_$ReminderAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminder = null,
  }) {
    return _then(_$ReminderAddedImpl(
      reminder: null == reminder
          ? _value.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as Reminder,
    ));
  }
}

/// @nodoc

class _$ReminderAddedImpl implements ReminderAdded {
  const _$ReminderAddedImpl({required this.reminder});

  @override
  final Reminder reminder;

  @override
  String toString() {
    return 'RemindersEvent.reminderAdded(reminder: $reminder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderAddedImpl &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reminder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderAddedImplCopyWith<_$ReminderAddedImpl> get copyWith =>
      __$$ReminderAddedImplCopyWithImpl<_$ReminderAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Reminder reminder) reminderAdded,
    required TResult Function(int id) reminderDeleted,
  }) {
    return reminderAdded(reminder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Reminder reminder)? reminderAdded,
    TResult? Function(int id)? reminderDeleted,
  }) {
    return reminderAdded?.call(reminder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Reminder reminder)? reminderAdded,
    TResult Function(int id)? reminderDeleted,
    required TResult orElse(),
  }) {
    if (reminderAdded != null) {
      return reminderAdded(reminder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersStarted value) started,
    required TResult Function(ReminderAdded value) reminderAdded,
    required TResult Function(ReminderDeleted value) reminderDeleted,
  }) {
    return reminderAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersStarted value)? started,
    TResult? Function(ReminderAdded value)? reminderAdded,
    TResult? Function(ReminderDeleted value)? reminderDeleted,
  }) {
    return reminderAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersStarted value)? started,
    TResult Function(ReminderAdded value)? reminderAdded,
    TResult Function(ReminderDeleted value)? reminderDeleted,
    required TResult orElse(),
  }) {
    if (reminderAdded != null) {
      return reminderAdded(this);
    }
    return orElse();
  }
}

abstract class ReminderAdded implements RemindersEvent {
  const factory ReminderAdded({required final Reminder reminder}) =
      _$ReminderAddedImpl;

  Reminder get reminder;
  @JsonKey(ignore: true)
  _$$ReminderAddedImplCopyWith<_$ReminderAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReminderDeletedImplCopyWith<$Res> {
  factory _$$ReminderDeletedImplCopyWith(_$ReminderDeletedImpl value,
          $Res Function(_$ReminderDeletedImpl) then) =
      __$$ReminderDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ReminderDeletedImplCopyWithImpl<$Res>
    extends _$RemindersEventCopyWithImpl<$Res, _$ReminderDeletedImpl>
    implements _$$ReminderDeletedImplCopyWith<$Res> {
  __$$ReminderDeletedImplCopyWithImpl(
      _$ReminderDeletedImpl _value, $Res Function(_$ReminderDeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ReminderDeletedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReminderDeletedImpl implements ReminderDeleted {
  const _$ReminderDeletedImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'RemindersEvent.reminderDeleted(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderDeletedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderDeletedImplCopyWith<_$ReminderDeletedImpl> get copyWith =>
      __$$ReminderDeletedImplCopyWithImpl<_$ReminderDeletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Reminder reminder) reminderAdded,
    required TResult Function(int id) reminderDeleted,
  }) {
    return reminderDeleted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Reminder reminder)? reminderAdded,
    TResult? Function(int id)? reminderDeleted,
  }) {
    return reminderDeleted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Reminder reminder)? reminderAdded,
    TResult Function(int id)? reminderDeleted,
    required TResult orElse(),
  }) {
    if (reminderDeleted != null) {
      return reminderDeleted(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemindersStarted value) started,
    required TResult Function(ReminderAdded value) reminderAdded,
    required TResult Function(ReminderDeleted value) reminderDeleted,
  }) {
    return reminderDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemindersStarted value)? started,
    TResult? Function(ReminderAdded value)? reminderAdded,
    TResult? Function(ReminderDeleted value)? reminderDeleted,
  }) {
    return reminderDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemindersStarted value)? started,
    TResult Function(ReminderAdded value)? reminderAdded,
    TResult Function(ReminderDeleted value)? reminderDeleted,
    required TResult orElse(),
  }) {
    if (reminderDeleted != null) {
      return reminderDeleted(this);
    }
    return orElse();
  }
}

abstract class ReminderDeleted implements RemindersEvent {
  const factory ReminderDeleted({required final int id}) =
      _$ReminderDeletedImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$ReminderDeletedImplCopyWith<_$ReminderDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
