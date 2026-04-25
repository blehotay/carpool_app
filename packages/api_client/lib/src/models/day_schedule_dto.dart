import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_schedule_dto.g.dart';

@JsonSerializable()
class DayScheduleDto extends Equatable {
  const DayScheduleDto({
    required this.id,
    required this.date,
    required this.driverId,
    required this.childrenIds,
    required this.status,
  });

  factory DayScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleDtoFromJson(json);

  final String id;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime date;
  final String? driverId;
  final List<String> childrenIds;
  final String status;

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
