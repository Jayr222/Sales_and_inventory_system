import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Login successful: ${userCredential.user?.email}");

      // Fetch the user role from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (userDoc.exists) {
        String role = userDoc.get('role');

        // Navigate to the correct dashboard based on the user's role
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
      // Optionally show an error message to the user here
    }
  }

  Future<void> _loginWithGoogle() async {
    print("Google sign-in tapped");
    // Add Google sign-in logic here
  }

  Future<void> _loginWithFacebook() async {
    print("Facebook sign-in tapped");
    // Add Facebook sign-in logic here
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    Color lightPeach = const Color.fromARGB(255, 255, 224, 168);
=======
>>>>>>> 7e7b0c2f013a69c93bc6ebf28a082fe19edf8689
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
                Container(
                  width: MediaQuery.of(context).size.width * 10,
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.1),
                        spreadRadius: 10,
                        blurRadius: 20,
                        offset: const Offset(0, 7),
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
                            print("Forgot password tapped");
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
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 253, 253),
                            backgroundColor:
                                const Color.fromARGB(255, 32, 31, 31),
                            minimumSize: const Size(double.infinity, 50),
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
                          child: const Text('Don\'t have an account? Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 20),
                      const Text('-------or-------',
                          textAlign: TextAlign.center),
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
    );
  }
}
