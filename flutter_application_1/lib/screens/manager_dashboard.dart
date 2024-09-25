import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({super.key});

  @override
  State<ManagerDashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom navigation bar that has 4 items 
      bottomNavigationBar: const GNav(
        tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.inventory),
          GButton(icon: Icons.settings),
          GButton(icon: Icons.account_circle_rounded),
        ],
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 226, 139),
        title: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('MANAGER DASHBOARD', 
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold, fontSize: 15,),
          ),
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: IconButton( 
            icon: const Icon (Icons.circle_notifications, color: Color.fromARGB(255, 0, 0, 0),
            size: 35,), 
            onPressed: () {
              //adding functionality to the icon button created on the top right side of the appbar
              }
            ),
          ),
        ]
      ),

      body: const Center(
        child: Text('Tangina Ko Talaga HAHA'))
        // Row of Container 2

        // inventory message 

        //Container for Item 1

        // Container for Item 2

        // Add stock elevated button
    );
  }
}
  
