import 'dart:async';

import 'package:authentication_client/src/authentication_client.dart';
import 'package:authentication_client/src/models/auth_user.dart';

/// Mock implementation of [AuthenticationClient] for testing and development.
///
/// Accepts any email/password combination and simulates network delays.
class MockAuthenticationClient implements AuthenticationClient {
  /// Creates a [MockAuthenticationClient].
  MockAuthenticationClient()
      : _controller = StreamController<AuthUser?>.broadcast() {
    // Start with no user (unauthenticated)
    _controller.add(null);
  }

  final StreamController<AuthUser?> _controller;
  AuthUser? _currentUser;

  @override
  AuthUser? get currentUser => _currentUser;

  @override
  Stream<AuthUser?> get user => _controller.stream;

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(seconds: 1));

    // Mock successful login - accept any email/password
    _currentUser = AuthUser(
      id: 'mock-user-id',
      email: email,
    );
    _controller.add(_currentUser);
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(seconds: 1));

    // Mock successful signup
    _currentUser = AuthUser(
      id: 'mock-user-id',
      email: email,
    );
    _controller.add(_currentUser);
  }

  @override
  Future<void> signOut() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 300));

    _currentUser = null;
    _controller.add(null);
  }

  /// Disposes of the stream controller.
  void dispose() {
    _controller.close();
  }
}
