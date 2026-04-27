import 'package:api_client/api_client.dart';
import 'package:carpool_repository/src/carpool_repository.dart';
import 'package:carpool_repository/src/models/models.dart';

/// Firebase implementation of [CarpoolRepository].
class FirebaseCarpoolRepository implements CarpoolRepository {
  /// Creates a [FirebaseCarpoolRepository].
  FirebaseCarpoolRepository({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<CarpoolWeek> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  }) async {
    final dto = await _apiClient.getWeekSchedule(
      carpoolId: carpoolId,
      weekStart: weekStart,
    );
    return _mapWeekScheduleDtoToDomain(dto);
  }

  @override
  Future<void> updateWeekSchedule({
    required String carpoolId,
    required CarpoolWeek week,
  }) async {
    final dto = _mapCarpoolWeekToDto(week);
    await _apiClient.updateWeekSchedule(
      carpoolId: carpoolId,
      schedule: dto,
    );
  }

  @override
  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  }) async {
    await _apiClient.requestDriverSwap(
      carpoolId: carpoolId,
      dayId: dayId,
      userId: userId,
    );
  }

  @override
  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    final dto = _mapUserPreferencesToDto(preferences);
    await _apiClient.updateUserPreferences(
      userId: userId,
      preferences: dto,
    );
  }

  @override
  Future<UserPreferences> getUserPreferences({
    required String userId,
  }) async {
    final dto = await _apiClient.getUserPreferences(userId: userId);
    return _mapUserPreferencesDtoToDomain(dto);
  }

  @override
  Future<List<CarpoolMember>> getCarpoolMembers({
    required String carpoolId,
  }) async {
    final dtos = await _apiClient.getCarpoolMembers(carpoolId: carpoolId);
    return dtos.map(_mapUserDtoToDomain).toList();
  }

  @override
  Future<Carpool> getCarpool({
    required String carpoolId,
  }) async {
    final dto = await _apiClient.getCarpool(carpoolId: carpoolId);
    return _mapCarpoolDtoToDomain(dto);
  }

  CarpoolWeek _mapWeekScheduleDtoToDomain(WeekScheduleDto dto) {
    return CarpoolWeek(
      carpoolId: dto.carpoolId,
      weekStart: dto.weekStart,
      days: dto.days.map(_mapDayScheduleDtoToDomain).toList(),
    );
  }

  CarpoolDay _mapDayScheduleDtoToDomain(DayScheduleDto dto) {
    return CarpoolDay(
      id: dto.id,
      date: dto.date,
      driverId: dto.driverId,
      driverName: null,
      childrenNames: [],
      status: _mapStatusStringToDomain(dto.status),
    );
  }

  DayStatus _mapStatusStringToDomain(String status) {
    switch (status.toLowerCase()) {
      case 'assigned':
        return DayStatus.assigned;
      case 'needsdriver':
      case 'needs_driver':
        return DayStatus.needsDriver;
      case 'cancelled':
        return DayStatus.cancelled;
      default:
        return DayStatus.needsDriver;
    }
  }

  WeekScheduleDto _mapCarpoolWeekToDto(CarpoolWeek week) {
    return WeekScheduleDto(
      carpoolId: week.carpoolId,
      weekStart: week.weekStart,
      days: week.days.map(_mapCarpoolDayToDto).toList(),
    );
  }

  DayScheduleDto _mapCarpoolDayToDto(CarpoolDay day) {
    return DayScheduleDto(
      id: day.id,
      date: day.date,
      driverId: day.driverId,
      childrenIds: const [],
      status: _mapDayStatusToString(day.status),
    );
  }

  String _mapDayStatusToString(DayStatus status) {
    switch (status) {
      case DayStatus.assigned:
        return 'assigned';
      case DayStatus.needsDriver:
        return 'needsDriver';
      case DayStatus.cancelled:
        return 'cancelled';
    }
  }

  UserPreferencesDto _mapUserPreferencesToDto(UserPreferences preferences) {
    return UserPreferencesDto(
      unavailableDays: preferences.unavailableDays,
      maxDaysPerWeek: preferences.maxDaysPerWeek,
      preferredDays: preferences.preferredDays,
    );
  }

  UserPreferences _mapUserPreferencesDtoToDomain(UserPreferencesDto dto) {
    return UserPreferences(
      unavailableDays: dto.unavailableDays,
      maxDaysPerWeek: dto.maxDaysPerWeek,
      preferredDays: dto.preferredDays,
    );
  }

  CarpoolMember _mapUserDtoToDomain(UserDto dto) {
    return CarpoolMember(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      childrenNames: dto.childrenNames,
    );
  }

  Carpool _mapCarpoolDtoToDomain(CarpoolDto dto) {
    return Carpool(
      id: dto.id,
      name: dto.name,
      location: dto.location,
      memberIds: dto.memberIds,
      pickupTime: dto.pickupTime,
    );
  }

  @override
  Future<List<Carpool>> getUserCarpools() async {
    // TODO(dev): Implement Firebase query to get user's carpools
    // Query carpools collection where memberIds array contains current user ID
    throw UnimplementedError(
      'getUserCarpools not yet implemented for Firebase',
    );
  }
}
