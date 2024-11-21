import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: 80, // Set the height of the AppBar
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 25.0), // Optional: Adjust padding for the icon
            child: Image.asset(
              'lib/assets/Shoppingicon.png',
              width: 70,
              height: 70, // Keep height consistent for better appearance
              fit: BoxFit.contain,
            ),
          ),
          title: const Row(
            children: [
              Expanded(
                child: Text(
                  'SETTINGS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(
                        255, 44, 62, 80), // You can adjust the size as needed
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: IconButton(
                  icon: const Icon(
                    Icons.circle_notifications,
                    color: Color.fromARGB(255, 44, 62, 80),
                    size: 35,
                  ),
                  onPressed: () {
                    // Add functionality to notification icon
                  }),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        // App BAR :)
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              // Inside of Setting's body
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 650,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.75,
                          color: Color(0xFF2C3E50),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // First Text
                        const SizedBox(height: 30),
                        const Text(
                          'Account & Settings',
                          style: TextStyle(
                            color: Color(0xFF2C3E50),
                            fontSize: 25,
                          ),
                        ),
                        // Inside of Setting's body
                        const SizedBox(height: 60),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Email First Container
                                Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: 1.5),
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10)), // Added borderRadius
                                  ),
                                  height: 55,
                                  width: 320,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.email_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Password Second Container
                                Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    boxShadow: [BoxShadow(spreadRadius: 1.5)],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10)), // Added borderRadius
                                  ),
                                  height: 55,
                                  width: 320,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.lock_outline,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Contacts Third Container
                                Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: 1.5),
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10)), // Added borderRadius
                                  ),
                                  height: 55,
                                  width: 320,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.phone_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Contacts',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // About Fourth Container
                                Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: 1.5),
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10)), // Added borderRadius
                                  ),
                                  height: 55,
                                  width: 320,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.info_outline,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'About',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Terms and Condition Fifth Container
                                Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2C3E50),
                                    boxShadow: [
                                      BoxShadow(spreadRadius: 1.5),
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            10)), // Added borderRadius
                                  ),
                                  height: 55,
                                  width: 320,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(
                                          Icons.description_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Terms and Condition',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Log-Out Last Container
                                const SizedBox(height: 130),
                                GestureDetector(
                                  onTap: () async {
                                    print('Logout button tapped');
                                    await AuthService().signOut();
                                    Navigator.of(context)
                                        .pushReplacementNamed('/login');
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF2C3E50),
                                      boxShadow: [
                                        BoxShadow(spreadRadius: 2),
                                      ],
                                    ),
                                    height: 60,
                                    width: 360,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Log-Out',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.exit_to_app_outlined,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
