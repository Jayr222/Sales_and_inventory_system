import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        child: FutureBuilder<QuerySnapshot>(
          // Fetching data from Firestore
          future: transactions.get(),
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

                // Extract relevant fields from the transaction data
                var transactionId = transaction.id;
                var amount = transactionData['amount'] ??
                    'N/A'; // Assuming the field 'amount' exists
                var date = (transactionData['date'] as Timestamp?)?.toDate() ??
                    DateTime.now(); // Assuming a 'date' field exists

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: ListTile(
                    title: Text('Transaction #$transactionId'),
                    subtitle: Text('Amount: $amount\nDate: ${date.toLocal()}'),
                    trailing: Icon(Icons.arrow_forward_ios),
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
