import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 44, 62, 80),
        borderRadius: BorderRadius.circular(25),
      ), // Background color
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              // Container for the main dashboard content
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 44, 62, 80), // Inner container color
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjust for flexible content
                  children: [
                    // First row containing DAILY SALES and MONTHLY SALES
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInvBox('INVENTORY', Icons.inventory),
                          _buildStatBox("MONTHLY SALES", Icons.point_of_sale),
                        ],
                      ),
                    ),
                    // Second row containing YEARLY REPORT
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            _buildStatBox("DAILY SALES", Icons.add_chart),
                            _buildStatBox("YEARLY REPORT", Icons.note_alt_outlined),
                        ],
                      ),
                    ),
                    // Order Overview title
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Order Overview',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Order Overview content box
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 1000,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add some space at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInvBox(String label, IconData icon) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 44, 62, 80),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadows: [
                          const Shadow(
                            blurRadius: 20.0, // Glow effect intensity
                            color: Color.fromARGB(255, 185, 185, 185), // Glow color
                            offset: Offset(0, 0), // Position of the shadow
                          ),
                            Shadow(
                              blurRadius: 30.0,
                              color: const Color.fromARGB(255, 185, 185, 185).withOpacity(0.5), // Softer glow
                              offset: const Offset(0, 0),
                          ),
                        ],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white, // Optional: Underline color
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('OVERVIEW:', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('DATA', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('STOCK VALUE:', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 180,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        ),
                      ],
                  ),
                  child: const Text('10/10/24', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 44, 62, 80),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build the statistic boxes
  Widget _buildStatBox(String label, IconData icon) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 62, 80),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 10), // Add spacing between icon and text
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}