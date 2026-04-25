import 'package:carpool_repository/src/models/carpool_day.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool_week.freezed.dart';
part 'carpool_week.g.dart';

/// Domain model representing a week of carpool schedules.
@freezed
class CarpoolWeek with _$CarpoolWeek {
  /// Creates a [CarpoolWeek].
  const factory CarpoolWeek({
    required String carpoolId,
    required DateTime weekStart,
    required List<CarpoolDay> days,
  }) = _CarpoolWeek;

  const CarpoolWeek._();

  /// Creates a [CarpoolWeek] from JSON.
  factory CarpoolWeek.fromJson(Map<String, dynamic> json) =>
      _$CarpoolWeekFromJson(json);

  /// End date of the week (Sunday).
  DateTime get weekEnd => weekStart.add(const Duration(days: 6));

  /// Formatted week label (e.g., 'Jan 1-7').
  String get weekLabel {
    final startMonth = _monthName(weekStart.month);
    final endMonth = _monthName(weekEnd.month);

    if (weekStart.month == weekEnd.month) {
      return '$startMonth ${weekStart.day}-${weekEnd.day}';
    } else {
      return '$startMonth ${weekStart.day} - $endMonth ${weekEnd.day}';
    }
  }

  /// Gets a specific day by ID.
  CarpoolDay? getDayById(String dayId) {
    try {
      return days.firstWhere((day) => day.id == dayId);
    } catch (_) {
      return null;
    }
  }

  /// Gets all days assigned to a specific driver.
  List<CarpoolDay> getDaysForDriver(String driverId) {
    return days.where((day) => day.driverId == driverId).toList();
  }

  /// Gets the next driving day for a user after the current date.
  CarpoolDay? getNextDrivingDay(String userId, DateTime currentDate) {
    final userDays = getDaysForDriver(userId);
    for (final day in userDays) {
      if (day.date.isAfter(currentDate) || _isSameDay(day.date, currentDate)) {
        return day;
      }
    }
    return null;
  }

  /// Checks if a user is driving today.
  bool isUserDrivingToday(String userId, DateTime today) {
    final userDays = getDaysForDriver(userId);
    return userDays.any((day) => _isSameDay(day.date, today));
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
