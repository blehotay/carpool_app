import 'package:api_client/src/models/models.dart';

abstract class ApiClient {
  Future<WeekScheduleDto> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  });

  Future<void> updateWeekSchedule({
    required String carpoolId,
    required WeekScheduleDto schedule,
  });

  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  });

  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferencesDto preferences,
  });

  Future<UserPreferencesDto> getUserPreferences({
    required String userId,
  });

  Future<List<UserDto>> getCarpoolMembers({
    required String carpoolId,
  });

  Future<CarpoolDto> getCarpool({
    required String carpoolId,
  });
}
