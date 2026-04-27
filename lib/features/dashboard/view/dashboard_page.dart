import 'package:carpool_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:carpool_app/features/dashboard/view/dashboard_view.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        carpoolRepository: context.read<CarpoolRepository>(),
      )..add(const DashboardStarted()),
      child: const DashboardView(),
    );
  }
}
