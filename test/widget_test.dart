import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shop_organizer/main.dart' as app;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  app.main();
  group('FlutterAuthSignInTestPage', () {
    final emailField = find.byKey(const Key('EmailKey'));
    final passwordField = find.byKey(const Key('PasswordKey'));
    final loginButton = find.byKey(const Key('LoginButton'));
    const email = 'test@test.com';
    const password = 'testing';
    // final passwordField = find.byValueKey('password-field');
    // final signInButton = find.text(Strings.signIn);
    // const shortPassword = Strings.shortPassword;
    // const invalidEmail = Strings.invalidEmail;
    testWidgets('write correct email and passwort and navigate to next page',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      // await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('Authentication'), findsOneWidget);

      // Tap the '+' icon and trigger a frame.
      // await tester.tap(emailField);
      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);
      await tester.tap(loginButton);
      expect(find.text(email), findsOneWidget);
      expect(find.text(password), findsOneWidget);
      await tester.pumpAndSettle();

      // Verify that our counter has incremented.
      // expect(find.text('Authentication'), findsNothing);
      expect(find.text('Hallo Guys'), findsOneWidget);
    });
  });
}
