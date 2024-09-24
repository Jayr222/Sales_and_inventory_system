import 'package:flutter/material.dart';

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({super.key});

  @override
  _ManagerDashboardState createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of widgets for each tab
  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Dashboard Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Inventory Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  // Handle tab switching
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 255, 174, 168), // Peach background color
            child: _selectedIndex == 0
                ? _buildManagerWelcome() // Show welcome screen on the first tab
                : _pages[_selectedIndex], // Switch to other pages
          ),
          // Positioned Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: 'Inventory',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex, // Highlight the selected tab
              selectedItemColor: const Color.fromARGB(255, 255, 194, 168), // Color of the selected item
              backgroundColor: const Color.fromARGB(255, 255, 174, 168), // Match background color
              onTap: _onItemTapped, // Handle tab taps
            ),
          ),
          // Placeholder for text at the top
          const Positioned(
            top: 35,
            left: 5,
            right: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
                children: [
                  Text(
                    'Welcome Manager!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // Make the text bold
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 40), // Space between the texts
                  Text(
                    'Placeholder (name of user)',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display welcome message
  Widget _buildManagerWelcome() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 61), // Adjusted top padding and added bottom space
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 32.0), // Padding inside the container for top and bottom
                width: double.infinity, // Stretch the container to fill the entire width
                decoration: const BoxDecoration(
                  color: Colors.white, // White background for the container
                  borderRadius: BorderRadius.all(Radius.circular(50.0)), // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
                  children: [
                    // Welcome text centered in the container
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome, Manager!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 85, 30, 30),
                          ),
                        ),
                        SizedBox(height: 20),
                        Icon(
                          Icons.supervisor_account,
                          size: 100,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 20), // Add spacing at the bottom
                      ],
                    ),
                    // Elevated button at the bottom
                    ElevatedButton(
                      onPressed: () {
                        // Define what happens when the button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 85, 30, 30), // Background color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Rounded corners for the button
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Padding for the button
                        child: Text(
                          'Action Button', // Button text
                          style: TextStyle(fontSize: 18), // Text style for the button
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
