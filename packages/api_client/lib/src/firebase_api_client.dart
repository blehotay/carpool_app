import 'package:api_client/src/api_client.dart';
import 'package:api_client/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Firebase implementation of [ApiClient].
///
/// Uses Cloud Firestore for data persistence.
class FirebaseApiClient implements ApiClient {
  /// Creates a [FirebaseApiClient].
  ///
  /// Optionally accepts a [FirebaseFirestore] instance for testing.
  FirebaseApiClient({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<WeekScheduleDto> getWeekSchedule({
    required String carpoolId,
    required DateTime weekStart,
  }) async {
    final weekId = _getWeekId(weekStart);
    final doc = await _firestore
        .collection('carpools')
        .doc(carpoolId)
        .collection('schedules')
        .doc(weekId)
        .get();

    if (!doc.exists) {
      throw Exception('Schedule not found for week $weekId');
    }

    return WeekScheduleDto.fromJson(doc.data()!);
  }

  @override
  Future<void> updateWeekSchedule({
    required String carpoolId,
    required WeekScheduleDto schedule,
  }) async {
    final weekId = _getWeekId(schedule.weekStart);
    await _firestore
        .collection('carpools')
        .doc(carpoolId)
        .collection('schedules')
        .doc(weekId)
        .set(schedule.toJson());
  }

  @override
  Future<void> requestDriverSwap({
    required String carpoolId,
    required String dayId,
    required String userId,
  }) async {
    await _firestore.collection('swap_requests').add({
      'carpoolId': carpoolId,
      'dayId': dayId,
      'requestedBy': userId,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferencesDto preferences,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .update({'preferences': preferences.toJson()});
  }

  @override
  Future<UserPreferencesDto> getUserPreferences({
    required String userId,
  }) async {
    final doc = await _firestore.collection('users').doc(userId).get();

    if (!doc.exists) {
      throw Exception('User not found');
    }

    final data = doc.data()!;
    return UserPreferencesDto.fromJson(
      data['preferences'] as Map<String, dynamic>,
    );
  }

  @override
  Future<List<UserDto>> getCarpoolMembers({
    required String carpoolId,
  }) async {
    final carpool = await getCarpool(carpoolId: carpoolId);
    final memberIds = carpool.memberIds;

    final users = <UserDto>[];
    for (final memberId in memberIds) {
      final doc = await _firestore.collection('users').doc(memberId).get();
      if (doc.exists) {
        users.add(UserDto.fromJson(doc.data()!));
      }
    }

    return users;
  }

  @override
  Future<CarpoolDto> getCarpool({
    required String carpoolId,
  }) async {
    final doc = await _firestore.collection('carpools').doc(carpoolId).get();

    if (!doc.exists) {
      throw Exception('Carpool not found');
    }

    return CarpoolDto.fromJson(doc.data()!);
  }

  String _getWeekId(DateTime weekStart) {
    final weekNumber = _getWeekNumber(weekStart).toString().padLeft(2, '0');
    return '${weekStart.year}-W$weekNumber';
  }

  int _getWeekNumber(DateTime date) {
    final dayOfYear = int.parse(
      date.difference(DateTime(date.year)).inDays.toString(),
    );
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}
