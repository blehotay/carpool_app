import 'package:app_ui/app_ui.dart';
import 'package:carpool_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Carpools'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout
            },
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.status == DashboardStatus.loading) {
            return const Center(child: AppLoadingIndicator());
          }

          if (state.status == DashboardStatus.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: AppSpacing.md),
                  Text(state.errorMessage ?? 'Failed to load carpools'),
                  const SizedBox(height: AppSpacing.md),
                  ElevatedButton(
                    onPressed: () => context
                        .read<DashboardBloc>()
                        .add(const DashboardRefreshed()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state.carpools.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_car_outlined,
                    size: 80,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'No Carpools Yet',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Create a carpool to get started',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xlg),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home/create-carpool'),
                    icon: const Icon(Icons.add),
                    label: const Text('Create Carpool'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardBloc>().add(const DashboardRefreshed());
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: state.carpools.length,
              itemBuilder: (context, index) {
                final carpool = state.carpools[index];
                return _CarpoolCard(carpool: carpool);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/home/create-carpool'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CarpoolCard extends StatelessWidget {
  const _CarpoolCard({required this.carpool});

  final Carpool carpool;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.directions_car,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(carpool.name),
        subtitle:
            Text('${carpool.memberIds.length} members • ${carpool.location}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go('/home/carpools/${carpool.id}'),
      ),
    );
  }
}
