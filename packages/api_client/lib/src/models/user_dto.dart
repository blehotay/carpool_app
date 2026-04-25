import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

/// Data transfer object for user data from the API.
@JsonSerializable()
class UserDto extends Equatable {
  /// Creates a [UserDto].
  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.childrenNames,
  });

  /// Creates a [UserDto] from JSON.
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  /// Unique identifier for the user.
  final String id;

  /// User's display name.
  final String name;

  /// User's email address.
  final String email;

  /// Names of user's children.
  final List<String> childrenNames;

  /// Converts this DTO to JSON.
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  List<Object?> get props => [id, name, email, childrenNames];
}
