import 'package:bloc/bloc.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required CarpoolRepository carpoolRepository,
  })  : _carpoolRepository = carpoolRepository,
        super(const DashboardState()) {
    on<DashboardStarted>(_onStarted);
    on<DashboardRefreshed>(_onRefreshed);
  }

  final CarpoolRepository _carpoolRepository;

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await _loadCarpools(emit);
  }

  Future<void> _onRefreshed(
    DashboardRefreshed event,
    Emitter<DashboardState> emit,
  ) async {
    await _loadCarpools(emit);
  }

  Future<void> _loadCarpools(Emitter<DashboardState> emit) async {
    try {
      final carpools = await _carpoolRepository.getUserCarpools();
      emit(
        state.copyWith(
          status: DashboardStatus.success,
          carpools: carpools,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: DashboardStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
