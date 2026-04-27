import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences_dto.g.dart';

/// Data transfer object for user carpool preferences.
@JsonSerializable()
class UserPreferencesDto extends Equatable {
  /// Creates a [UserPreferencesDto].
  const UserPreferencesDto({
    required this.unavailableDays,
    required this.maxDaysPerWeek,
    required this.preferredDays,
  });

  /// Creates a [UserPreferencesDto] from JSON.
  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);

  /// Days of week user is unavailable (0=Monday, 6=Sunday).
  final List<int> unavailableDays;

  /// Maximum days per week user can drive.
  final int maxDaysPerWeek;

  /// Preferred days of week to drive.
  final List<int> preferredDays;

  /// Converts this DTO to JSON.
  Map<String, dynamic> toJson() => _$UserPreferencesDtoToJson(this);

  @override
  List<Object?> get props => [unavailableDays, maxDaysPerWeek, preferredDays];
}
