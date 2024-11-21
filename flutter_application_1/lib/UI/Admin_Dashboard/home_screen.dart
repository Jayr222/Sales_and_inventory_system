import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/report_service.dart'; // Adjust the path as necessary

class HomeScreen extends StatelessWidget {
  final ReportService reportService = ReportService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: const Color(0xFF2C3E50),
        child: FutureBuilder<Map<String, double>>(
          future: reportService.fetchReports(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final data = snapshot.data ??
                {
                  'Total Sales': 0.0,
                  'Yearly Report': 0.0,
                  'Overall Orders': 0.0,
                };

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Today\'s Reports',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _reportCard('Total Sales', data['Total Sales']!),
                    _reportCard('Yearly Report', data['Yearly Report']!),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 10),
                  child: Text(
                    'Overall Orders',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                _reportCard('Overall Orders', data['Overall Orders']!),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _reportCard(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 180,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
