import 'package:flutter/material.dart';

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({super.key});

  @override
  _StaffDashboardState createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  int _selectedIndex = 0; // to track the current tab

  // List of pages, each corresponds to a screen in your app
  static final List<Widget> _pages = <Widget>[
    HomeScreen(), // Home Screen layout
    InventoryScreen(), // Inventory Screen layout
    HistoryScreen(), // History Screen layout
    AccountScreen(), // Placeholder for Account Screen
    SettingsScreen(), // Placeholder for Settings Screen
  ];

  // Helper function to build BottomNavigationBarItem
  BottomNavigationBarItem buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black, // Color remains black
            ),
            Text(
              label,
              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500), // Color remains black
            ),
          ],
        ),
      ),
      label: '', // Remove the default label to prevent double labels
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the corresponding screen
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Switch to the selected tab
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          buildNavItem(Icons.home_filled, 'Home', 0),
          buildNavItem(Icons.inventory_outlined, 'Inventory', 1),
          buildNavItem(Icons.checklist_rtl, 'History', 2),
          buildNavItem(Icons.account_circle_outlined, 'Account', 3),
          buildNavItem(Icons.settings, 'Settings', 4),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        showSelectedLabels: true, // Always show selected labels
        showUnselectedLabels: true, // Always show unselected labels
      ),
    );
  }
}

// The custom HomeScreen widget with your desired layout
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              // Adjustment For Textfield SearchBar
              child: SizedBox(
                height: 45,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // Background color of the TextField
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  // Textfield Search Bar/Icon
                  child: const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent, // Make the TextField transparent
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Notification Icon
        actions: [
          SizedBox(
            width: 70,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape: BoxShape.circle, // Background color, // Rounded corners
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 26, // Icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //Home Page body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Page Title, Greetings, Container for (Orders,Delivers,Feedback)
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFF2C3E50),
              ),
              height: 705,
              width: double.infinity,
              //Title Page
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Staff Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Container Order
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 150,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    'ORDERS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 60,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Second Container Delivery
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 160,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.fire_truck,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  'DELIVERY',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 50,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Third Container Feedback
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            print('Pressed');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.white.withOpacity(0.5),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 3,
                                  offset: Offset(5, 2),
                                )
                              ],
                            ),
                            height: 150,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 100,
                                  color: Colors.white,
                                ),
                                Text(
                                  'FEEDBACK',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 45, decoration: TextDecoration.underline, decorationColor: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// The custom InventoryScreen widget with your desired layout
class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 226, 139), // Background color
      child: Center(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: BoxDecoration(
            color: Colors.black, // Inner container color
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color
      child: Center(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: BoxDecoration(
            color: Colors.black, // Inner container color
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
      ),
    );
  }
}

// The custom AccountScreen widget with your desired layout
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 226, 139), // Background color
      child: Center(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: BoxDecoration(
            color: Colors.yellow, // Inner container color
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
      ),
    );
  }
}

// The custom SettingsScreen widget with your desired layout
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App BAR :)
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Icon(
                Icons.settings,
                size: 45,
                color: Color(0xFF2C3E50),
              ),
              Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xFF2C3E50)),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ),
      // Settings body <3
      body: Column(
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
                            const SizedBox(height: 130),
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
