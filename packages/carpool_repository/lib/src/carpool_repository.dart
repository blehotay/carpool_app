import 'package:carpool_repository/src/models/models.dart';

abstract class CarpoolRepository {
  Future<CarpoolWeek> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  });

  Future<void> updateWeekSchedule({
    required String carpoolId,
    required CarpoolWeek week,
  });

  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  });

  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  });

  Future<UserPreferences> getUserPreferences({
    required String userId,
  });

  Future<List<CarpoolMember>> getCarpoolMembers({
    required String carpoolId,
  });

  Future<Carpool> getCarpool({
    required String carpoolId,
  });

  Future<List<Carpool>> getUserCarpools();
}
