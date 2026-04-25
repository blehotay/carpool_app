// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekScheduleDto _$WeekScheduleDtoFromJson(Map<String, dynamic> json) =>
    WeekScheduleDto(
      carpoolId: json['carpoolId'] as String,
      weekStart: WeekScheduleDto._dateTimeFromTimestamp(json['weekStart']),
      days: (json['days'] as List<dynamic>)
          .map((e) => DayScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeekScheduleDtoToJson(WeekScheduleDto instance) =>
    <String, dynamic>{
      'carpoolId': instance.carpoolId,
      'weekStart': WeekScheduleDto._dateTimeToTimestamp(instance.weekStart),
      'days': instance.days,
    };
