import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_service.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool isLoading = true;
  List<Map<String, dynamic>> inventoryItems = [];
  List<String> documentIds = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _fetchItemsFromFirestore();
  }

  void _fetchItemsFromFirestore() async {
    setState(() => isLoading = true);
    try {
      var items = await firestoreService.getInventoryItems();
      setState(() {
        inventoryItems = items;
        // Explicitly cast to List<String>
        documentIds = List<String>.from(items.map((item) => item['id']));
      });
    } catch (e) {
      // Error handling: Log the error or show a message
      print('Error fetching items: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void addItem(Map<String, dynamic> itemData) {
    firestoreService.addInventoryItem(itemData);
    setState(() {
      inventoryItems.add(itemData);
    });
  }

  void updateItemAmount(int index, int newAmount) {
    String docId = documentIds[index];
    firestoreService.updateInventoryItem(docId, {'amount': newAmount});
    setState(() {
      inventoryItems[index]['amount'] = newAmount;
    });
  }

  void deleteItem(int index) {
    String docId = documentIds[index];
    firestoreService.deleteInventoryItem(docId);
    setState(() {
      inventoryItems.removeAt(index);
      documentIds.removeAt(index);
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Add Your Item",
            style: TextStyle(color: Color.fromARGB(255, 44, 62, 80)),
          ),
          content: Container(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description of Item',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount of Item',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
                _descriptionController.clear();
                _amountController.clear();
              },
              child: const Text("Cancel",
                  style: TextStyle(color: Color.fromARGB(255, 44, 62, 80))),
            ),
            TextButton(
              onPressed: () {
                String name = _nameController.text;
                String description = _descriptionController.text;
                int amount = int.tryParse(_amountController.text) ?? 0;

                if (name.isEmpty || description.isEmpty || amount <= 0) {
                  // Validation: show error message or return
                  return;
                }

                Map<String, dynamic> newItem = {
                  'name': name,
                  'description': description,
                  'amount': amount,
                };

                addItem(newItem);

                _nameController.clear();
                _descriptionController.clear();
                _amountController.clear();

                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _showDescriptionDialog(String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Description'),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 62, 80),
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
          'INVENTORY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromARGB(255, 44, 62, 80),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.circle_notifications,
                color: Color.fromARGB(255, 44, 62, 80), size: 35),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: inventoryItems
                        .where((item) =>
                            item['name']
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()) ||
                            item['description']
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()))
                        .toList()
                        .length,
                    itemBuilder: (context, index) {
                      final item = inventoryItems
                          .where((item) =>
                              item['name']
                                  .toLowerCase()
                                  .contains(searchQuery.toLowerCase()) ||
                              item['description']
                                  .toLowerCase()
                                  .contains(searchQuery.toLowerCase()))
                          .toList()[index];

                      int itemAmount = item['amount'];

                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 15.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ITEM: ${item['name']}',
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 44, 62, 80),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Tooltip(
                                              message: 'Remove 1 Item',
                                              child: IconButton(
                                                onPressed: itemAmount > 0
                                                    ? () => updateItemAmount(
                                                          index,
                                                          itemAmount - 1,
                                                        )
                                                    : null,
                                                icon: const Icon(
                                                    Icons.remove_circle),
                                              ),
                                            ),
                                            Text(
                                              '$itemAmount',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Tooltip(
                                              message: 'Add 1 Item',
                                              child: IconButton(
                                                onPressed: () =>
                                                    updateItemAmount(
                                                        index, itemAmount + 1),
                                                icon: const Icon(
                                                    Icons.add_circle),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        backgroundColor: const Color.fromARGB(255, 44, 62, 80),
        child: const Icon(Icons.add),
      ),
    );
  }
}
