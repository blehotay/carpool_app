import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_schedule_dto.g.dart';

/// Data transfer object for a single day's carpool schedule.
@JsonSerializable()
class DayScheduleDto extends Equatable {
  /// Creates a [DayScheduleDto].
  const DayScheduleDto({
    required this.id,
    required this.date,
    required this.driverId,
    required this.childrenIds,
    required this.status,
  });

  /// Creates a [DayScheduleDto] from JSON.
  factory DayScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleDtoFromJson(json);

  /// Unique identifier for this day's schedule.
  final String id;

  /// Date of this schedule.
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime date;

  /// ID of the assigned driver, or null if unassigned.
  final String? driverId;

  /// IDs of children being transported.
  final List<String> childrenIds;

  /// Status of the day (e.g., "confirmed", "pending").
  final String status;

  /// Converts this DTO to JSON.
  Map<String, dynamic> toJson() => _$DayScheduleDtoToJson(this);

  @override
  List<Object?> get props => [id, date, driverId, childrenIds, status];

  static DateTime _dateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp == null) return DateTime.now();
    if (timestamp is int) return DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime.parse(timestamp.toString());
  }

  static int _dateTimeToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }
}
