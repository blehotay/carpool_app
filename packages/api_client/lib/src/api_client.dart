import 'package:api_client/src/models/models.dart';

/// Abstract API client for carpool data operations.
///
/// Provides methods to interact with the backend data store
/// for carpools, schedules, and user preferences.
abstract class ApiClient {
  /// Retrieves the week schedule for a specific carpool.
  Future<WeekScheduleDto> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  });

  /// Updates the week schedule for a specific carpool.
  Future<void> updateWeekSchedule({
    required String carpoolId,
    required WeekScheduleDto schedule,
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
    required UserPreferencesDto preferences,
  });

  /// Retrieves user preferences.
  Future<UserPreferencesDto> getUserPreferences({
    required String userId,
  });

  /// Retrieves all members of a carpool.
  Future<List<UserDto>> getCarpoolMembers({
    required String carpoolId,
  });

  /// Retrieves a specific carpool by ID.
  Future<CarpoolDto> getCarpool({
    required String carpoolId,
  });
}
