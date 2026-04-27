import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_app/app/app.dart';
import 'package:carpool_app/bootstrap.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO(dev): Initialize Firebase for production
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // TODO(dev): Switch to Firebase implementations for production
  final authenticationClient = MockAuthenticationClient();
  final carpoolRepository = MockCarpoolRepository();

  await bootstrap(
    () => App(
      authenticationClient: authenticationClient,
      carpoolRepository: carpoolRepository,
    ),
  );
}
