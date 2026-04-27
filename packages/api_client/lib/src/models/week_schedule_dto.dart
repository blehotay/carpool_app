import 'package:api_client/src/models/day_schedule_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'week_schedule_dto.g.dart';

/// Data transfer object for a week's carpool schedule.
@JsonSerializable()
class WeekScheduleDto extends Equatable {
  /// Creates a [WeekScheduleDto].
  const WeekScheduleDto({
    required this.carpoolId,
    required this.weekStart,
    required this.days,
  });

  /// Creates a [WeekScheduleDto] from JSON.
  factory WeekScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$WeekScheduleDtoFromJson(json);

  /// ID of the carpool this schedule belongs to.
  final String carpoolId;

  /// Start date of the week (Monday).
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime weekStart;

  /// List of daily schedules for the week.
  final List<DayScheduleDto> days;

  /// Converts this DTO to JSON.
  Map<String, dynamic> toJson() => _$WeekScheduleDtoToJson(this);

  @override
  List<Object?> get props => [carpoolId, weekStart, days];

  static DateTime _dateTimeFromTimestamp(dynamic timestamp) {
    if (timestamp == null) return DateTime.now();
    if (timestamp is int) return DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime.parse(timestamp.toString());
  }

  static int _dateTimeToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }
}
