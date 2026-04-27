part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

final class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

  final AuthUser? user;

  @override
  List<Object?> get props => [user];
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}
