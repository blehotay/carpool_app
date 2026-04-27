import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool_day.freezed.dart';
part 'carpool_day.g.dart';

/// Status of a carpool day.
enum DayStatus {
  /// Driver has been assigned.
  assigned,

  /// Day needs a driver.
  needsDriver,

  /// Day has been cancelled.
  cancelled,
}

/// Domain model representing a single day in a carpool week.
@freezed
class CarpoolDay with _$CarpoolDay {
  /// Creates a [CarpoolDay].
  const factory CarpoolDay({
    required String id,
    required DateTime date,
    required String? driverId,
    required String? driverName,
    required List<String> childrenNames,
    required DayStatus status,
  }) = _CarpoolDay;

  const CarpoolDay._();

  /// Creates a [CarpoolDay] from JSON.
  factory CarpoolDay.fromJson(Map<String, dynamic> json) =>
      _$CarpoolDayFromJson(json);

  /// Whether this day has an assigned driver.
  bool get hasDriver => driverId != null && driverId!.isNotEmpty;

  /// Short day label (e.g., 'Mon', 'Tue').
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

  /// Date label showing day of month.
  String get dateLabel {
    return '${date.day}';
  }
}
