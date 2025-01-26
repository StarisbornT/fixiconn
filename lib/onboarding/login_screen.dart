import 'package:fixiconn/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_circle_left_outlined, color: Color(0xFF64748A),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              // Logo
              Image.asset(
                'assets/logo2.png',
                height: 100,
              ),

              const SizedBox(height: 30.0),

              // Username Field
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Username*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Enter username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),

              // Password Field
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextField(
                obscureText: _isObscure,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30.0),

              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF003366),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, DashboardScreen.id);
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to Forgot Password Screen
                },
                child: Text('Forgotten Password?',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF003366),
                          fontWeight: FontWeight.w600),
                    )),
              ),

              const SizedBox(height: 20.0),

              // Create Account Button
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child:    ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
            padding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.id);
          },
          child: Text(
            'Create new account',
            style: TextStyle(color: Color(0xFF003366)),
          ),
        ),
      ),
    );
  }
}
