import 'package:authentication_client/src/authentication_client.dart';
import 'package:authentication_client/src/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

/// Firebase implementation of [AuthenticationClient].
class FirebaseAuthenticationClient implements AuthenticationClient {
  /// Creates a [FirebaseAuthenticationClient].
  ///
  /// Optionally accepts a [firebase_auth.FirebaseAuth] instance for testing.
  FirebaseAuthenticationClient({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthUser?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? null : _mapFirebaseUser(firebaseUser);
    });
  }

  @override
  AuthUser? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null ? null : _mapFirebaseUser(firebaseUser);
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  AuthUser _mapFirebaseUser(firebase_auth.User firebaseUser) {
    return AuthUser(
      id: firebaseUser.uid,
      email: firebaseUser.email,
    );
  }
}
