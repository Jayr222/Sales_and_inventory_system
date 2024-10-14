import 'package:flutter/material.dart';

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('lib/assets/Shoppingicon.png'),
        title: const Text('Staff Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notification_add,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Welcome, Staff!'),
      ),
    );
  }
}
