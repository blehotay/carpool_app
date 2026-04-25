import 'package:app_ui/app_ui.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_app/app/bloc/app_bloc.dart';
import 'package:carpool_app/app/router/app_router.dart';
import 'package:carpool_app/l10n/l10n.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.authenticationClient,
    required this.carpoolRepository,
    super.key,
  });

  final AuthenticationClient authenticationClient;
  final CarpoolRepository carpoolRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationClient),
        RepositoryProvider.value(value: carpoolRepository),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationClient: authenticationClient,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(appBloc: context.read<AppBloc>());

    return MaterialApp.router(
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.router,
    );
  }
}
