import 'dart:async';

import 'package:fixiconn/onboarding/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, OnboardScreen.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF78B3FF), Color(0xFF0049FF) ], // Adjust colors as per design.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50), // Spacer for alignment
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fixicon_logo.png', // Replace with the actual path to the logo asset.
                  height: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Connect. Shop. Play.\nEarn with us',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE6EFF6),
                      height: 1.5,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    'All rights reserved',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Text(
                    '(c) 2024',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
