// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carpool_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarpoolWeek _$CarpoolWeekFromJson(Map<String, dynamic> json) {
  return _CarpoolWeek.fromJson(json);
}

/// @nodoc
mixin _$CarpoolWeek {
  String get carpoolId => throw _privateConstructorUsedError;
  DateTime get weekStart => throw _privateConstructorUsedError;
  List<CarpoolDay> get days => throw _privateConstructorUsedError;

  /// Serializes this CarpoolWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarpoolWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpoolWeekCopyWith<CarpoolWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpoolWeekCopyWith<$Res> {
  factory $CarpoolWeekCopyWith(
          CarpoolWeek value, $Res Function(CarpoolWeek) then) =
      _$CarpoolWeekCopyWithImpl<$Res, CarpoolWeek>;
  @useResult
  $Res call({String carpoolId, DateTime weekStart, List<CarpoolDay> days});
}

/// @nodoc
class _$CarpoolWeekCopyWithImpl<$Res, $Val extends CarpoolWeek>
    implements $CarpoolWeekCopyWith<$Res> {
  _$CarpoolWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarpoolWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carpoolId = null,
    Object? weekStart = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      carpoolId: null == carpoolId
          ? _value.carpoolId
          : carpoolId // ignore: cast_nullable_to_non_nullable
              as String,
      weekStart: null == weekStart
          ? _value.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<CarpoolDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarpoolWeekImplCopyWith<$Res>
    implements $CarpoolWeekCopyWith<$Res> {
  factory _$$CarpoolWeekImplCopyWith(
          _$CarpoolWeekImpl value, $Res Function(_$CarpoolWeekImpl) then) =
      __$$CarpoolWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String carpoolId, DateTime weekStart, List<CarpoolDay> days});
}

/// @nodoc
class __$$CarpoolWeekImplCopyWithImpl<$Res>
    extends _$CarpoolWeekCopyWithImpl<$Res, _$CarpoolWeekImpl>
    implements _$$CarpoolWeekImplCopyWith<$Res> {
  __$$CarpoolWeekImplCopyWithImpl(
      _$CarpoolWeekImpl _value, $Res Function(_$CarpoolWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarpoolWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carpoolId = null,
    Object? weekStart = null,
    Object? days = null,
  }) {
    return _then(_$CarpoolWeekImpl(
      carpoolId: null == carpoolId
          ? _value.carpoolId
          : carpoolId // ignore: cast_nullable_to_non_nullable
              as String,
      weekStart: null == weekStart
          ? _value.weekStart
          : weekStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<CarpoolDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpoolWeekImpl extends _CarpoolWeek {
  const _$CarpoolWeekImpl(
      {required this.carpoolId,
      required this.weekStart,
      required final List<CarpoolDay> days})
      : _days = days,
        super._();

  factory _$CarpoolWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpoolWeekImplFromJson(json);

  @override
  final String carpoolId;
  @override
  final DateTime weekStart;
  final List<CarpoolDay> _days;
  @override
  List<CarpoolDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'CarpoolWeek(carpoolId: $carpoolId, weekStart: $weekStart, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpoolWeekImpl &&
            (identical(other.carpoolId, carpoolId) ||
                other.carpoolId == carpoolId) &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, carpoolId, weekStart,
      const DeepCollectionEquality().hash(_days));

  /// Create a copy of CarpoolWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpoolWeekImplCopyWith<_$CarpoolWeekImpl> get copyWith =>
      __$$CarpoolWeekImplCopyWithImpl<_$CarpoolWeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpoolWeekImplToJson(
      this,
    );
  }
}

abstract class _CarpoolWeek extends CarpoolWeek {
  const factory _CarpoolWeek(
      {required final String carpoolId,
      required final DateTime weekStart,
      required final List<CarpoolDay> days}) = _$CarpoolWeekImpl;
  const _CarpoolWeek._() : super._();

  factory _CarpoolWeek.fromJson(Map<String, dynamic> json) =
      _$CarpoolWeekImpl.fromJson;

  @override
  String get carpoolId;
  @override
  DateTime get weekStart;
  @override
  List<CarpoolDay> get days;

  /// Create a copy of CarpoolWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpoolWeekImplCopyWith<_$CarpoolWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
