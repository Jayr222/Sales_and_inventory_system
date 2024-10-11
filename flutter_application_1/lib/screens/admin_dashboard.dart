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
      appBar: AppBar(
        title: Text('Big tite'),
      ),
    );
  }
}

// Separate widget for the Dashboard screen

// screen for Account

// screen for Settings

// Screen for Inventory
