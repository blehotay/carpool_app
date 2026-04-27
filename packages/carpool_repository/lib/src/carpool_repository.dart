import 'package:carpool_repository/src/models/models.dart';

/// Repository for carpool domain operations.
///
/// Provides domain-level methods for managing carpools, schedules,
/// members, and user preferences. Abstracts the data layer from
/// the business logic.
abstract class CarpoolRepository {
  /// Retrieves the week schedule for a specific carpool.
  Future<CarpoolWeek> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  });

  /// Updates the week schedule for a specific carpool.
  Future<void> updateWeekSchedule({
    required String carpoolId,
    required CarpoolWeek week,
  });

  /// Requests a driver swap for a specific day.
  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  });

  /// Updates user preferences.
  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  });

  /// Retrieves user preferences.
  Future<UserPreferences> getUserPreferences({
    required String userId,
  });

  /// Retrieves all members of a carpool.
  Future<List<CarpoolMember>> getCarpoolMembers({
    required String carpoolId,
  });

  /// Retrieves a specific carpool by ID.
  Future<Carpool> getCarpool({
    required String carpoolId,
  });

  /// Retrieves all carpools for the current user.
  Future<List<Carpool>> getUserCarpools();
}
