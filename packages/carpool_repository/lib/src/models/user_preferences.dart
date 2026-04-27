import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

/// Domain model representing user carpool preferences.
@freezed
class UserPreferences with _$UserPreferences {
  /// Creates [UserPreferences].
  const factory UserPreferences({
    required List<int> unavailableDays,
    required int maxDaysPerWeek,
    required List<int> preferredDays,
  }) = _UserPreferences;

  /// Creates [UserPreferences] from JSON.
  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}
