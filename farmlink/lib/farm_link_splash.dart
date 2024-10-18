import 'package:flutter/material.dart';

class FarmLinkSplash extends StatefulWidget {
  const FarmLinkSplash({super.key, super......

  @override
  State<FarmLinkSplash> createState() => _FarmLinkSplashState();
}

// ignore: empty_constructor_bodies, non_constant_identifier_names
class _FarmLinkSplashState extends State<FarmLinkSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define a Fade Animation from 0 (invisible) to 1 (fully visible)
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    // Define a Slide Animation that moves the logo upward
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Start slightly down
      end: Offset.zero, // End at original position
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    // Start the animations
    controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/farmlink_logo.png',
                  width: 400,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                // Positioned subtitle above the logo
                Positioned(
                  top: 190, // Adjust to move the subtitle closer to the logo
                  child: Text(
                    'Rya Neza, Ubeho Neza',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromARGB(255, 69, 69, 69),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
