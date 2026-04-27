# Localization (l10n) and Testing TODO

## ✅ Completed

### Localization
- [x] Added all app strings to `lib/l10n/arb/app_en.arb`
- [x] Generated l10n classes with `flutter gen-l10n`
- [x] Updated Login screen to use l10n
- [x] Includes pluralization for member count

### Testing
- [x] Created comprehensive LoginBloc test with bloc_test
- [x] Tests cover: email/password changes, successful login, failed login, validation

## 🔄 Remaining L10n Work

### Screens to Update

1. **SignUp Screen** (`lib/features/signup/view/signup_page.dart`)
   - Replace: "Create Account", "Name", "Email", "Password", "Already have an account? Sign in"
   - Use: `context.l10n.createAccount`, `context.l10n.name`, etc.

2. **Dashboard Screen** (`lib/features/dashboard/view/dashboard_view.dart`)
   - Replace: "My Carpools", "No Carpools Yet", "Create a carpool to get started", "Create Carpool", "Retry", "Failed to load carpools"
   - Use: `context.l10n.myCarpools`, `context.l10n.noCarpoolsYet`, etc.
   - Member count already uses plural: `context.l10n.members(carpool.memberIds.length)`

3. **Profile Screen** (`lib/features/profile/view/profile_page.dart`)
   - Replace: "Profile", "Sign Out"
   - Use: `context.l10n.profile`, `context.l10n.signOut`

4. **Carpool Detail Screen** (`lib/features/carpool_detail/view/carpool_detail_page.dart`)
   - Replace: "Carpool Details", "Weekly Carpool Board", "Coming in Phase 4!", "Carpool ID: {id}"
   - Use: `context.l10n.carpoolDetails`, `context.l10n.weeklyCarpoolBoard`, `context.l10n.comingInPhase4`, `context.l10n.carpoolId(carpoolId)`

5. **Home Shell** (`lib/features/home_shell/view/home_shell.dart`)
   - Replace: "Home", "Carpools", "Profile"
   - Use: `context.l10n.home`, `context.l10n.carpools`, `context.l10n.profile`

### How to Update
For each screen:
1. Add import: `import 'package:carpool_app/l10n/l10n.dart';`
2. Replace hardcoded strings with `context.l10n.stringKey`
3. For plurals: `context.l10n.members(count)`
4. For interpolation: `context.l10n.carpoolId(id)`

## 🧪 Testing TODO

### Unit Tests Needed

1. **AppBloc** (`test/app/bloc/app_bloc_test.dart`)
   - Test user changed events
   - Test logout requested
   - Test stream subscription

2. **DashboardBloc** (`test/features/dashboard/bloc/dashboard_bloc_test.dart`)
   - Test started event loads carpools
   - Test refresh event
   - Test success state
   - Test failure state
   - Mock CarpoolRepository

3. **MockAuthenticationClient** (`test/packages/authentication_client/mock_authentication_client_test.dart`)
   - Test sign in
   - Test sign up
   - Test sign out
   - Test user stream

4. **MockCarpoolRepository** (`test/packages/carpool_repository/mock_carpool_repository_test.dart`)
   - Test getUserCarpools returns mock data
   - Test getCarpool
   - Test getWeekSchedule

### Widget Tests Needed

1. **LoginPage** (`test/features/login/view/login_page_test.dart`)
   - Test renders login form
   - Test email input updates state
   - Test password input updates state
   - Test sign in button enabled/disabled
   - Test navigation to sign up

2. **DashboardPage** (`test/features/dashboard/view/dashboard_page_test.dart`)
   - Test empty state
   - Test loading state
   - Test success state with carpools
   - Test error state
   - Test navigation to carpool detail

3. **ProfilePage** (`test/features/profile/view/profile_page_test.dart`)
   - Test displays user email
   - Test sign out button

### Integration Tests

1. **Authentication Flow** (`integration_test/authentication_flow_test.dart`)
   - Test complete login flow
   - Test sign out flow
   - Test navigation after login

2. **Dashboard Flow** (`integration_test/dashboard_flow_test.dart`)
   - Test loading carpools
   - Test clicking on carpool
   - Test navigation

### Test Helpers

Create test helpers in `test/helpers/`:
- `pump_app.dart` - Already exists, verify it works with new router
- `mock_authentication_client.dart` - Export for tests
- `mock_carpool_repository.dart` - Export for tests

## 📝 Testing Best Practices

### BLoC Tests
```dart
blocTest<MyBloc, MyState>(
  'description',
  build: () => MyBloc(dependency: mockDependency),
  act: (bloc) => bloc.add(MyEvent()),
  expect: () => [expectedState1, expectedState2],
  verify: (_) {
    verify(() => mockDependency.method()).called(1);
  },
);
```

### Widget Tests
```dart
testWidgets('description', (tester) async {
  await tester.pumpApp(MyWidget());
  expect(find.text('Expected Text'), findsOneWidget);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();
  expect(find.text('After Tap'), findsOneWidget);
});
```

### Mock Setup
```dart
class MockMyDependency extends Mock implements MyDependency {}

setUp(() {
  mockDependency = MockMyDependency();
  when(() => mockDependency.method()).thenAnswer((_) async => result);
});
```

## 🎯 Priority Order

1. **High Priority** (Before Phase 3)
   - [ ] Update all screens to use l10n
   - [ ] Add AppBloc tests
   - [ ] Add DashboardBloc tests
   - [ ] Add LoginPage widget test

2. **Medium Priority** (Before Phase 4)
   - [ ] Add all widget tests
   - [ ] Add repository tests
   - [ ] Add integration tests

3. **Low Priority** (Nice to have)
   - [ ] Add Spanish translations (app_es.arb)
   - [ ] Add golden tests for UI consistency
   - [ ] Add performance tests

## 🚀 Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/login/bloc/login_bloc_test.dart

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Run integration tests
flutter test integration_test/
```

## 📊 Coverage Goals

- **BLoC**: 100% coverage (critical business logic)
- **Widgets**: 80%+ coverage
- **Overall**: 80%+ coverage

## ✅ Example: Login Screen (DONE)

The Login screen is now fully localized and tested:
- ✅ All strings use l10n
- ✅ LoginBloc has comprehensive tests
- ⏳ LoginPage widget test (TODO)

Use this as a reference for other screens!
