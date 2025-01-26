import 'package:fixiconn/onboarding/login_screen.dart';
import 'package:fixiconn/onboarding/onboard_screen.dart';
import 'package:fixiconn/pages/dashboard.dart';
import 'package:flutter/material.dart';

import 'onboarding/splash_screen.dart';

void main() {
  runApp(const Fixiconn());
}

class Fixiconn extends StatelessWidget {
  const Fixiconn({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        OnboardScreen.id: (context) => OnboardScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        DashboardScreen.id: (context) => DashboardScreen()
      }
    );
  }
}
