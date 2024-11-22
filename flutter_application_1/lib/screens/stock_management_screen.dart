import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StockManagementScreen extends StatefulWidget {
  const StockManagementScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StockManagementScreenState createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> {
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  Future<void> addStock(String productId, int addedQuantity) async {
    DocumentReference productRef =
        FirebaseFirestore.instance.collection('products').doc(productId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(productRef);

      if (!snapshot.exists) {
        throw Exception("Product does not exist!");
      }

      final data = snapshot.data() as Map<String, dynamic>; // Cast data to Map
      int currentQuantity = data['quantity'] as int; // Cast to int
      transaction
          .update(productRef, {'quantity': currentQuantity + addedQuantity});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stock Management")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _productIdController,
              decoration: const InputDecoration(labelText: "Product ID"),
            ),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: "Quantity to Add"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String productId = _productIdController.text;
                int quantity = int.tryParse(_quantityController.text) ?? 0;

                if (productId.isNotEmpty && quantity > 0) {
                  addStock(productId, quantity).then((_) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Stock added!")));
                    _productIdController.clear();
                    _quantityController.clear();
                  }).catchError((error) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Error: $error")));
                  });
                }
              },
              child: const Text("Add Stock"),
            ),
          ],
        ),
      ),
    );
  }
}
