// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) =>
    UserPreferencesDto(
      unavailableDays: (json['unavailableDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      maxDaysPerWeek: (json['maxDaysPerWeek'] as num).toInt(),
      preferredDays: (json['preferredDays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UserPreferencesDtoToJson(UserPreferencesDto instance) =>
    <String, dynamic>{
      'unavailableDays': instance.unavailableDays,
      'maxDaysPerWeek': instance.maxDaysPerWeek,
      'preferredDays': instance.preferredDays,
    };
