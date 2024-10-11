import 'package:flutter/material.dart';

// The custom SettingsScreen widget with your desired layout
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80, // Set the height of the AppBar
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Ensures the container is circular
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 0.9, // Spread of the shadow
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'lib/assets/Shoppingicon.png',
                  ),
                  radius: 25,
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'SETTINGS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 44, 62, 80), // You can adjust the size as needed
                ),
              ),
            ],
          ),
        ),
        // Notification Icon
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape: BoxShape.circle, // Rounded corners for circular background
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 35, // Icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      // Settings body <3
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Inside of Setting's body
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
                                        fontSize: 20, color: Colors.white),
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
                                        fontSize: 20, color: Colors.white),
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
