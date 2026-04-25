import 'package:carpool_repository/src/carpool_repository.dart';
import 'package:carpool_repository/src/models/models.dart';

class MockCarpoolRepository implements CarpoolRepository {
  @override
  Future<CarpoolWeek> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    
    final monday = weekStart;
    return CarpoolWeek(
      carpoolId: carpoolId,
      weekStart: weekStart,
      days: [
        CarpoolDay(
          id: '1',
          date: monday,
          driverId: 'user2',
          driverName: 'Sarah',
          childrenNames: ['Lily', 'Noah'],
          status: DayStatus.assigned,
        ),
        CarpoolDay(
          id: '2',
          date: monday.add(const Duration(days: 1)),
          driverId: 'user1',
          driverName: 'You',
          childrenNames: ['Lily', 'Noah', 'Ava', 'Oliver'],
          status: DayStatus.assigned,
        ),
        CarpoolDay(
          id: '3',
          date: monday.add(const Duration(days: 2)),
          driverId: 'user3',
          driverName: 'Mike Torres',
          childrenNames: ['Lily', 'Noah'],
          status: DayStatus.assigned,
        ),
        CarpoolDay(
          id: '4',
          date: monday.add(const Duration(days: 3)),
          driverId: null,
          driverName: null,
          childrenNames: [],
          status: DayStatus.needsDriver,
        ),
        CarpoolDay(
          id: '5',
          date: monday.add(const Duration(days: 4)),
          driverId: 'user4',
          driverName: 'Emma',
          childrenNames: ['Ava', 'Oliver'],
          status: DayStatus.assigned,
        ),
      ],
    );
  }

  @override
  Future<void> updateWeekSchedule({
    required String carpoolId,
    required CarpoolWeek week,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Future<UserPreferences> getUserPreferences({
    required String userId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const UserPreferences(
      unavailableDays: [6, 7],
      maxDaysPerWeek: 2,
      preferredDays: [2, 4],
    );
  }

  @override
  Future<List<CarpoolMember>> getCarpoolMembers({
    required String carpoolId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [
      const CarpoolMember(
        id: 'user1',
        name: 'You',
        email: 'you@example.com',
        childrenNames: ['Lily', 'Noah'],
      ),
      const CarpoolMember(
        id: 'user2',
        name: 'Sarah',
        email: 'sarah@example.com',
        childrenNames: ['Ava'],
      ),
      const CarpoolMember(
        id: 'user3',
        name: 'Mike Torres',
        email: 'mike@example.com',
        childrenNames: ['Oliver'],
      ),
      const CarpoolMember(
        id: 'user4',
        name: 'Emma',
        email: 'emma@example.com',
        childrenNames: ['Sophia'],
      ),
    ];
  }

  @override
  Future<Carpool> getCarpool({
    required String carpoolId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const Carpool(
      id: 'carpool1',
      name: 'Soccer Practice',
      location: 'Riverside Soccer Fields',
      memberIds: ['user1', 'user2', 'user3', 'user4'],
      pickupTime: '3:30 PM',
    );
  }
}
