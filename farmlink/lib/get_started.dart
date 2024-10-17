import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007F00), // Green background
      body: Stack(
        children: [
          // Positioned Image
          Positioned(
            top: 100, // Adjust to move the image vertically
            left: 10, // Adjust to move the image horizontally
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
              color: Colors.white, // No border radius applied
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ensures compact card
                children: [
                  const Text(
                    'Sell and Buy crops',
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

                  // Get Started Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007F00), // Green button
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 32,
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
}
