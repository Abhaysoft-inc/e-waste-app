import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenbytes/screens/HomeScreen.dart';
import 'package:greenbytes/screens/Signup.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  void onStartPressed() {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/ewaste.jpg',
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Make Earth E Waste Free!',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Text(
              'We use AI to collect, categorise and recycle E Waste and make Earth green again',
              style: GoogleFonts.roboto(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30, top: 30),
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: onStartPressed,
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
