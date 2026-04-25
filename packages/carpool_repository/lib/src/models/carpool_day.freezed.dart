// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carpool_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarpoolDay _$CarpoolDayFromJson(Map<String, dynamic> json) {
  return _CarpoolDay.fromJson(json);
}

/// @nodoc
mixin _$CarpoolDay {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get driverId => throw _privateConstructorUsedError;
  String? get driverName => throw _privateConstructorUsedError;
  List<String> get childrenNames => throw _privateConstructorUsedError;
  DayStatus get status => throw _privateConstructorUsedError;

  /// Serializes this CarpoolDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarpoolDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpoolDayCopyWith<CarpoolDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpoolDayCopyWith<$Res> {
  factory $CarpoolDayCopyWith(
          CarpoolDay value, $Res Function(CarpoolDay) then) =
      _$CarpoolDayCopyWithImpl<$Res, CarpoolDay>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String? driverId,
      String? driverName,
      List<String> childrenNames,
      DayStatus status});
}

/// @nodoc
class _$CarpoolDayCopyWithImpl<$Res, $Val extends CarpoolDay>
    implements $CarpoolDayCopyWith<$Res> {
  _$CarpoolDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarpoolDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? childrenNames = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenNames: null == childrenNames
          ? _value.childrenNames
          : childrenNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DayStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarpoolDayImplCopyWith<$Res>
    implements $CarpoolDayCopyWith<$Res> {
  factory _$$CarpoolDayImplCopyWith(
          _$CarpoolDayImpl value, $Res Function(_$CarpoolDayImpl) then) =
      __$$CarpoolDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String? driverId,
      String? driverName,
      List<String> childrenNames,
      DayStatus status});
}

/// @nodoc
class __$$CarpoolDayImplCopyWithImpl<$Res>
    extends _$CarpoolDayCopyWithImpl<$Res, _$CarpoolDayImpl>
    implements _$$CarpoolDayImplCopyWith<$Res> {
  __$$CarpoolDayImplCopyWithImpl(
      _$CarpoolDayImpl _value, $Res Function(_$CarpoolDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarpoolDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? driverId = freezed,
    Object? driverName = freezed,
    Object? childrenNames = null,
    Object? status = null,
  }) {
    return _then(_$CarpoolDayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenNames: null == childrenNames
          ? _value._childrenNames
          : childrenNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DayStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpoolDayImpl extends _CarpoolDay {
  const _$CarpoolDayImpl(
      {required this.id,
      required this.date,
      required this.driverId,
      required this.driverName,
      required final List<String> childrenNames,
      required this.status})
      : _childrenNames = childrenNames,
        super._();

  factory _$CarpoolDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpoolDayImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String? driverId;
  @override
  final String? driverName;
  final List<String> _childrenNames;
  @override
  List<String> get childrenNames {
    if (_childrenNames is EqualUnmodifiableListView) return _childrenNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childrenNames);
  }

  @override
  final DayStatus status;

  @override
  String toString() {
    return 'CarpoolDay(id: $id, date: $date, driverId: $driverId, driverName: $driverName, childrenNames: $childrenNames, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpoolDayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            const DeepCollectionEquality()
                .equals(other._childrenNames, _childrenNames) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, driverId, driverName,
      const DeepCollectionEquality().hash(_childrenNames), status);

  /// Create a copy of CarpoolDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpoolDayImplCopyWith<_$CarpoolDayImpl> get copyWith =>
      __$$CarpoolDayImplCopyWithImpl<_$CarpoolDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpoolDayImplToJson(
      this,
    );
  }
}

abstract class _CarpoolDay extends CarpoolDay {
  const factory _CarpoolDay(
      {required final String id,
      required final DateTime date,
      required final String? driverId,
      required final String? driverName,
      required final List<String> childrenNames,
      required final DayStatus status}) = _$CarpoolDayImpl;
  const _CarpoolDay._() : super._();

  factory _CarpoolDay.fromJson(Map<String, dynamic> json) =
      _$CarpoolDayImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String? get driverId;
  @override
  String? get driverName;
  @override
  List<String> get childrenNames;
  @override
  DayStatus get status;

  /// Create a copy of CarpoolDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpoolDayImplCopyWith<_$CarpoolDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
