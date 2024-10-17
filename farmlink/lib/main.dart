import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Market',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            // Text content container without rounded borders
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 24),
              color: Colors.white, // No border radius applied
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100), // Space for the floating image
                  Text(
                    'Online Market for\nFarmers and Buyers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Icon(Icons.double_arrow, size: 32, color: Colors.black),
                ],
              ),
            ),
            // Larger floating image
            Positioned(
              top: -80, // Adjust for smooth overlap
              child: CircleAvatar(
                radius: 90, // Increased size for a larger image
                backgroundImage: AssetImage('assets/farmer_image.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
