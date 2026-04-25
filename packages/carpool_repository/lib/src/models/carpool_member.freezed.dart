// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carpool_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarpoolMember _$CarpoolMemberFromJson(Map<String, dynamic> json) {
  return _CarpoolMember.fromJson(json);
}

/// @nodoc
mixin _$CarpoolMember {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  List<String> get childrenNames => throw _privateConstructorUsedError;

  /// Serializes this CarpoolMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarpoolMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarpoolMemberCopyWith<CarpoolMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarpoolMemberCopyWith<$Res> {
  factory $CarpoolMemberCopyWith(
          CarpoolMember value, $Res Function(CarpoolMember) then) =
      _$CarpoolMemberCopyWithImpl<$Res, CarpoolMember>;
  @useResult
  $Res call({String id, String name, String email, List<String> childrenNames});
}

/// @nodoc
class _$CarpoolMemberCopyWithImpl<$Res, $Val extends CarpoolMember>
    implements $CarpoolMemberCopyWith<$Res> {
  _$CarpoolMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarpoolMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? childrenNames = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      childrenNames: null == childrenNames
          ? _value.childrenNames
          : childrenNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarpoolMemberImplCopyWith<$Res>
    implements $CarpoolMemberCopyWith<$Res> {
  factory _$$CarpoolMemberImplCopyWith(
          _$CarpoolMemberImpl value, $Res Function(_$CarpoolMemberImpl) then) =
      __$$CarpoolMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email, List<String> childrenNames});
}

/// @nodoc
class __$$CarpoolMemberImplCopyWithImpl<$Res>
    extends _$CarpoolMemberCopyWithImpl<$Res, _$CarpoolMemberImpl>
    implements _$$CarpoolMemberImplCopyWith<$Res> {
  __$$CarpoolMemberImplCopyWithImpl(
      _$CarpoolMemberImpl _value, $Res Function(_$CarpoolMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarpoolMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? childrenNames = null,
  }) {
    return _then(_$CarpoolMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      childrenNames: null == childrenNames
          ? _value._childrenNames
          : childrenNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarpoolMemberImpl implements _CarpoolMember {
  const _$CarpoolMemberImpl(
      {required this.id,
      required this.name,
      required this.email,
      required final List<String> childrenNames})
      : _childrenNames = childrenNames;

  factory _$CarpoolMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarpoolMemberImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  final List<String> _childrenNames;
  @override
  List<String> get childrenNames {
    if (_childrenNames is EqualUnmodifiableListView) return _childrenNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childrenNames);
  }

  @override
  String toString() {
    return 'CarpoolMember(id: $id, name: $name, email: $email, childrenNames: $childrenNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarpoolMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._childrenNames, _childrenNames));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email,
      const DeepCollectionEquality().hash(_childrenNames));

  /// Create a copy of CarpoolMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarpoolMemberImplCopyWith<_$CarpoolMemberImpl> get copyWith =>
      __$$CarpoolMemberImplCopyWithImpl<_$CarpoolMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarpoolMemberImplToJson(
      this,
    );
  }
}

abstract class _CarpoolMember implements CarpoolMember {
  const factory _CarpoolMember(
      {required final String id,
      required final String name,
      required final String email,
      required final List<String> childrenNames}) = _$CarpoolMemberImpl;

  factory _CarpoolMember.fromJson(Map<String, dynamic> json) =
      _$CarpoolMemberImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  List<String> get childrenNames;

  /// Create a copy of CarpoolMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarpoolMemberImplCopyWith<_$CarpoolMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
