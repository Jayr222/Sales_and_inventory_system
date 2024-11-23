import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Staff_Dashboard/Staff/history_screen.dart';
import 'package:flutter_application_1/UI/Staff_Dashboard/Staff/home_screen.dart';
import 'package:flutter_application_1/UI/Staff_Dashboard/Staff/inventory_screen.dart';
import 'package:flutter_application_1/UI/Staff_Dashboard/spayment_screen.dart';
import 'login_page_screen.dart';

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({super.key});
  @override
  State<StaffDashboard> createState() => _StaffDashboard();
}

class _StaffDashboard extends State<StaffDashboard> {
  int _selectedIndex = 0; // to track the current tab

  // List of pages,
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(), // Home Screen layout
    const InventoryScreen(), // Inventory Screen layout
    const HistoryScreen(), // Placeholder for History Screen
    const PaymentScreen(),// Placeholder/Screen layout for Payment
  ];

  // Function to show the alert dialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure you want to logout?"),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust size to fit content
            children: [
              const SizedBox(height: 50),
              const Text("Press the button below to confirm logout."),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Logged out successfully!")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPageScreen()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error logging out: $e")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 44, 62, 80), // Button color
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ), // Button padding
                ),
                child: const Text("Logout"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body that changes based on the selected tab
      body: _selectedIndex < 4 ? _pages[_selectedIndex] : const SizedBox(),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) { 
              if (index == 4) {
                _showAlertDialog(
                    context); // Trigger the alert dialog for the 4th button
              } else {
                setState(() {
                  _selectedIndex = index; // Switch to the selected tab
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.inventory_2_outlined,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Inventory',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.payment,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.logout,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Logout', // Special button for triggering an alert
              ),
            ],
            selectedItemColor: const Color.fromARGB(255, 44, 62, 80),
            unselectedItemColor: const Color.fromARGB(255, 28, 39, 50),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal),
            showSelectedLabels: true, // Always show selected labels
            showUnselectedLabels: true, // Always show unselected labels
          ),
        ),
      ),
    );
  }
}
