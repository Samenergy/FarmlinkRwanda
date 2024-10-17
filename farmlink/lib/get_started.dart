import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginScreen

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018241), // Green background
      body: Stack(
        children: [
          // Positioned Image
          Positioned(
            top: 100, // Adjust to move the image vertically
            left: 60, // Adjust to move the image horizontally
            child: Image.asset(
              'assets/farmers.png', // Replace with your image
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),

          // Positioned White Card
          Positioned(
            top: 400, // Adjust the vertical position of the card
            left: 30, // Adjust horizontal alignment of the card
            right: 30, // Ensure card is centered with some padding
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures compact card
                children: [
                  const Text(
                    'Sell and Buy Crops',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The easiest and most reliable way to buy your produce. Try it now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Get Started Button with Slide Transition
                  ElevatedButton(
                    onPressed: () {
                      _navigateToLoginScreen(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF018241), // Green button
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 32,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Slide Transition Function
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 800), // Animation duration
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right to left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
