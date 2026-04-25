import 'package:authentication_client/authentication_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationClient authenticationClient,
  })  : _authenticationClient = authenticationClient,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationClient _authenticationClient;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _authenticationClient.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (error) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
