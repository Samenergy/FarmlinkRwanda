import 'package:flutter/material.dart';

class FarmLinkSplash extends StatelessWidget {
  const FarmLinkSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/farmlink_logo.png',
              width: 400,
              height: 300,
              fit: BoxFit.contain,
            ),
            // Positioned above the logo
            Positioned(
              top: 190, // Adjust this value to move the subtitle closer to the logo
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
    );
  }
}
