import 'package:flutter/material.dart';

// The custom InventoryScreen widget with your desired layout
class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 226, 139), // Background color
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
    );
  }
}