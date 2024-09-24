import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0; // Track the selected tab index

  // List of widgets for each tab
  final List<Widget> _children = [
    const Center(child: Text('Welcome, Admin!')), // Dashboard tab
    const Center(child: Text('Inventory')), // Inventory tab
    const Center(child: Text('History')), // History tab
    const Center(child: Text('Settings')), // Settings tab
    const Center(child: Text('Sales')), // Sales tab
  ];

  // Function to handle tab selection
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: _children[_currentIndex], // Show the selected tab's content
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the current tab
        onTap: onTabTapped, // Change tab when an item is tapped
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 255, 0, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard', // Ensure a label is provided
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory', // Ensure a label is provided
          ),
          BottomNavigationBarItem(
            // Added the History tab
            icon: Icon(Icons.history),
            label: 'History', // Ensure a label is provided
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings', // Ensure a label is provided
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sales',
          )
        ],
      ),
    );
  }
}
