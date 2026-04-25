// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      unavailableDays: (json['unavailableDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      maxDaysPerWeek: (json['maxDaysPerWeek'] as num).toInt(),
      preferredDays: (json['preferredDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'unavailableDays': instance.unavailableDays,
      'maxDaysPerWeek': instance.maxDaysPerWeek,
      'preferredDays': instance.preferredDays,
    };
