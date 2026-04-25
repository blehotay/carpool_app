// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpool_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarpoolWeekImpl _$$CarpoolWeekImplFromJson(Map<String, dynamic> json) =>
    _$CarpoolWeekImpl(
      carpoolId: json['carpoolId'] as String,
      weekStart: DateTime.parse(json['weekStart'] as String),
      days: (json['days'] as List<dynamic>)
          .map((e) => CarpoolDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarpoolWeekImplToJson(_$CarpoolWeekImpl instance) =>
    <String, dynamic>{
      'carpoolId': instance.carpoolId,
      'weekStart': instance.weekStart.toIso8601String(),
      'days': instance.days,
    };
