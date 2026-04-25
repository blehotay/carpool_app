// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  List<int> get unavailableDays => throw _privateConstructorUsedError;
  int get maxDaysPerWeek => throw _privateConstructorUsedError;
  List<int> get preferredDays => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {List<int> unavailableDays, int maxDaysPerWeek, List<int> preferredDays});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unavailableDays = null,
    Object? maxDaysPerWeek = null,
    Object? preferredDays = null,
  }) {
    return _then(_value.copyWith(
      unavailableDays: null == unavailableDays
          ? _value.unavailableDays
          : unavailableDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      maxDaysPerWeek: null == maxDaysPerWeek
          ? _value.maxDaysPerWeek
          : maxDaysPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      preferredDays: null == preferredDays
          ? _value.preferredDays
          : preferredDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> unavailableDays, int maxDaysPerWeek, List<int> preferredDays});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unavailableDays = null,
    Object? maxDaysPerWeek = null,
    Object? preferredDays = null,
  }) {
    return _then(_$UserPreferencesImpl(
      unavailableDays: null == unavailableDays
          ? _value._unavailableDays
          : unavailableDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      maxDaysPerWeek: null == maxDaysPerWeek
          ? _value.maxDaysPerWeek
          : maxDaysPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      preferredDays: null == preferredDays
          ? _value._preferredDays
          : preferredDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {required final List<int> unavailableDays,
      required this.maxDaysPerWeek,
      required final List<int> preferredDays})
      : _unavailableDays = unavailableDays,
        _preferredDays = preferredDays;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  final List<int> _unavailableDays;
  @override
  List<int> get unavailableDays {
    if (_unavailableDays is EqualUnmodifiableListView) return _unavailableDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unavailableDays);
  }

  @override
  final int maxDaysPerWeek;
  final List<int> _preferredDays;
  @override
  List<int> get preferredDays {
    if (_preferredDays is EqualUnmodifiableListView) return _preferredDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredDays);
  }

  @override
  String toString() {
    return 'UserPreferences(unavailableDays: $unavailableDays, maxDaysPerWeek: $maxDaysPerWeek, preferredDays: $preferredDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            const DeepCollectionEquality()
                .equals(other._unavailableDays, _unavailableDays) &&
            (identical(other.maxDaysPerWeek, maxDaysPerWeek) ||
                other.maxDaysPerWeek == maxDaysPerWeek) &&
            const DeepCollectionEquality()
                .equals(other._preferredDays, _preferredDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_unavailableDays),
      maxDaysPerWeek,
      const DeepCollectionEquality().hash(_preferredDays));

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final List<int> unavailableDays,
      required final int maxDaysPerWeek,
      required final List<int> preferredDays}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  List<int> get unavailableDays;
  @override
  int get maxDaysPerWeek;
  @override
  List<int> get preferredDays;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
