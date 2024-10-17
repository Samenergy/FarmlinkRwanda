import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmlink/main.dart';

void main() {
  testWidgets('Splash screen 1 displays FarmLink text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FarmLinkApp());

    // Verify that SplashScreen1 has "FarmLink" text.
    expect(find.text('FarmLink'), findsOneWidget);
  });

  testWidgets('Navigates to SplashScreen2 after SplashScreen1', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // SplashScreen1 should display "FarmLink" text.
    expect(find.text('FarmLink'), findsOneWidget);

    // Wait for the navigation to SplashScreen2.
    await tester.pumpAndSettle(Duration(seconds: 2)); // Wait for splash screen delay.

    // Now, SplashScreen2 should be displayed.
    expect(find.text('Online Market for Farmers and Buyers'), findsOneWidget);
  });

  testWidgets('Navigates to SplashScreen3 after SplashScreen2', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Wait for SplashScreen1 and SplashScreen2 to finish.
    await tester.pumpAndSettle(Duration(seconds: 4));

    // SplashScreen3 should be displayed.
    expect(find.text('Sell and Buy Crops'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('Navigates to OnboardingScreen1 after Get Started', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Wait for SplashScreen1, SplashScreen2, and SplashScreen3 to finish.
    await tester.pumpAndSettle(Duration(seconds: 6));

    // Tap the 'Get Started' button.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that OnboardingScreen1 is displayed.
    expect(find.text('Online Market for Farmers and Buyers'), findsOneWidget);
  });

  testWidgets('Navigates to OnboardingScreen2 after arrow click', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Wait for SplashScreen and OnboardingScreen1 to finish.
    await tester.pumpAndSettle(Duration(seconds: 6));

    // Find the arrow button and tap it.
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    // Verify that OnboardingScreen2 is displayed.
    expect(find.text('Sell and Buy Crops'), findsOneWidget);
  });

  testWidgets('Navigates to LoginPage after onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Wait for splash screens and onboarding screens to finish.
    await tester.pumpAndSettle(Duration(seconds: 6));

    // Navigate through onboarding screens.
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    // Tap 'Get Started' on the second onboarding screen.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that the LoginPage is displayed.
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('LoginPage displays login form', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Navigate through the splash and onboarding to reach LoginPage.
    await tester.pumpAndSettle(Duration(seconds: 6));
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that the login form contains username and password fields.
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });

  testWidgets('LoginPage contains login and register buttons', (WidgetTester tester) async {
    await tester.pumpWidget(FarmLinkApp());

    // Navigate through onboarding screens to get to LoginPage.
    await tester.pumpAndSettle(Duration(seconds: 6));
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify the login and register buttons are present.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
