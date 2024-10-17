import 'package:flutter/material.dart';
import 'get_started.dart'; // Import the GetStarted page

class FarmersMarketApp extends StatelessWidget {
  const FarmersMarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007F00), // Green background
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

            // Positioned White Card with Text and Image Icon
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

                    // Custom Image Icon with GestureDetector
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GetStarted(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/arrow_icon.png', // Replace with your image icon
                        width: 40, // Icon width
                        height: 40, // Icon height
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
}
