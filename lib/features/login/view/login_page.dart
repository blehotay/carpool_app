import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_app/features/login/bloc/login_bloc.dart';
import 'package:carpool_app/features/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationClient: context.read<AuthenticationClient>(),
      ),
      child: const LoginView(),
    );
  }
}
