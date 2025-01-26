import 'package:fixiconn/onboarding/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatefulWidget {
  static String id = 'onboard_screen';
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/night_back.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Content Overlay
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Language Selector
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: DropdownButton<String>(
                    value: 'English',
                    onChanged: (String? newValue) {},
                    items: <String>['English', 'Spanish', 'French']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    dropdownColor: Colors.black,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    underline: SizedBox(),
                  ),
                ),
              ),
              // Logo and Title
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/fixicon_logo.png', // Replace with the actual path to the logo asset.
                    height: 100,
                  ),
                  SizedBox(height: 20),
                ],
              ),
              // Buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Log In Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Sign Up Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900], // Background color
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to signup screen
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
