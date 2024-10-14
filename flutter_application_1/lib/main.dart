import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login_page_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/stock_management_screen.dart'; // Import the stock management screen
import 'Animations/intro_animation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print('Firebase initialized successfully!');
    } else {
      print('Firebase is already initialized');
    }
    print('Current Platform: ${DefaultFirebaseOptions.currentPlatform}');
  } catch (e) {
    print('Firebase initialization failed: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2C3E50),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroAnimation(),
        '/login': (context) => const LoginPageScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/stock_management': (context) =>
            const StockManagementScreen(), // Add this line
      },
    );
  }
}
