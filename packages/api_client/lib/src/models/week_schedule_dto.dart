import 'package:api_client/src/models/day_schedule_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'week_schedule_dto.g.dart';

@JsonSerializable()
class WeekScheduleDto extends Equatable {
  const WeekScheduleDto({
    required this.carpoolId,
    required this.weekStart,
    required this.days,
  });

  factory WeekScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$WeekScheduleDtoFromJson(json);

  final String carpoolId;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime weekStart;
  final List<DayScheduleDto> days;

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
