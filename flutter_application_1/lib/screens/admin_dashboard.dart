import 'package:flutter/material.dart';

import '../Admin/aaccount_screen.dart';
import '../Admin/ahistory_screen.dart';
import '../Admin/ahome_screen.dart';
import '../Admin/ainventory_screen.dart';
import '../Admin/asettings_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0; // to track the current tab

  // List of pages, each corresponds to a screen in your app
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(), // Home Screen layout
    const InventoryScreen(), // Inventory Screen layout
    const HistoryScreen(), // History Screen layout
    const AccountScreen(), // Placeholder for Account Screen
    const SettingsScreen(), // Placeholder for Settings Screen
  ];
  void _addStock() {
    // Your logic for adding stock
    print('Stock added');
  }

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
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500), // Color remains black
            ),
          ],
        ),
      ),
      label: '', // Remove the default label to prevent double labels
    );
  }

  // Function to Handle NavBar
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

// Separate widget for the Dashboard screen

// screen for Account

// screen for Settings

// Screen for Inventory
