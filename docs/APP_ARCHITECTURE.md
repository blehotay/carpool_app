# App Architecture & Navigation

## App States & Screens

### Authentication Flow
1. **Splash Screen** - Initial loading, check auth state
2. **Login Screen** - Email/password authentication
3. **Sign Up Screen** - New user registration

### Main App Flow (Authenticated)
4. **Home/Dashboard** - Overview of all carpools
5. **Create Carpool** - Create new carpool group
6. **Weekly Carpool Board** - Main feature (already designed)
7. **Invite Members** - Share carpool with contacts
8. **Carpool Settings** - Settings for a specific carpool
9. **Profile/Settings** - User preferences and account

### Invitation Flow (Public - No Auth Required Initially)
10. **Join Carpool** - Preview and join carpool from invite link

## Navigation Structure with GoRouter

```
/ (Splash)
├── /login
├── /signup
├── /join/:inviteCode (Public - Join Carpool)
└── /home (Shell with bottom nav)
    ├── /home/dashboard
    ├── /home/create-carpool
    ├── /home/carpools/:id (Weekly Carpool Board)
    │   ├── /home/carpools/:id/invite (Invite Members)
    │   └── /home/carpools/:id/settings
    └── /home/profile
```

## Proposed Screen Hierarchy

### 1. Splash Screen
- **Purpose**: Check authentication state, initialize app
- **Route**: `/`
- **BLoC**: `AppBloc` (handles auth state)
- **Navigation**:
  - If authenticated → `/home/dashboard`
  - If not authenticated → `/login`

### 2. Login Screen
- **Purpose**: User authentication
- **Route**: `/login`
- **BLoC**: `LoginBloc`
- **Features**:
  - Email/password input
  - Sign in button
  - "Don't have an account?" → `/signup`
  - Error handling

### 3. Sign Up Screen
- **Purpose**: New user registration
- **Route**: `/signup`
- **BLoC**: `SignUpBloc`
- **Features**:
  - Email/password/name input
  - Children names input
  - Create account button
  - "Already have an account?" → `/login`

### 4. Dashboard Screen
- **Purpose**: Overview of user's carpools
- **Route**: `/home/dashboard`
- **BLoC**: `DashboardBloc`
- **Features**:
  - List of user's carpools
  - Quick status for each (next driving day, etc.)
  - "Create new carpool" button
  - Tap carpool → Navigate to Weekly Board

### 5. Weekly Carpool Board (Main Feature)
- **Purpose**: Manage weekly carpool schedule
- **Route**: `/home/carpools/:carpoolId`
- **BLoC**: `WeeklyCarpoolBloc`
- **Features** (as designed):
  - Status card
  - Weekly timeline
  - Day detail panel
  - Generate/Edit schedule buttons
  - Settings icon → `/home/carpools/:carpoolId/settings`

### 6. Carpool Settings
- **Purpose**: Configure carpool details
- **Route**: `/home/carpools/:carpoolId/settings`
- **BLoC**: `CarpoolSettingsBloc`
- **Features**:
  - Edit carpool name
  - Edit location
  - Edit pickup time
  - Manage members (add/remove)
  - User preferences (unavailable days, max days per week)
  - Delete carpool

### 7. Create Carpool Screen
- **Purpose**: Create new carpool group
- **Route**: `/home/create-carpool`
- **BLoC**: `CreateCarpoolBloc`
- **Features**:
  - Carpool name input
  - Location input
  - Pickup time picker
  - Add children
  - Create button
  - Navigate to Invite Members after creation

### 8. Invite Members Screen
- **Purpose**: Share carpool with contacts
- **Route**: `/home/carpools/:carpoolId/invite`
- **BLoC**: `InviteMembersBloc`
- **Features**:
  - Contact list with search
  - Select multiple contacts
  - Generate invite link
  - Native share sheet
  - View/manage pending invites
  - Revoke invites

### 9. Join Carpool Screen (Public)
- **Purpose**: Preview and join carpool from invite
- **Route**: `/join/:inviteCode`
- **BLoC**: `JoinCarpoolBloc`
- **Features**:
  - Carpool preview (name, location, members)
  - Join/Decline buttons
  - Handle auth if needed
  - Auto-join after signup/login
  - Navigate to carpool board on success

### 10. Carpool Settings
- **Purpose**: Configure carpool details
- **Route**: `/home/carpools/:carpoolId/settings`
- **BLoC**: `CarpoolSettingsBloc`
- **Features**:
  - Edit carpool name
  - Edit location
  - Edit pickup time
  - **Invite Members button** (navigate to invite screen)
  - **Manage members** (view/remove)
  - User preferences (unavailable days, max days per week)
  - Delete carpool

### 11. Profile Screen
- **Purpose**: User account management
- **Route**: `/home/profile`
- **BLoC**: `ProfileBloc`
- **Features**:
  - User info display
  - Edit children names
  - Change password
  - Sign out button

## Bottom Navigation (Shell Route)

When authenticated, use a shell route with bottom navigation:

```dart
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Carpools'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
)
```

## GoRouter Configuration Structure

```dart
final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    // Check auth state and redirect accordingly
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
          path: '/home/carpools/:carpoolId',
          builder: (context, state) {
            final carpoolId = state.pathParameters['carpoolId']!;
            return WeeklyCarpoolPage(carpoolId: carpoolId);
          },
          routes: [
            GoRoute(
              path: 'settings',
              builder: (context, state) {
                final carpoolId = state.pathParameters['carpoolId']!;
                return CarpoolSettingsPage(carpoolId: carpoolId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/home/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
```

## State Management Strategy

### App-Level State (AppBloc)
- Authentication state
- Current user
- Global loading/error states

### Feature-Level State
Each screen has its own BLoC:
- `LoginBloc`
- `SignUpBloc`
- `DashboardBloc`
- `WeeklyCarpoolBloc` ✅ (already designed)
- `CarpoolSettingsBloc`
- `ProfileBloc`

## Implementation Priority

### Phase 1: Core Authentication & Navigation
1. Set up GoRouter
2. Create AppBloc for auth state
3. Build Splash screen
4. Build Login screen
5. Build Sign Up screen

### Phase 2: Dashboard & Carpool Creation
6. Create HomeShell with bottom nav
7. Build Dashboard screen
8. Build Create Carpool screen
9. Wire up navigation between screens

### Phase 3: Sharing & Invitations ⭐ (Critical for Growth)
10. Set up Firebase Dynamic Links
11. Build Invite Members screen
12. Build Join Carpool screen
13. Implement contact permissions
14. Test deep link flow end-to-end

### Phase 4: Weekly Carpool Feature (Main Feature)
15. Build WeeklyCarpoolBloc ✅ (design ready)
16. Build Weekly Carpool UI components
17. Integrate with navigation

### Phase 5: Settings & Profile
18. Build Carpool Settings screen (with invite management)
19. Build Profile screen
20. Complete user preferences

## Data Flow Example: User Journey

1. **App Launch**
   - `SplashPage` → `AppBloc` checks auth
   - If authenticated: navigate to `/home/dashboard`
   - If not: navigate to `/login`

2. **Login**
   - User enters credentials
   - `LoginBloc` calls `AuthenticationClient`
   - On success: `AppBloc` updates auth state
   - Router redirects to `/home/dashboard`

3. **View Carpool**
   - User taps carpool on dashboard
   - Navigate to `/home/carpools/:id`
   - `WeeklyCarpoolBloc` loads data from `CarpoolRepository`
   - Display Weekly Carpool Board

4. **Edit Settings**
   - User taps settings icon
   - Navigate to `/home/carpools/:id/settings`
   - `CarpoolSettingsBloc` loads/updates carpool data

## Required New Packages

Add to root `pubspec.yaml`:
```yaml
dependencies:
  # Navigation
  go_router: ^14.0.0
  
  # Sharing & Deep Links
  firebase_dynamic_links: ^6.0.0
  share_plus: ^10.0.0
  
  # Contacts
  contacts_service: ^0.6.3
  permission_handler: ^11.0.0
  
  # Already have:
  # flutter_bloc: ^8.1.6
  # equatable: ^2.0.5
  # firebase_core: ^3.0.0
```

## File Structure

```
lib/
  app/
    app.dart
    router/
      app_router.dart
      route_guards.dart
    bloc/
      app_bloc.dart
      app_event.dart
      app_state.dart
  
  features/
    splash/
      view/
        splash_page.dart
    
    login/
      bloc/
      view/
      widgets/
      login.dart
    
    signup/
      bloc/
      view/
      widgets/
      signup.dart
    
    dashboard/
      bloc/
      view/
      widgets/
      dashboard.dart
    
    weekly_carpool/  ✅ (already designed)
      bloc/
      view/
      widgets/
      weekly_carpool.dart
    
    carpool_settings/
      bloc/
      view/
      widgets/
      carpool_settings.dart
    
    profile/
      bloc/
      view/
      widgets/
      profile.dart
    
    home_shell/
      view/
        home_shell.dart
```

## Next Steps

1. **Update root pubspec.yaml** - Add go_router and local packages
2. **Create AppBloc** - Handle authentication state
3. **Set up GoRouter** - Configure all routes
4. **Build Splash screen** - Entry point
5. **Build Login/SignUp** - Authentication flow
6. **Build Dashboard** - Carpool list
7. **Build Weekly Carpool** - Main feature (design ready)
8. **Build Settings & Profile** - Complete the app

## Questions to Consider

1. ✅ **Carpool Creation**: Yes - Create Carpool screen in Phase 2
2. ✅ **Invitations**: Dynamic links with contact sharing - Phase 3
3. **Notifications**: Push notifications for schedule changes?
4. **Offline Support**: Should we cache data locally?
5. **Schedule Generation**: What algorithm for auto-generating fair schedules?
6. **Invite Limits**: Max members per carpool? Max invites per user?
7. **Member Roles**: Admin vs regular member permissions?

## See Also

- **[SHARING_INVITATIONS.md](./SHARING_INVITATIONS.md)** - Detailed sharing & invitation system design
