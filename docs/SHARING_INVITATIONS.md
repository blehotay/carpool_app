# Sharing & Invitation System

## Overview

Users can create carpool groups and invite friends via:
1. **Share sheet** with phone contacts
2. **Deep links** that automatically add users to the carpool
3. **Dynamic links** that work even if the app isn't installed

## User Flow

### Creating & Sharing a Carpool

1. **User creates carpool**
   - Name: "Soccer Practice"
   - Location: "Riverside Soccer Fields"
   - Pickup time: "3:30 PM"
   - Add their children

2. **User taps "Invite Members"**
   - Opens share sheet
   - Shows phone contacts
   - User selects contacts to invite

3. **System generates invite link**
   - Creates unique carpool invite code
   - Generates Firebase Dynamic Link
   - Link format: `https://carpoolapp.page.link/join?code=ABC123`

4. **Share via SMS/WhatsApp/etc**
   - Message: "Join my Soccer Practice carpool! [link]"
   - Link includes carpool details in preview

### Receiving & Joining a Carpool

#### Scenario A: App Already Installed
1. User taps link
2. App opens via deep link
3. Shows "Join Carpool" preview screen
   - Carpool name
   - Location
   - Current members
   - "Join" button
4. User taps "Join"
5. If not logged in → Sign up/Login flow
6. If logged in → Automatically added to carpool
7. Navigate to Weekly Carpool Board

#### Scenario B: App Not Installed
1. User taps link
2. Redirects to App Store/Play Store
3. User downloads and opens app
4. App detects pending invite from deep link
5. After sign up/login → Shows "Join Carpool" screen
6. User joins carpool
7. Navigate to Weekly Carpool Board

## Technical Implementation

### Required Packages

```yaml
dependencies:
  # Deep linking & sharing
  firebase_dynamic_links: ^6.0.0
  share_plus: ^10.0.0
  
  # Contact access
  contacts_service: ^0.6.3
  permission_handler: ^11.0.0
  
  # Already have:
  # go_router: ^14.0.0
  # firebase_core: ^3.0.0
```

### Firebase Dynamic Links Setup

1. **Create Dynamic Link domain** in Firebase Console
   - Example: `carpoolapp.page.link`

2. **Configure iOS/Android**
   - Add URL schemes
   - Configure Associated Domains (iOS)
   - Add intent filters (Android)

### Data Model: Carpool Invite

```dart
// In carpool_repository
@freezed
class CarpoolInvite with _$CarpoolInvite {
  const factory CarpoolInvite({
    required String id,
    required String carpoolId,
    required String inviteCode,
    required String createdBy,
    required DateTime createdAt,
    required DateTime expiresAt,
    required int maxUses,
    required int currentUses,
    required CarpoolInviteStatus status,
  }) = _CarpoolInvite;
}

enum CarpoolInviteStatus {
  active,
  expired,
  revoked,
}
```

### Firestore Structure

```
/carpools/{carpoolId}
  - name
  - location
  - memberIds[]
  - inviteCode (current active code)
  
/invites/{inviteCode}
  - carpoolId
  - createdBy
  - createdAt
  - expiresAt
  - maxUses
  - currentUses
  - status
  
/users/{userId}
  - pendingInvites[] (invite codes waiting to be accepted)
```

## New Screens & Features

### 1. Invite Members Screen

**Route**: `/home/carpools/:carpoolId/invite`

**Features**:
- Search contacts
- Select multiple contacts
- Preview invite message
- Send invites
- View pending invites
- Revoke invites

**BLoC**: `InviteMembersBloc`

**Events**:
```dart
- InviteMembersStarted
- ContactsRequested
- ContactsSelected
- InviteGenerated
- InviteSent
- InviteRevoked
```

**UI Components**:
- Contact list with checkboxes
- Search bar
- "Send Invites" button
- Pending invites list
- Share button (native share sheet)

### 2. Join Carpool Screen

**Route**: `/join/:inviteCode`

**Features**:
- Display carpool preview
- Show current members
- "Join Carpool" button
- Handle authentication if needed

**BLoC**: `JoinCarpoolBloc`

**Events**:
```dart
- JoinCarpoolStarted(inviteCode)
- JoinCarpoolAccepted
- JoinCarpoolDeclined
```

**UI**:
- Carpool details card
- Member avatars
- Join/Decline buttons
- Loading states

### 3. Updated Carpool Settings

Add to existing Carpool Settings screen:
- **Invite Members** button
- **Active Invites** section
- **Manage Members** section (remove members)

## Implementation Flow

### Creating an Invite

```dart
// In CarpoolRepository
Future<CarpoolInvite> createInvite({
  required String carpoolId,
  required String userId,
}) async {
  // Generate unique code
  final inviteCode = _generateInviteCode();
  
  // Create invite in Firestore
  final invite = CarpoolInvite(
    id: uuid.v4(),
    carpoolId: carpoolId,
    inviteCode: inviteCode,
    createdBy: userId,
    createdAt: DateTime.now(),
    expiresAt: DateTime.now().add(Duration(days: 7)),
    maxUses: 10,
    currentUses: 0,
    status: CarpoolInviteStatus.active,
  );
  
  await _apiClient.createInvite(invite);
  
  // Generate Firebase Dynamic Link
  final dynamicLink = await _generateDynamicLink(inviteCode);
  
  return invite;
}
```

### Generating Dynamic Link

```dart
// In a new DynamicLinkService
Future<Uri> generateInviteLink(String inviteCode) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://carpoolapp.page.link',
    link: Uri.parse('https://carpoolapp.com/join?code=$inviteCode'),
    androidParameters: AndroidParameters(
      packageName: 'com.example.carpoolapp',
      minimumVersion: 1,
    ),
    iosParameters: IOSParameters(
      bundleId: 'com.example.carpoolapp',
      minimumVersion: '1.0.0',
      appStoreId: '123456789',
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: 'Join my carpool!',
      description: 'You\'ve been invited to join a carpool group',
    ),
  );

  final ShortDynamicLink shortLink = 
      await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  
  return shortLink.shortUrl;
}
```

### Sharing with Contacts

```dart
// In InviteMembersBloc
Future<void> _onInviteSent(
  InviteSent event,
  Emitter<InviteMembersState> emit,
) async {
  final invite = await _carpoolRepository.createInvite(
    carpoolId: state.carpoolId,
    userId: state.userId,
  );
  
  final link = await _dynamicLinkService.generateInviteLink(
    invite.inviteCode,
  );
  
  // Use share_plus to open native share sheet
  await Share.share(
    'Join my ${state.carpool.name} carpool! $link',
    subject: 'Carpool Invitation',
  );
}
```

### Handling Deep Links

```dart
// In main.dart or app.dart
void _initDynamicLinks() {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    final Uri deepLink = dynamicLinkData.link;
    final inviteCode = deepLink.queryParameters['code'];
    
    if (inviteCode != null) {
      // Navigate to join screen
      router.go('/join/$inviteCode');
    }
  }).onError((error) {
    print('Dynamic link error: $error');
  });
  
  // Handle initial link (app opened from link)
  FirebaseDynamicLinks.instance.getInitialLink().then((dynamicLinkData) {
    if (dynamicLinkData != null) {
      final Uri deepLink = dynamicLinkData.link;
      final inviteCode = deepLink.queryParameters['code'];
      
      if (inviteCode != null) {
        // Store pending invite
        _storePendingInvite(inviteCode);
      }
    }
  });
}
```

### Joining a Carpool

```dart
// In JoinCarpoolBloc
Future<void> _onJoinCarpoolAccepted(
  JoinCarpoolAccepted event,
  Emitter<JoinCarpoolState> emit,
) async {
  emit(state.copyWith(status: JoinCarpoolStatus.loading));
  
  try {
    // Validate invite
    final invite = await _carpoolRepository.getInvite(
      inviteCode: state.inviteCode,
    );
    
    if (invite.status != CarpoolInviteStatus.active) {
      throw Exception('Invite is no longer valid');
    }
    
    // Add user to carpool
    await _carpoolRepository.joinCarpool(
      carpoolId: invite.carpoolId,
      userId: state.userId,
    );
    
    // Increment invite usage
    await _carpoolRepository.incrementInviteUsage(
      inviteCode: state.inviteCode,
    );
    
    emit(state.copyWith(
      status: JoinCarpoolStatus.success,
      carpoolId: invite.carpoolId,
    ));
    
    // Navigate to carpool board
    router.go('/home/carpools/${invite.carpoolId}');
    
  } catch (error) {
    emit(state.copyWith(
      status: JoinCarpoolStatus.failure,
      errorMessage: error.toString(),
    ));
  }
}
```

## Contact Permissions

### Request Contacts Permission

```dart
// In InviteMembersBloc
Future<void> _onContactsRequested(
  ContactsRequested event,
  Emitter<InviteMembersState> emit,
) async {
  // Request permission
  final status = await Permission.contacts.request();
  
  if (status.isGranted) {
    // Load contacts
    final contacts = await ContactsService.getContacts();
    
    emit(state.copyWith(
      contacts: contacts,
      permissionGranted: true,
    ));
  } else {
    emit(state.copyWith(
      permissionGranted: false,
      errorMessage: 'Contacts permission denied',
    ));
  }
}
```

## Updated Navigation Structure

```dart
GoRouter(
  routes: [
    // ... existing routes
    
    // Join carpool (public route, no auth required initially)
    GoRoute(
      path: '/join/:inviteCode',
      builder: (context, state) {
        final inviteCode = state.pathParameters['inviteCode']!;
        return JoinCarpoolPage(inviteCode: inviteCode);
      },
    ),
    
    ShellRoute(
      routes: [
        // ... existing routes
        
        GoRoute(
          path: '/home/carpools/:carpoolId',
          routes: [
            GoRoute(
              path: 'invite',
              builder: (context, state) {
                final carpoolId = state.pathParameters['carpoolId']!;
                return InviteMembersPage(carpoolId: carpoolId);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
```

## Security Considerations

1. **Invite Expiration**: Invites expire after 7 days
2. **Usage Limits**: Max 10 uses per invite link
3. **Revocation**: Carpool admin can revoke invites
4. **Validation**: Check invite status before allowing join
5. **Member Limits**: Optional max members per carpool

## UI/UX Flow

### Invite Members Button
- Location: Carpool Settings screen
- Icon: Share icon or "Invite" button
- Action: Navigate to `/home/carpools/:id/invite`

### Contact Selection
- Search bar at top
- Scrollable contact list
- Checkboxes for selection
- "Select All" option
- Selected count badge

### Share Sheet
- Native platform share sheet
- Pre-filled message with link
- Options: SMS, WhatsApp, Email, etc.

### Join Screen
- Hero image/icon
- Carpool name (large)
- Location and time
- Member count
- "Join" CTA button (prominent)
- "Not now" option

## Analytics Events

Track these events:
- `invite_created`
- `invite_sent`
- `invite_opened`
- `carpool_joined`
- `invite_expired`
- `invite_revoked`

## Updated Implementation Phases

### Phase 1: Authentication & Navigation
- Splash, Login, SignUp
- GoRouter setup
- AppBloc

### Phase 2: Dashboard & Shell
- Home shell with bottom nav
- Dashboard with carpool list
- **Create Carpool flow**

### Phase 3: Sharing & Invitations (NEW)
- **InviteMembersBloc**
- **Invite Members screen**
- **JoinCarpoolBloc**
- **Join Carpool screen**
- **Dynamic Links setup**
- **Contact permissions**

### Phase 4: Weekly Carpool Feature
- WeeklyCarpoolBloc
- Weekly Carpool UI

### Phase 5: Settings & Profile
- Carpool Settings (with invite management)
- Profile screen

## Next Steps

1. Add sharing packages to `pubspec.yaml`
2. Set up Firebase Dynamic Links
3. Create invite models and repository methods
4. Build Invite Members screen
5. Build Join Carpool screen
6. Implement deep link handling
7. Test invite flow end-to-end

This is a critical feature for user acquisition and carpool growth!
