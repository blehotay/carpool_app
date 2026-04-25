import 'package:authentication_client/src/models/auth_user.dart';

abstract class AuthenticationClient {
  Stream<AuthUser?> get user;

  AuthUser? get currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
