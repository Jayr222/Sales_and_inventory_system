import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Admin_Dashboard/home_screen.dart';
import 'package:flutter_application_1/UI/Admin_Dashboard/account_screen.dart';
import 'package:flutter_application_1/UI/Admin_Dashboard/settings_screen.dart';
import 'package:flutter_application_1/UI/Admin_Dashboard/inventory_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0; // Track the selected tab index

  // List of screens to display for each tab
  final List<Widget> _screens = [
    const HomeScreen(), // Replaced AdminDashboard with a separate DashboardScreen
    const InventoryScreen(),
    const SettingsScreen(),
    const AccountScreen(),
  ];
  void _addStock() {
    // Your logic for adding stock
    print('Stock added');
  }

  // Function to handle tab selection
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Function to Handle NavBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 129),
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed, // Use shifting or fixed
        selectedItemColor:
            const Color.fromARGB(255, 0, 0, 0), // Color of selected icon
        unselectedItemColor:
            const Color.fromARGB(255, 29, 29, 29), // Color of unselected icon
        backgroundColor: const Color.fromARGB(
            255, 255, 226, 139), // Background color of navbar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          )
        ],
      ),
    );
  }
}

// Separate widget for the Dashboard screen

// screen for Account

// screen for Settings

// Screen for Inventory
