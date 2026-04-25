import 'package:authentication_client/authentication_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:carpool_app/features/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationClient extends Mock implements AuthenticationClient {}

void main() {
  group('LoginBloc', () {
    late AuthenticationClient authenticationClient;

    setUp(() {
      authenticationClient = MockAuthenticationClient();
    });

    test('initial state is LoginState with initial status', () {
      final bloc = LoginBloc(authenticationClient: authenticationClient);
      expect(bloc.state, const LoginState());
      bloc.close();
    });

    group('LoginEmailChanged', () {
      blocTest<LoginBloc, LoginState>(
        'emits state with updated email',
        build: () => LoginBloc(authenticationClient: authenticationClient),
        act: (bloc) => bloc.add(const LoginEmailChanged('test@test.com')),
        expect: () => [
          const LoginState(email: 'test@test.com'),
        ],
      );
    });

    group('LoginPasswordChanged', () {
      blocTest<LoginBloc, LoginState>(
        'emits state with updated password',
        build: () => LoginBloc(authenticationClient: authenticationClient),
        act: (bloc) => bloc.add(const LoginPasswordChanged('password123')),
        expect: () => [
          const LoginState(password: 'password123'),
        ],
      );
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [loading, success] when sign in succeeds',
        setUp: () {
          when(
            () => authenticationClient.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenAnswer((_) async {});
        },
        build: () => LoginBloc(authenticationClient: authenticationClient),
        seed: () => const LoginState(
          email: 'test@test.com',
          password: 'password123',
        ),
        act: (bloc) => bloc.add(const LoginSubmitted()),
        expect: () => [
          const LoginState(
            email: 'test@test.com',
            password: 'password123',
            status: LoginStatus.loading,
          ),
          const LoginState(
            email: 'test@test.com',
            password: 'password123',
            status: LoginStatus.success,
          ),
        ],
        verify: (_) {
          verify(
            () => authenticationClient.signInWithEmailAndPassword(
              email: 'test@test.com',
              password: 'password123',
            ),
          ).called(1);
        },
      );

      blocTest<LoginBloc, LoginState>(
        'emits [loading, failure] when sign in fails',
        setUp: () {
          when(
            () => authenticationClient.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('Sign in failed'));
        },
        build: () => LoginBloc(authenticationClient: authenticationClient),
        seed: () => const LoginState(
          email: 'test@test.com',
          password: 'password123',
        ),
        act: (bloc) => bloc.add(const LoginSubmitted()),
        expect: () => [
          const LoginState(
            email: 'test@test.com',
            password: 'password123',
            status: LoginStatus.loading,
          ),
          const LoginState(
            email: 'test@test.com',
            password: 'password123',
            status: LoginStatus.failure,
            errorMessage: 'Exception: Sign in failed',
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'does nothing when email or password is empty',
        build: () => LoginBloc(authenticationClient: authenticationClient),
        seed: () => const LoginState(email: '', password: ''),
        act: (bloc) => bloc.add(const LoginSubmitted()),
        expect: () => [],
      );
    });
  });
}
