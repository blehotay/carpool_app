import 'dart:async';

import 'package:carpool_app/app/bloc/app_bloc.dart';
import 'package:carpool_app/features/carpool_detail/carpool_detail.dart';
import 'package:carpool_app/features/dashboard/dashboard.dart';
import 'package:carpool_app/features/home_shell/home_shell.dart';
import 'package:carpool_app/features/login/login.dart';
import 'package:carpool_app/features/profile/profile.dart';
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

      // Redirect from splash based on auth state
      if (isSplash) {
        return isAuthenticated ? '/home/dashboard' : '/login';
      }

      // Redirect to login if not authenticated and not on auth route
      if (!isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      // Redirect to dashboard if authenticated and on auth route
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
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: '/home/dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/home/profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/home/carpools/:carpoolId',
            builder: (context, state) {
              final carpoolId = state.pathParameters['carpoolId']!;
              return CarpoolDetailPage(carpoolId: carpoolId);
            },
          ),
          // TODO: Add create-carpool route
        ],
      ),
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
