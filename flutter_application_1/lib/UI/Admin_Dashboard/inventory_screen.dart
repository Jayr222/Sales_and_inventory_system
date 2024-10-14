import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: const Color.fromARGB(255, 255, 226, 139),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 226, 139),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 565,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final products = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final productId = product.id;
                      final productName =
                          product['name'] as String; // Cast to String
                      final productQuantity =
                          product['quantity'] as int; // Cast to int

                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(productName),
                            subtitle: Text("Stock: $productQuantity"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    print(
                                        'Add Stock button pressed for product ID: $productId');
                                    _showAddStockDialog(productId);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    print(
                                        'Remove Stock button pressed for product ID: $productId');
                                    _showRemoveStockDialog(productId);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddStockDialog(String productId) {
    final TextEditingController quantityController = TextEditingController();

    try {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add Stock"),
            content: TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  int quantity = int.tryParse(quantityController.text) ?? 0;
                  if (quantity > 0) {
                    addStock(productId, quantity);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Add"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("Error showing Add Stock dialog: $e");
    }
  }

  void _showRemoveStockDialog(String productId) {
    final TextEditingController quantityController = TextEditingController();

    try {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Remove Stock"),
            content: TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: "Quantity"),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  int quantity = int.tryParse(quantityController.text) ?? 0;
                  if (quantity > 0) {
                    removeStock(productId, quantity);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Remove"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("Error showing Remove Stock dialog: $e");
    }
  }

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

  Future<void> removeStock(String productId, int removedQuantity) async {
    DocumentReference productRef =
        FirebaseFirestore.instance.collection('products').doc(productId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(productRef);

      if (!snapshot.exists) {
        throw Exception("Product does not exist!");
      }

      final data = snapshot.data() as Map<String, dynamic>; // Cast data to Map
      int currentQuantity = data['quantity'] as int; // Cast to int
      if (currentQuantity < removedQuantity) {
        throw Exception("Not enough stock to remove!");
      }

      transaction
          .update(productRef, {'quantity': currentQuantity - removedQuantity});
    });
  }
}
