import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preferences_dto.g.dart';

@JsonSerializable()
class UserPreferencesDto extends Equatable {
  const UserPreferencesDto({
    required this.unavailableDays,
    required this.maxDaysPerWeek,
    required this.preferredDays,
  });

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);

  final List<int> unavailableDays;
  final int maxDaysPerWeek;
  final List<int> preferredDays;

  Map<String, dynamic> toJson() => _$UserPreferencesDtoToJson(this);

  @override
  List<Object?> get props => [unavailableDays, maxDaysPerWeek, preferredDays];
}
