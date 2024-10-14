import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80, // Set the height of the AppBar
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Ensures the container is circular
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 0.9, // Spread of the shadow
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'lib/assets/Shoppingicon.png',
                  ),
                  radius: 25,
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'HISTORY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 44, 62, 80), // You can adjust the size as needed
                ),
              ),
            ],
          ),
        ),
        // Notification Icon
        actions: [
          SizedBox(
            width: 60,
            child: IconButton(
              onPressed: () {},
              icon: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF2C3E50),
                  shape: BoxShape.circle, // Rounded corners for circular background
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 35, // Icon size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // Background color
        child: Center(
          child: Container(
            width: double.infinity,
            height: 900,
            decoration: BoxDecoration(
              color: Colors.black, // Inner container color
              borderRadius: BorderRadius.circular(45.0),
            ),
          ),
        ),
      ),
    );
  }
}