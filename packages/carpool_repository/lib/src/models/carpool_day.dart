import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool_day.freezed.dart';
part 'carpool_day.g.dart';

enum DayStatus {
  assigned,
  needsDriver,
  cancelled,
}

@freezed
class CarpoolDay with _$CarpoolDay {
  const factory CarpoolDay({
    required String id,
    required DateTime date,
    required String? driverId,
    required String? driverName,
    required List<String> childrenNames,
    required DayStatus status,
  }) = _CarpoolDay;

  const CarpoolDay._();

  factory CarpoolDay.fromJson(Map<String, dynamic> json) =>
      _$CarpoolDayFromJson(json);

  bool get hasDriver => driverId != null && driverId!.isNotEmpty;

  String get dayLabel {
    final weekday = date.weekday;
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  String get dateLabel {
    return '${date.day}';
  }
}
