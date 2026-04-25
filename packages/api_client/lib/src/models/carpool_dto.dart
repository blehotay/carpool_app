import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carpool_dto.g.dart';

@JsonSerializable()
class CarpoolDto extends Equatable {
  const CarpoolDto({
    required this.id,
    required this.name,
    required this.location,
    required this.memberIds,
    required this.pickupTime,
  });

  factory CarpoolDto.fromJson(Map<String, dynamic> json) =>
      _$CarpoolDtoFromJson(json);

  final String id;
  final String name;
  final String location;
  final List<String> memberIds;
  final String pickupTime;

  Map<String, dynamic> toJson() => _$CarpoolDtoToJson(this);

  @override
  List<Object?> get props => [id, name, location, memberIds, pickupTime];
}
