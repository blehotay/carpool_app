import 'package:authentication_client/src/models/auth_user.dart';

/// Abstract authentication client for user authentication operations.
///
/// Provides methods to sign in, sign up, sign out, and observe
/// authentication state changes.
abstract class AuthenticationClient {
  /// The currently authenticated user, or null if not authenticated.
  AuthUser? get currentUser;

  /// Stream of authentication state changes.
  ///
  /// Emits the current user when authenticated, or null when signed out.
  Stream<AuthUser?> get user;

  /// Signs in a user with email and password.
  ///
  /// Throws an exception if sign in fails.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Creates a new user account with email and password.
  ///
  /// Throws an exception if sign up fails.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  Future<void> signOut();
}
