import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dailySales = 0.0;
  double monthlySales = 0.0;
  double yearlyReport = 0.0;
  double stockValue = 0.0;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchReports(); // Fetch initial data
  }

  // Fetch reports from Firestore in real-time
  Future<void> _fetchReports() async {
    try {
      // Fetch the entire reports collection
      FirebaseFirestore.instance
          .collection('reports')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          setState(() {
            // Getting daily_sales value
            dailySales = snapshot.docs
                    .firstWhere((doc) => doc.id == 'daily_sales')['value'] ??
                0.0;

            // Getting monthly_sales value
            monthlySales = snapshot.docs
                    .firstWhere((doc) => doc.id == 'monthly_sales')['value'] ??
                0.0;

            // Getting yearly_report value
            yearlyReport = snapshot.docs
                    .firstWhere((doc) => doc.id == 'yearly_report')['value'] ??
                0.0;

            // Getting stock_value from reportID document
            stockValue = snapshot.docs
                    .firstWhere((doc) => doc.id == 'reportID')['stock_value'] ??
                0.0;

            isLoading = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error fetching reports: $e";
        isLoading = false;
      });
    }
  }

  // Update sales data after a successful payment
  // Update sales data after a successful payment
  Future<void> _updateSales(double newSaleAmount, String productId) async {
    try {
      final reportDoc = FirebaseFirestore.instance
          .collection('reports')
          .doc('reportID'); // The actual document for the sales report

      // Update sales data in Firestore
      await reportDoc.update({
        'daily_sales':
            FieldValue.increment(newSaleAmount), // Increment daily sales
        'monthly_sales':
            FieldValue.increment(newSaleAmount), // Increment monthly sales
        'yearly_report':
            FieldValue.increment(newSaleAmount), // Increment yearly report
      });

      // Update stock inventory (reduce stock value)
      final productDoc = FirebaseFirestore.instance
          .collection('products') // Assuming you have a products collection
          .doc(productId); // Use the specific product's ID

      // Reduce the stock value by 1 (or the quantity sold)
      await productDoc.update({
        'stock_value':
            FieldValue.increment(-1), // Decrement stock by 1 (adjust as needed)
      });

      // Optionally, if you want to update daily, monthly, and yearly reports individually
      await FirebaseFirestore.instance
          .collection('reports')
          .doc('daily_sales')
          .update({
        'value': FieldValue.increment(newSaleAmount),
      });

      await FirebaseFirestore.instance
          .collection('reports')
          .doc('monthly_sales')
          .update({
        'value': FieldValue.increment(newSaleAmount),
      });

      await FirebaseFirestore.instance
          .collection('reports')
          .doc('yearly_report')
          .update({
        'value': FieldValue.increment(newSaleAmount),
      });
    } catch (e) {
      print("Error updating sales: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(
            'lib/assets/Shoppingicon.png',
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'STAFF DASHBOARD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatBox("INVENTORY", Icons.inventory,
                                stockValue.toStringAsFixed(2)),
                            _buildStatBox("MONTHLY SALES", Icons.point_of_sale,
                                monthlySales.toStringAsFixed(2)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatBox("DAILY SALES", Icons.add_chart,
                                dailySales.toStringAsFixed(2)),
                            _buildStatBox(
                                "YEARLY REPORT",
                                Icons.note_alt_outlined,
                                yearlyReport.toStringAsFixed(2)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Order Overview',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "Order details here...",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  // Stateless box to display information
  Widget _buildStatBox(String label, IconData icon, String value) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 44, 62, 80),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color.fromARGB(255, 44, 62, 80)),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color.fromARGB(255, 44, 62, 80),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 44, 62, 80),
            ),
          ),
        ],
      ),
    );
  }
}
