import 'dart:async';

import 'package:carpool_app/app/bloc/app_bloc.dart';
import 'package:carpool_app/features/login/login.dart';
import 'package:carpool_app/features/signup/signup.dart';
import 'package:carpool_app/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({required this.appBloc});

  final AppBloc appBloc;

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
    redirect: (context, state) {
      final isAuthenticated = appBloc.state.status == AppStatus.authenticated;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';
      final isSplash = state.matchedLocation == '/';

      if (isSplash) {
        return null;
      }

      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      if (isAuthenticated && isAuthRoute) {
        return '/home/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      // TODO: Add home shell routes
      // TODO: Add join carpool route
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
