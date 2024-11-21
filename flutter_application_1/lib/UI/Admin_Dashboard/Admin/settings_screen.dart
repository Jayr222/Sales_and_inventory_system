import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double containerWidth = screenWidth * 0.85;
    double containerHeight = screenHeight * 0.75;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: screenHeight * 0.1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(
            'lib/assets/Shoppingicon.png',
            width: screenWidth * 0.15,
            height: screenHeight * 0.08,
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
                  fontSize: 18,
                  color: Color.fromARGB(255, 44, 62, 80),
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
                onPressed: () {}),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Container(
                  height: containerHeight,
                  width: containerWidth,
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
                      const SizedBox(height: 30),
                      const Text(
                        'Account & Settings',
                        style: TextStyle(
                          color: Color(0xFF2C3E50),
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2C3E50),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1.5),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 55,
                              width: containerWidth * 0.9,
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
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2C3E50),
                                boxShadow: [BoxShadow(spreadRadius: 1.5)],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 55,
                              width: containerWidth * 0.9,
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
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2C3E50),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1.5),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 55,
                              width: containerWidth * 0.9,
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
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2C3E50),
                                boxShadow: [
                                  BoxShadow(spreadRadius: 1.5),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 55,
                              width: containerWidth * 0.9,
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
                                width: containerWidth * 0.9,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        size: 28, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
