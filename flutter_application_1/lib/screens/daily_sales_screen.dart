import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DailySalesScreen extends StatefulWidget {
  const DailySalesScreen({super.key});

  @override
  State<DailySalesScreen> createState() => _DailySalesScreenState();
}

class _DailySalesScreenState extends State<DailySalesScreen> {
  List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  // Method to fetch transactions for the current day only
  Future<void> _fetchTransactions() async {
    try {
      // Get today's date at midnight to filter by day
      DateTime now = DateTime.now();
      DateTime startOfDay =
          DateTime(now.year, now.month, now.day); // Midnight today
      DateTime endOfDay = DateTime(
          now.year, now.month, now.day, 23, 59, 59, 999); // End of today

      // Query Firestore to fetch only today's transactions
      var transactionsQuery = FirebaseFirestore.instance
          .collection('transactions')
          .where('date', isGreaterThanOrEqualTo: startOfDay)
          .where('date', isLessThanOrEqualTo: endOfDay);

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
          'amount': data['amount'], // Represents the quantity purchased
          'price': data['price'], // Assumes price is in PHP
          'date': dateTime, // Store the DateTime or null if not available
          'description': data['description'],
          'item_name': data['name'], // Changed from 'Customer' to 'Item Name'
        });
      }

      setState(() {
        _transactions = transactionList;
      });
    } catch (error) {
      print("Error fetching transactions: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Sales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactions:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  var transaction = _transactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Order ID: ${transaction['order_id']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Amount: ${transaction['amount']}'), // No PHP prefix
                          Text(
                              'Price: PHP ${transaction['price']}'), // Assumes price is in PHP
                          Text('Description: ${transaction['description']}'),
                          Text(
                              'Item Name: ${transaction['item_name']}'), // Updated label
                          Text(
                              'Date: ${transaction['date'] != null ? transaction['date']!.toLocal() : 'N/A'}'), // Check if date is null
                        ],
                      ),
                      leading: const Icon(Icons.payment),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _fetchTransactions,
              child: const Text('Refresh Transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
