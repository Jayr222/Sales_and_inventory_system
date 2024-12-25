import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MonthlySalesScreen extends StatefulWidget {
  const MonthlySalesScreen({super.key});

  @override
  State<MonthlySalesScreen> createState() => _MonthlySalesScreenState();
}

class _MonthlySalesScreenState extends State<MonthlySalesScreen> {
  List<Map<String, dynamic>> _monthlyTransactions = [];

  @override
  void initState() {
    super.initState();
    _fetchMonthlyTransactions();
  }

  // Method to fetch transactions for the current month only
  Future<void> _fetchMonthlyTransactions() async {
    try {
      // Get the first and last day of the current month
      DateTime now = DateTime.now();
      DateTime startOfMonth = DateTime(now.year, now.month, 1); // First day
      DateTime endOfMonth =
          DateTime(now.year, now.month + 1, 0, 23, 59, 59, 999); // Last day

      // Query Firestore to fetch transactions within the current month
      var transactionsQuery = FirebaseFirestore.instance
          .collection('transactions')
          .where('date', isGreaterThanOrEqualTo: startOfMonth)
          .where('date', isLessThanOrEqualTo: endOfMonth);

      var querySnapshot = await transactionsQuery.get();

      List<Map<String, dynamic>> transactionList = [];

      for (var doc in querySnapshot.docs) {
        var data = doc.data();

        // Safely handle 'date' field, ensuring it's not null and is a Firestore Timestamp
        var date = data['date'];
        DateTime? dateTime =
            date != null && date is Timestamp ? date.toDate() : null;

        transactionList.add({
          'order_id': data['order_id'],
          'amount': data['amount'],
          'price': data['price'],
          'date': dateTime, // Store the DateTime or null if not available
          'description': data['description'],
          'item_name': data['name'], // Changed from 'Customer' to 'Item Name'
        });
      }

      setState(() {
        _monthlyTransactions = transactionList;
      });
    } catch (error) {
      print("Error fetching transactions: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Sales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Transactions:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _monthlyTransactions.length,
                itemBuilder: (context, index) {
                  var transaction = _monthlyTransactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Order ID: ${transaction['order_id']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Item Name: ${transaction['item_name']}'), // Updated label
                          Text(
                              'Amount: ${transaction['amount']}'), // No PHP prefix
                          Text(
                              'Price: PHP ${transaction['price']}'), // Assuming price is in PHP
                          Text('Description: ${transaction['description']}'),
                          Text(
                              'Date: ${transaction['date'] != null ? transaction['date']!.toLocal() : 'N/A'}'), // Check if date is null
                        ],
                      ),
                      leading: const Icon(Icons.shopping_cart),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _fetchMonthlyTransactions,
              child: const Text('Refresh Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
