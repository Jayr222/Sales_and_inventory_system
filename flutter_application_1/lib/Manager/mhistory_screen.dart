import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255), // Background color
      child: Center(
        child: Container(
          width: double.infinity,
          height: 900,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 44, 62, 80), // Inner container color
            borderRadius: BorderRadius.circular(25.0),
          )
        )
      )
    );
  }
}