import 'package:flutter/material.dart';

class FarmLinkSplash extends StatefulWidget {
  const FarmLinkSplash({Key? key}) : super(key: key);

  @override
  State<FarmLinkSplash> createState() => _FarmLinkSplashState();
}

class _FarmLinkSplashState extends State<FarmLinkSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define a Fade Animation from 0 (invisible) to 1 (fully visible)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Define a Slide Animation that moves the logo upward
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Start slightly down
      end: Offset.zero, // End at original position
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animations
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
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
