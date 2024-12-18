import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../UI/Admin_Dashboard/Admin/history_screen.dart';
import '../UI/Admin_Dashboard/Admin/inventory_screen.dart';
import '../UI/Admin_Dashboard/Admin/settings_screen.dart';
import '../UI/Admin_Dashboard/Admin/payment_screen.dart';
import '../UI/Admin_Dashboard/Admin/role_management_screen.dart';
import '../UI/Admin_Dashboard/home_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0; // To track the current tab

  // Navigation items list
  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_filled, 'label': 'Home'},
    {'icon': Icons.inventory_outlined, 'label': 'Inventory'},
    {'icon': Icons.checklist_rtl, 'label': 'History'},
    {'icon': Icons.settings, 'label': 'Settings'},
    {'icon': Icons.payment, 'label': 'Payment'},
    {'icon': Icons.manage_accounts, 'label': 'Roles'},
  ];

  @override
  Widget build(BuildContext context) {
    // Fetch the current user's email using FirebaseAuth
    final currentUser = FirebaseAuth.instance.currentUser;
    final currentUserEmail = currentUser?.email ?? 'unknown@example.com';

    // Pages corresponding to each bottom navigation item
    final List<Widget> pages = [
      const HomeScreen(),
      const InventoryScreen(),
      const HistoryScreen(),
      const SettingsScreen(),
      const PaymentScreen(),
      RoleManagementScreen(
        currentUserEmail: currentUserEmail, // Pass the current user's email
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: _navItems.map((item) => buildNavItem(item)).toList(),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  // Helper function to build BottomNavigationBarItem
  BottomNavigationBarItem buildNavItem(Map<String, dynamic> item) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              item['icon'],
              size: 30,
              color: Colors.black,
            ),
            Text(
              item['label'],
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      label: '', // Remove default labels to avoid duplicates
    );
  }
}
