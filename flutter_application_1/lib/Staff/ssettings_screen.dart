import 'package:flutter/material.dart';

// The custom SettingsScreen widget with your desired layout
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Settings body <3
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Inside of Setting's body
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.settings,
                  size: 45,
                  color:  Color(0xFF2C3E50),
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color:  Color(0xFF2C3E50),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 630,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      color: Color(0xFF2C3E50),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // First Text
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Account & Settings',
                        style: TextStyle(
                          color: Color(0xFF2C3E50),
                          fontSize: 25,
                        ),
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
                              ),
                              height: 55,
                              width: 320,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                              ),
                              height: 55,
                              width: 320,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                              ),
                              height: 55,
                              width: 320,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
                              height: 55,
                              width: 320,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
                              height: 55,
                              width: 320,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const SizedBox(height: 100),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF2C3E50),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 2),
                                ],
                              ),
                              height: 60,
                              width: 360,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Log-Out',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.exit_to_app_outlined, color: Colors.white),
                                ],
                              ),
                            ),
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
    );
  }
}
