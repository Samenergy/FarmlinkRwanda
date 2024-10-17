import 'package:flutter/material.dart';
import 'get_started.dart'; // Import the GetStarted page

class FarmersMarketApp extends StatelessWidget {
  const FarmersMarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018241), // Green background
      body: Center(
        child: Stack(
          alignment: Alignment.center, // Center align all widgets
          children: [
            // Positioned Image of Farmer
            Positioned(
              top: 120,
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/farmer_image.png', // Replace with your image
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Positioned White Card with Text and Button
            Positioned(
              top: 450,
              child: Container(
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Online Market for\nFarmers and Buyers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // "Next" Button with Transition Animation
                    ElevatedButton(
                      onPressed: () {
                        _navigateToGetStarted(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF018241), // Green color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Slide Transition Function
  void _navigateToGetStarted(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800), // Animation duration
        pageBuilder: (context, animation, secondaryAnimation) => const GetStarted(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
