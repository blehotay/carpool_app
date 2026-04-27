import 'package:equatable/equatable.dart';

/// Represents an authenticated user.
class AuthUser extends Equatable {
  /// Creates an [AuthUser].
  const AuthUser({
    required this.id,
    this.email,
  });

  /// Unique identifier for the user.
  final String id;

  /// User's email address.
  final String? email;

  @override
  List<Object?> get props => [id, email];
}
