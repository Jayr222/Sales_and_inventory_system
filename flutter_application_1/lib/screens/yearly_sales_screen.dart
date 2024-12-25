import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/admin_dashboard.dart';

class YearlySalesScreen extends StatefulWidget {
  const YearlySalesScreen({super.key});

  @override
  _YearlySalesScreenState createState() => _YearlySalesScreenState();
}

class _YearlySalesScreenState extends State<YearlySalesScreen> {
  // A map to store the total sales by year
  Map<int, double> yearlySales = {};

  @override
  void initState() {
    super.initState();
    _fetchYearlySales();
  }

  // Method to fetch and aggregate sales by year
  Future<void> _fetchYearlySales() async {
    try {
      // Fetch all transactions from Firestore
      var transactionsQuery =
          FirebaseFirestore.instance.collection('transactions').get();

      var querySnapshot = await transactionsQuery;

      // Map to hold the aggregated sales data
      Map<int, double> salesByYear = {};

      for (var doc in querySnapshot.docs) {
        var data = doc.data();

        // Safely handle 'date' field, ensuring it's a Firestore Timestamp
        var date = data['date'];
        DateTime? dateTime =
            date != null && date is Timestamp ? date.toDate() : null;

        if (dateTime != null) {
          int year = dateTime.year; // Extract the year from the DateTime

          double amount = data['amount'] ?? 0.0;
          double price = data['price'] ?? 0.0;

          double totalSale = amount * price;

          // Aggregate the sales for the respective year
          if (salesByYear.containsKey(year)) {
            salesByYear[year] = salesByYear[year]! + totalSale;
          } else {
            salesByYear[year] = totalSale;
          }
        }
      }

      setState(() {
        yearlySales = salesByYear;
      });
    } catch (error) {
      print("Error fetching yearly sales: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(
            'lib/assets/Shoppingicon.png',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'YEARLY SALES',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 44, 62, 80),
          ),
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
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: yearlySales.keys.length,
              itemBuilder: (context, index) {
                int year = yearlySales.keys.elementAt(index);
                double totalSales = yearlySales[year] ?? 0.0;

                return ListTile(
                  title: Text("Year: $year"),
                  subtitle: Text("Total Sales: PHP $totalSales"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminDashboard(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 255, 255, 255), // Background color
                side: const BorderSide(
                  color: Color.fromARGB(255, 44, 62, 80), // Border color
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Go Back to Dashboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 62, 80), // Text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
