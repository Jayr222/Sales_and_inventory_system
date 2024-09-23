import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // This is where the FirebaseOptions will come from
import 'screens/login_page_screen.dart';
import 'screens/sign_up_screen.dart';
import 'Animations/intro_animation.dart'; // Import the intro animation

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Check if Firebase has already been initialized
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        name: "my-project-20e8a",
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
      debugShowCheckedModeBanner: false,
      title: 'Firebase Test',
      initialRoute: '/', // Start with the intro animation
      routes: {
        '/': (context) =>
            const IntroAnimation(), // Start with the intro animation
        '/login': (context) => const LoginPageScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
