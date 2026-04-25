import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_app/app/app.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    late AuthenticationClient authenticationClient;
    late CarpoolRepository carpoolRepository;

    setUp(() {
      authenticationClient = MockAuthenticationClient();
      carpoolRepository = MockCarpoolRepository();
    });

    testWidgets('renders app with router', (tester) async {
      await tester.pumpWidget(
        App(
          authenticationClient: authenticationClient,
          carpoolRepository: carpoolRepository,
        ),
      );
      await tester.pumpAndSettle();

      // App should render without errors
      expect(find.byType(App), findsOneWidget);
    });
  });
}
