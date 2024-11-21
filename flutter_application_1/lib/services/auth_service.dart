import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // ignore: non_constant_identifier_names
  final FirebaseAuth_ = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}

// Simulated sign-in logic
Future<void> signIn(String email, String password) async {
  // Handle Firebase or other sign-in logic here
  await Future.delayed(const Duration(seconds: 2));
}

// Simulated sign-up logic
Future<void> signUp(String email, String password) async {
  // Handle Firebase or other sign-up logic here
  await Future.delayed(const Duration(seconds: 2));
}
