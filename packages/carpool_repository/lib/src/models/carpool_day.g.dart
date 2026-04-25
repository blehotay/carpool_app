// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpool_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarpoolDayImpl _$$CarpoolDayImplFromJson(Map<String, dynamic> json) =>
    _$CarpoolDayImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      driverId: json['driverId'] as String?,
      driverName: json['driverName'] as String?,
      childrenNames: (json['childrenNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$DayStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$CarpoolDayImplToJson(_$CarpoolDayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'childrenNames': instance.childrenNames,
      'status': _$DayStatusEnumMap[instance.status]!,
    };

const _$DayStatusEnumMap = {
  DayStatus.assigned: 'assigned',
  DayStatus.needsDriver: 'needsDriver',
  DayStatus.cancelled: 'cancelled',
};
