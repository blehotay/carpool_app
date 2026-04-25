// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayScheduleDto _$DayScheduleDtoFromJson(Map<String, dynamic> json) =>
    DayScheduleDto(
      id: json['id'] as String,
      date: DayScheduleDto._dateTimeFromTimestamp(json['date']),
      driverId: json['driverId'] as String?,
      childrenIds: (json['childrenIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$DayScheduleDtoToJson(DayScheduleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': DayScheduleDto._dateTimeToTimestamp(instance.date),
      'driverId': instance.driverId,
      'childrenIds': instance.childrenIds,
      'status': instance.status,
    };
