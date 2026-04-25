import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carpool_dto.g.dart';

/// Data transfer object for carpool data from the API.
@JsonSerializable()
class CarpoolDto extends Equatable {
  /// Creates a [CarpoolDto].
  const CarpoolDto({
    required this.id,
    required this.name,
    required this.location,
    required this.memberIds,
    required this.pickupTime,
  });

  /// Creates a [CarpoolDto] from JSON.
  factory CarpoolDto.fromJson(Map<String, dynamic> json) =>
      _$CarpoolDtoFromJson(json);

  /// Unique identifier for the carpool.
  final String id;

  /// Name of the carpool.
  final String name;

  /// Pickup location.
  final String location;

  /// List of member user IDs.
  final List<String> memberIds;

  /// Pickup time (e.g., "8:00 AM").
  final String pickupTime;

  /// Converts this DTO to JSON.
  Map<String, dynamic> toJson() => _$CarpoolDtoToJson(this);

  @override
  List<Object?> get props => [id, name, location, memberIds, pickupTime];
}
