import 'package:authentication_client/authentication_client.dart';
import 'package:carpool_app/app/app.dart';
import 'package:carpool_app/bootstrap.dart';
import 'package:carpool_repository/carpool_repository.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // For development, use mock implementations
  // Switch to FirebaseAuthenticationClient when Firebase is configured
  final authenticationClient = MockAuthenticationClient();
  final carpoolRepository = MockCarpoolRepository();

  await bootstrap(
    () => App(
      authenticationClient: authenticationClient,
      carpoolRepository: carpoolRepository,
    ),
  );
}
