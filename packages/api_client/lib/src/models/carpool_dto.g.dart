// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpool_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarpoolDto _$CarpoolDtoFromJson(Map<String, dynamic> json) => CarpoolDto(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      memberIds:
          (json['memberIds'] as List<dynamic>).map((e) => e as String).toList(),
      pickupTime: json['pickupTime'] as String,
    );

Map<String, dynamic> _$CarpoolDtoToJson(CarpoolDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'memberIds': instance.memberIds,
      'pickupTime': instance.pickupTime,
    };
