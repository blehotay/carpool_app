part of 'dashboard_bloc.dart';

enum DashboardStatus { initial, loading, success, failure }

final class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.carpools = const [],
    this.errorMessage,
  });

  final DashboardStatus status;
  final List<Carpool> carpools;
  final String? errorMessage;

  DashboardState copyWith({
    DashboardStatus? status,
    List<Carpool>? carpools,
    String? errorMessage,
  }) {
    return DashboardState(
      status: status ?? this.status,
      carpools: carpools ?? this.carpools,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, carpools, errorMessage];
}
