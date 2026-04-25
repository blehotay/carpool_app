# Carpool App Implementation Status

## ✅ Completed Packages

### 1. api_client (`packages/api_client/`)
- **Purpose**: Firebase communication layer
- **Status**: Structure complete, needs code generation
- **Models**: CarpoolDto, UserDto, WeekScheduleDto, DayScheduleDto, UserPreferencesDto
- **Next Step**: Run `dart run build_runner build` in this package

### 2. authentication_client (`packages/authentication_client/`)
- **Purpose**: Firebase Auth abstraction
- **Status**: Complete
- **Models**: AuthUser
- **Implementation**: FirebaseAuthenticationClient

### 3. app_ui (`packages/app_ui/`)
- **Purpose**: Shared design system and UI components
- **Status**: Complete
- **Includes**:
  - AppColors (Material Design 3 color scheme)
  - AppTextStyles (Material Design 3 typography)
  - AppSpacing (consistent spacing values)
  - AppTheme (light theme configuration)
  - AppChip component
  - AppLoadingIndicator component

### 4. carpool_repository (`packages/carpool_repository/`)
- **Purpose**: Domain models and repository abstraction
- **Status**: Models complete, implementations needed
- **Models** (using freezed):
  - Carpool
  - CarpoolMember
  - CarpoolDay (with helper methods: `hasDriver`, `dayLabel`, `dateLabel`)
  - CarpoolWeek (with helper methods: `weekLabel`, `getDayById`, `getNextDrivingDay`, `isUserDrivingToday`)
  - UserPreferences
- **Next Step**: 
  1. Run `dart run build_runner build` in this package
  2. Create FirebaseCarpoolRepository implementation
  3. Create MockCarpoolRepository for testing

## 🚧 In Progress / Needed

### 5. user_repository (`packages/user_repository/`)
- **Status**: NOT STARTED
- **Needed**: Repository for user data management

### 6. Weekly Carpool Feature (`lib/features/weekly_carpool/`)
- **Status**: NOT STARTED
- **Structure Needed**:
  ```
  lib/features/weekly_carpool/
    bloc/
      weekly_carpool_bloc.dart
      weekly_carpool_event.dart
      weekly_carpool_state.dart
    view/
      weekly_carpool_page.dart
      weekly_carpool_view.dart
      view.dart
    widgets/
      weekly_carpool_status_card.dart
      weekly_timeline.dart
      day_detail_panel.dart
      carpool_day_card.dart
    weekly_carpool.dart
  ```

### 7. Root App Updates
- **Status**: NOT STARTED
- **Needed**:
  - Update `pubspec.yaml` with package dependencies
  - Create dependency injection setup
  - Create router configuration
  - Wire up Weekly Carpool feature

## 📋 Next Steps

### Step 1: Run Code Generation
```bash
# In api_client package
cd packages/api_client
dart run build_runner build --delete-conflicting-outputs

# In carpool_repository package
cd ../carpool_repository
dart run build_runner build --delete-conflicting-outputs
```

### Step 2: Complete Repository Implementations
Create the following files:
- `packages/carpool_repository/lib/src/firebase_carpool_repository.dart`
- `packages/carpool_repository/lib/src/mock_carpool_repository.dart`
- `packages/user_repository/` (entire package)

### Step 3: Build Weekly Carpool Feature
Following VGV architecture:
1. Create BLoC (events, states, bloc)
2. Create views (page, view)
3. Create widgets (status card, timeline, day detail panel, day card)

### Step 4: Update Root App
1. Add package dependencies to root `pubspec.yaml`
2. Create dependency injection
3. Set up routing
4. Initialize Firebase
5. Wire up the feature

## 🎯 Key Architecture Principles

✅ **Correct**:
- Feature UI/BLoC lives in `lib/features/weekly_carpool/`
- Infrastructure lives in `packages/`
- Repositories hide data sources
- UI talks to BLoC
- BLoC talks to repositories
- Repositories talk to API clients
- Firebase stays in `api_client` package

❌ **Incorrect**:
- DO NOT put feature code in `packages/`
- DO NOT call Firebase directly from UI or BLoC
- DO NOT put business logic in widgets
- DO NOT skip repository abstraction

## 📦 Package Dependency Flow

```
Weekly Carpool Feature
  ↓ depends on
carpool_repository
  ↓ depends on
api_client
  ↓ depends on
Firebase SDK
```

## 🎨 UI Components from Design

Based on the provided mockups, the Weekly Carpool screen includes:

1. **Status Card** (most prominent):
   - Shows personalized messages like "You're driving tomorrow"
   - Displays time and children names
   - Uses purple background with car icon

2. **Weekly Timeline** (horizontal scroll):
   - Day cards showing Mon-Fri
   - Each card shows: day label, date, driver indicator
   - Visual states: "You", "Other driver", "Need driver"
   - Selected day has purple border

3. **Day Detail Panel**:
   - Shows driver name with avatar
   - Pickup time
   - List of kids as chips
   - Action buttons (if user is driver)

4. **Bottom Actions**:
   - "Edit schedule" (secondary button)
   - "Generate schedule" (primary button, teal)

## 🔥 Firebase Structure (Implied)

```
/carpools/{carpoolId}
  - name
  - location
  - memberIds[]
  - pickupTime
  
  /schedules/{weekId}
    - carpoolId
    - weekStart
    - days[]
      - id
      - date
      - driverId
      - childrenIds[]
      - status

/users/{userId}
  - name
  - email
  - childrenNames[]
  - preferences
    - unavailableDays[]
    - maxDaysPerWeek
    - preferredDays[]
```

## ✨ Animation Requirements

- Day selection: subtle scale/highlight (150-250ms)
- Status card transition: fade/slide
- Schedule generation: transition animation
- Use implicit animations (AnimatedContainer, AnimatedOpacity, etc.)

## 🧪 Testing Strategy

Each package should include:
- Unit tests for models
- Unit tests for repository implementations
- BLoC tests for all events and states
- Widget tests for UI components

## 📝 Notes

- All code generation errors are expected until `build_runner` is executed
- The app uses Material Design 3
- State management: flutter_bloc
- Domain models: freezed + json_serializable
- The feature should handle all edge cases (no driver, empty schedule, loading, errors)
