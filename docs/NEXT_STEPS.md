# Next Steps: Complete the Carpool App

## ✅ What's Been Built

I've created a production-grade VGV-style Flutter application architecture with:

### Packages Created
1. **`api_client`** - Firebase communication layer with DTOs
2. **`authentication_client`** - Firebase Auth abstraction  
3. **`app_ui`** - Material Design 3 design system
4. **`carpool_repository`** - Domain models and repository pattern

### Key Features
- Clean architecture with proper separation of concerns
- Domain models using `freezed` for immutability
- Repository pattern hiding Firebase implementation
- Reusable UI components and design system
- Mock repository for testing without Firebase

## 🚀 Critical Next Step: Run Code Generation

**You MUST run code generation before the app will compile.**

```bash
# Navigate to api_client and run build_runner
cd packages/api_client
dart run build_runner build --delete-conflicting-outputs

# Navigate to carpool_repository and run build_runner  
cd ../carpool_repository
dart run build_runner build --delete-conflicting-outputs

# Return to root
cd ../..
```

This will generate:
- `.g.dart` files for json_serializable
- `.freezed.dart` files for freezed models

## 📋 Remaining Implementation Tasks

### Task 1: Update Root `pubspec.yaml`

Add these dependencies to `/Users/benlehotay/CascadeProjects/carpool_app/pubspec.yaml`:

```yaml
dependencies:
  # Existing dependencies...
  
  # Local packages
  api_client:
    path: packages/api_client
  authentication_client:
    path: packages/authentication_client
  app_ui:
    path: packages/app_ui
  carpool_repository:
    path: packages/carpool_repository
  
  # Firebase
  firebase_core: ^3.0.0
  firebase_auth: ^5.0.0
  cloud_firestore: ^5.0.0
  
  # State management (already included)
  # flutter_bloc: ^8.1.6
  # bloc: ^8.1.4
  
  # Other
  equatable: ^2.0.5
  go_router: ^14.0.0
```

### Task 2: Build Weekly Carpool Feature

Create the BLoC first:

#### `lib/features/weekly_carpool/bloc/weekly_carpool_event.dart`
```dart
part of 'weekly_carpool_bloc.dart';

sealed class WeeklyCarpoolEvent extends Equatable {
  const WeeklyCarpoolEvent();

  @override
  List<Object?> get props => [];
}

final class WeeklyCarpoolStarted extends WeeklyCarpoolEvent {
  const WeeklyCarpoolStarted({
    required this.carpoolId,
    required this.userId,
  });

  final String carpoolId;
  final String userId;

  @override
  List<Object?> get props => [carpoolId, userId];
}

final class WeeklyCarpoolDaySelected extends WeeklyCarpoolEvent {
  const WeeklyCarpoolDaySelected(this.dayId);

  final String dayId;

  @override
  List<Object?> get props => [dayId];
}

final class WeeklyCarpoolScheduleGenerated extends WeeklyCarpoolEvent {
  const WeeklyCarpoolScheduleGenerated();
}

final class WeeklyCarpoolDriverSwapRequested extends WeeklyCarpoolEvent {
  const WeeklyCarpoolDriverSwapRequested(this.dayId);

  final String dayId;

  @override
  List<Object?> get props => [dayId];
}
```

#### `lib/features/weekly_carpool/bloc/weekly_carpool_state.dart`
```dart
part of 'weekly_carpool_bloc.dart';

enum WeeklyCarpoolStatus { initial, loading, success, failure }

final class WeeklyCarpoolState extends Equatable {
  const WeeklyCarpoolState({
    this.status = WeeklyCarpoolStatus.initial,
    this.carpool,
    this.week,
    this.selectedDayId,
    this.userId,
    this.failureMessage,
  });

  final WeeklyCarpoolStatus status;
  final Carpool? carpool;
  final CarpoolWeek? week;
  final String? selectedDayId;
  final String? userId;
  final String? failureMessage;

  CarpoolDay? get selectedDay {
    if (week == null || selectedDayId == null) return null;
    return week!.getDayById(selectedDayId!);
  }

  CarpoolDay? get nextDrivingDay {
    if (week == null || userId == null) return null;
    return week!.getNextDrivingDay(userId!, DateTime.now());
  }

  bool get isUserDrivingToday {
    if (week == null || userId == null) return false;
    return week!.isUserDrivingToday(userId!, DateTime.now());
  }

  WeeklyCarpoolState copyWith({
    WeeklyCarpoolStatus? status,
    Carpool? carpool,
    CarpoolWeek? week,
    String? selectedDayId,
    String? userId,
    String? failureMessage,
  }) {
    return WeeklyCarpoolState(
      status: status ?? this.status,
      carpool: carpool ?? this.carpool,
      week: week ?? this.week,
      selectedDayId: selectedDayId ?? this.selectedDayId,
      userId: userId ?? this.userId,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        carpool,
        week,
        selectedDayId,
        userId,
        failureMessage,
      ];
}
```

#### `lib/features/weekly_carpool/bloc/weekly_carpool_bloc.dart`
```dart
import 'package:bloc/bloc.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:equatable/equatable.dart';

part 'weekly_carpool_event.dart';
part 'weekly_carpool_state.dart';

class WeeklyCarpoolBloc
    extends Bloc<WeeklyCarpoolEvent, WeeklyCarpoolState> {
  WeeklyCarpoolBloc({
    required CarpoolRepository carpoolRepository,
  })  : _carpoolRepository = carpoolRepository,
        super(const WeeklyCarpoolState()) {
    on<WeeklyCarpoolStarted>(_onStarted);
    on<WeeklyCarpoolDaySelected>(_onDaySelected);
    on<WeeklyCarpoolScheduleGenerated>(_onScheduleGenerated);
    on<WeeklyCarpoolDriverSwapRequested>(_onDriverSwapRequested);
  }

  final CarpoolRepository _carpoolRepository;

  Future<void> _onStarted(
    WeeklyCarpoolStarted event,
    Emitter<WeeklyCarpoolState> emit,
  ) async {
    emit(state.copyWith(
      status: WeeklyCarpoolStatus.loading,
      userId: event.userId,
    ));

    try {
      final carpool = await _carpoolRepository.getCarpool(
        carpoolId: event.carpoolId,
      );

      final weekStart = _getWeekStart(DateTime.now());
      final week = await _carpoolRepository.getWeekSchedule(
        carpoolId: event.carpoolId,
        weekStart: weekStart,
      );

      emit(state.copyWith(
        status: WeeklyCarpoolStatus.success,
        carpool: carpool,
        week: week,
        selectedDayId: week.days.isNotEmpty ? week.days.first.id : null,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: WeeklyCarpoolStatus.failure,
        failureMessage: error.toString(),
      ));
    }
  }

  void _onDaySelected(
    WeeklyCarpoolDaySelected event,
    Emitter<WeeklyCarpoolState> emit,
  ) {
    emit(state.copyWith(selectedDayId: event.dayId));
  }

  Future<void> _onScheduleGenerated(
    WeeklyCarpoolScheduleGenerated event,
    Emitter<WeeklyCarpoolState> emit,
  ) async {
    // TODO: Implement schedule generation logic
  }

  Future<void> _onDriverSwapRequested(
    WeeklyCarpoolDriverSwapRequested event,
    Emitter<WeeklyCarpoolState> emit,
  ) async {
    if (state.userId == null) return;

    try {
      await _carpoolRepository.requestDriverSwap(
        carpoolId: state.carpool!.id,
        dayId: event.dayId,
        userId: state.userId!,
      );
    } catch (error) {
      emit(state.copyWith(
        status: WeeklyCarpoolStatus.failure,
        failureMessage: 'Failed to request swap',
      ));
    }
  }

  DateTime _getWeekStart(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }
}
```

### Task 3: Build UI Components

Create these widgets in `lib/features/weekly_carpool/widgets/`:

1. **`weekly_carpool_status_card.dart`** - The prominent status card
2. **`weekly_timeline.dart`** - Horizontal scrolling day cards
3. **`carpool_day_card.dart`** - Individual day card in timeline
4. **`day_detail_panel.dart`** - Shows selected day details

### Task 4: Build Views

Create in `lib/features/weekly_carpool/view/`:

1. **`weekly_carpool_page.dart`** - Provides BLoC
2. **`weekly_carpool_view.dart`** - Main UI layout

### Task 5: Set Up Dependency Injection

Create `lib/app/dependency_injection/service_locator.dart`:

```dart
import 'package:api_client/api_client.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // API Client
  getIt.registerLazySingleton<ApiClient>(
    () => FirebaseApiClient(),
  );

  // Auth Client
  getIt.registerLazySingleton<AuthenticationClient>(
    () => FirebaseAuthenticationClient(),
  );

  // Repositories
  getIt.registerLazySingleton<CarpoolRepository>(
    () => MockCarpoolRepository(), // Use FirebaseCarpoolRepository in production
  );
}
```

### Task 6: Set Up Routing

Create `lib/app/router/app_router.dart` using `go_router`.

### Task 7: Initialize Firebase

Update `lib/main_development.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/dependency_injection/service_locator.dart';
import 'bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  
  await bootstrap(() => const App());
}
```

## 🎨 UI Implementation Tips

### Status Card
- Use `Container` with gradient background (purple)
- Car icon from Material Icons
- Animated transitions when status changes
- Show: message, time, children names

### Timeline
- Use `ListView.builder` with `scrollDirection: Axis.horizontal`
- Each day card: rounded container with border
- Selected state: purple border, scale animation
- "You" badge: purple background
- "Need driver": orange border/text

### Day Detail Panel
- Avatar placeholder (circular container with initial)
- Pickup time in large text
- Children as `AppChip` widgets in `Wrap`
- Conditional action buttons

## 🧪 Testing

For each component:
- Write widget tests
- Write BLoC tests
- Test all edge cases

## 📱 Running the App

After completing all steps:

```bash
flutter pub get
flutter run
```

## 🔥 Firebase Setup (When Ready)

1. Create Firebase project
2. Add iOS/Android apps
3. Download config files
4. Update `FirebaseOptions`
5. Switch from `MockCarpoolRepository` to `FirebaseCarpoolRepository`

## 💡 Key Points

- **All lint errors are expected** until code generation runs
- Use `MockCarpoolRepository` for development
- Follow VGV patterns strictly
- Keep Firebase in `api_client` only
- BLoC handles all business logic
- Widgets are purely presentational

## 📚 Resources

- [Very Good CLI](https://cli.vgv.dev/)
- [Flutter BLoC](https://bloclibrary.dev/)
- [Freezed](https://pub.dev/packages/freezed)
- [Go Router](https://pub.dev/packages/go_router)
