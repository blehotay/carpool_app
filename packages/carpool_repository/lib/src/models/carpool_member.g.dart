// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carpool_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarpoolMemberImpl _$$CarpoolMemberImplFromJson(Map<String, dynamic> json) =>
    _$CarpoolMemberImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      childrenNames: (json['childrenNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CarpoolMemberImplToJson(_$CarpoolMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'childrenNames': instance.childrenNames,
    };
