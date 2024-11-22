import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../Staff/Shome_screen.dart';
import '../Staff/shistory_screen.dart';
import '../Staff/sinventory_screen.dart';
import '../Staff/slogout_screen.dart';

=======
import '../UI/Staff_Dashboard/Staff/home_screen.dart';
import '../UI/Staff_Dashboard/Staff/account_screen.dart';
import '../UI/Staff_Dashboard/Staff/history_screen.dart';
import '../UI/Staff_Dashboard/Staff/inventory_screen.dart';
import '../UI/Staff_Dashboard/Staff/settings_screen.dart';
>>>>>>> c5b41fd384dd8c700d42537a9ed787f0681a4788

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({super.key});

  @override
  _StaffDashboardState createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  int _selectedIndex = 0; // to track the current tab

  // List of pages, each corresponds to a screen in your app
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(), // Home Screen layout
    const InventoryScreen(), // Inventory Screen layout
    const HistoryScreen(), // History Screen layout
<<<<<<< HEAD
    const LogoutScreen(), // Placeholder for Account Screen
=======
    const AccountScreen(), // Placeholder for Account Screen
    const SettingsScreen(), // Placeholder for Settings Screen
>>>>>>> c5b41fd384dd8c700d42537a9ed787f0681a4788
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('lib/assets/Shoppingicon.png'),
        title: const Text('Staff Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: _pages[
          _selectedIndex], // Display the corresponding screen based on the selected tab
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
