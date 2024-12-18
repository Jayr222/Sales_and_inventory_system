import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Reference to Firestore 'transactions' collection
    CollectionReference transactions =
        FirebaseFirestore.instance.collection('transactions');

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
          'HISTORY',
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
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255), // Background color
        child: StreamBuilder<QuerySnapshot>(
          // Real-time data from Firestore
          stream: transactions.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No transactions found.'));
            }

            // Data available, display it
            var transactionsList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: transactionsList.length,
              itemBuilder: (context, index) {
                var transaction = transactionsList[index];
                var transactionData =
                    transaction.data() as Map<String, dynamic>;

                // Extract relevant fields
                var name = transactionData['name'] ?? 'Unnamed Product';
                var amount = transactionData['amount'] ?? 'N/A';
                var price = transactionData['price'] ?? 0.0;
                var barcode = transactionData['barcode'] ?? 'No Barcode';
                var description =
                    transactionData['description'] ?? 'No Description';
                var date = transactionData['date'] != null
                    ? (transactionData['date'] as Timestamp).toDate()
                    : null;

                // Format the date if available
                String formattedDate = date != null
                    ? DateFormat('yyyy-MM-dd – HH:mm').format(date)
                    : 'Not Available';

                // Calculate total price
                var totalPrice = price * (amount is int ? amount : 1);

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Amount: $amount'),
                        Text('Price: \$$price'),
                        Text('Total: \$$totalPrice'),
                        Text('Barcode: $barcode'),
                        Text('Description: $description'),
                        Text('Date: $formattedDate'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
