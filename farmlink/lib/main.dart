import 'package:flutter/material.dart';
import 'splash_screen.dart';
// Import the onboarding screens

void main() {
  runApp(FarmLinkApp());
}

class FarmLinkApp extends StatelessWidget {
  const FarmLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmLink',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen1(),  // Start with SplashScreen1
    );
  }
}
