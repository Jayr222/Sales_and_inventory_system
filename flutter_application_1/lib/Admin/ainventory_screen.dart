import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 80, // Set the height of the AppBar
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 25.0), // Optional: Adjust padding for the icon
          child: Image.asset(
            'lib/assets/Shoppingicon.png',
            width: 70,
            height: 70, // Keep height consistent for better apRpearance]
            fit: BoxFit.contain,
          ),
        ),
        title: const Row(
          children: [
            Expanded(
              child: Text(
                'INVENTORY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(
                      255, 44, 62, 80), // You can adjust the size as needed
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: IconButton(
                icon: const Icon(
                  Icons.circle_notifications,
                  color: Color.fromARGB(255, 44, 62, 80),
                  size: 35,
                ),
                onPressed: () {
                  // Add functionality to notification icon
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Background color
                child: Center(
                    child: Container(
                        width: double.infinity,
                        height: 900,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                              255, 44, 62, 80), // Inner container color
                          borderRadius: BorderRadius.circular(25.0),
                        )))),
          ],
        ),
      ),
    );
  }
}
