// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carpool.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Carpool _$CarpoolFromJson(Map<String, dynamic> json) {
  return _Carpool.fromJson(json);
}

/// @nodoc
mixin _$Carpool {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get memberIds => throw _privateConstructorUsedError;
  String get pickupTime => throw _privateConstructorUsedError;

  /// Serializes this Carpool to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Carpool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpoolCopyWith<Carpool> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpoolCopyWith<$Res> {
  factory $CarpoolCopyWith(Carpool value, $Res Function(Carpool) then) =
      _$CarpoolCopyWithImpl<$Res, Carpool>;
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      List<String> memberIds,
      String pickupTime});
}

/// @nodoc
class _$CarpoolCopyWithImpl<$Res, $Val extends Carpool>
    implements $CarpoolCopyWith<$Res> {
  _$CarpoolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Carpool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? memberIds = null,
    Object? pickupTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _value.memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarpoolImplCopyWith<$Res> implements $CarpoolCopyWith<$Res> {
  factory _$$CarpoolImplCopyWith(
          _$CarpoolImpl value, $Res Function(_$CarpoolImpl) then) =
      __$$CarpoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String location,
      List<String> memberIds,
      String pickupTime});
}

/// @nodoc
class __$$CarpoolImplCopyWithImpl<$Res>
    extends _$CarpoolCopyWithImpl<$Res, _$CarpoolImpl>
    implements _$$CarpoolImplCopyWith<$Res> {
  __$$CarpoolImplCopyWithImpl(
      _$CarpoolImpl _value, $Res Function(_$CarpoolImpl) _then)
      : super(_value, _then);

  /// Create a copy of Carpool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? memberIds = null,
    Object? pickupTime = null,
  }) {
    return _then(_$CarpoolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      memberIds: null == memberIds
          ? _value._memberIds
          : memberIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pickupTime: null == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpoolImpl implements _Carpool {
  const _$CarpoolImpl(
      {required this.id,
      required this.name,
      required this.location,
      required final List<String> memberIds,
      required this.pickupTime})
      : _memberIds = memberIds;

  factory _$CarpoolImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpoolImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  final List<String> _memberIds;
  @override
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  @override
  final String pickupTime;

  @override
  String toString() {
    return 'Carpool(id: $id, name: $name, location: $location, memberIds: $memberIds, pickupTime: $pickupTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpoolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._memberIds, _memberIds) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location,
      const DeepCollectionEquality().hash(_memberIds), pickupTime);

  /// Create a copy of Carpool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpoolImplCopyWith<_$CarpoolImpl> get copyWith =>
      __$$CarpoolImplCopyWithImpl<_$CarpoolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpoolImplToJson(
      this,
    );
  }
}

abstract class _Carpool implements Carpool {
  const factory _Carpool(
      {required final String id,
      required final String name,
      required final String location,
      required final List<String> memberIds,
      required final String pickupTime}) = _$CarpoolImpl;

  factory _Carpool.fromJson(Map<String, dynamic> json) = _$CarpoolImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  List<String> get memberIds;
  @override
  String get pickupTime;

  /// Create a copy of Carpool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpoolImplCopyWith<_$CarpoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
