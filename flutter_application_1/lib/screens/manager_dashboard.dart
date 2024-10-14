import 'package:flutter/material.dart';

import '../UI/Manager_Dashboard/Manager/account_screen.dart';
import '../UI/Manager_Dashboard/Manager/history_screen.dart';
import '../UI/Manager_Dashboard/Manager/home_screen.dart';
import '../UI/Manager_Dashboard/Manager/inventory_screen.dart';
import '../UI/Manager_Dashboard/Manager/settings_screen.dart';

  
class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({super.key});
  @override
  State<ManagerDashboard> createState() => _ManagerDashboardState();
}
class _ManagerDashboardState extends State<ManagerDashboard> {
  int _selectedIndex = 0; // to track the current tab

  // List of pages, each corresponds to a screen in your app
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),  // Home Screen layout
    const InventoryScreen(),  // Inventory Screen layout
    const HistoryScreen(), // Placeholder for History Screen
    const AccountScreen(), // Placeholder for Account Screen
    SettingsScreen(), // Placeholder for Settings Screen
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body that changes based on the selected tab
      body: _pages[_selectedIndex], // Display the corresponding screen
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index; // Switch to the selected tab
              });
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
                  Icons.account_circle_rounded,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                  color: Color.fromARGB(255, 44, 62, 80),
                ),
                label: 'Settings',
              ),
            ],
            //interaction and state with icons in bottom navbar
            selectedItemColor: const Color.fromARGB(255, 44, 62, 80),
            unselectedItemColor: const Color.fromARGB(255, 28, 39, 50),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            showSelectedLabels: true, // Always show selected labels
            showUnselectedLabels: true, // Always show unselected labels
          ),
        ),
      ),
    );
  }
}