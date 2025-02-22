import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenbytes/screens/HomeScreen.dart';
import 'package:greenbytes/screens/Login.dart';
import 'package:greenbytes/screens/Signup.dart';
import 'package:greenbytes/screens/onboarding/onBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // Add auth state listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        isLoggedIn = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // routes
      initialRoute: '/',
      routes: {
        '/home': (context) => MyHomeScreen(),
        '/onboarding': (context) => Onboardingscreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
      },

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      title: 'Flutter Demo',
      home: isLoggedIn ? const MyHomeScreen() : Onboardingscreen(),
    );
  }
}
