import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgot_password_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/staff_dashboard.dart';
import 'sign_up_screen.dart';
import 'admin_dashboard.dart';
import 'manager_dashboard.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Login function to authenticate the user
  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Login successful: ${userCredential.user?.email}");

      // Fetch user role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (userDoc.exists) {
        String role = userDoc.get('role');

        // Navigate to the appropriate dashboard
        if (role == 'Admin') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AdminDashboard()));
        } else if (role == 'Manager') {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ManagerDashboard()));
        } else if (role == 'Staff') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const StaffDashboard()));
        } else {
          print("Invalid role assigned.");
        }
      } else {
        print("No role assigned to this user.");
      }
    } catch (e) {
      print("Login failed: $e");
    }
  }

  // Google sign-in placeholder
  Future<void> _loginWithGoogle() async {
    print("Google sign-in tapped");
    // Implement Google sign-in logic here
  }

  // Facebook sign-in placeholder
  Future<void> _loginWithFacebook() async {
    print("Facebook sign-in tapped");
    // Implement Facebook sign-in logic here
  }

  // Forgot Password function
  Future<void> _forgotPassword() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your email address")),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent! Check your inbox."),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Adding gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3A1C71), // Start color (purple)
              Color(0xFFD76D77), // Middle color (pink)
              Color(0xFFFFAF7B), // End color (orange)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Image.asset(
                      'lib/assets/Shoppingicon.png',
                      width: 75,
                      height: 75,
                    ),
                  ),
                  // Login container
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 32, 31, 31)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email:',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                                color: Color.fromARGB(255, 32, 31, 31),
                              )),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Lato',
                              )),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 12),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: const Text('Forgot your password?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 40, 50),
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Don\'t have an account? Sign up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '-------or-------',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: _loginWithGoogle,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'lib/assets/google.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: _loginWithFacebook,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'lib/assets/facebook.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
