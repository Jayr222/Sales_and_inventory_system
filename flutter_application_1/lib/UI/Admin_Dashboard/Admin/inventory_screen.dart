import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barcode_widget/barcode_widget.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<DocumentSnapshot> _products = [];
  List<DocumentSnapshot> _filteredProducts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() => _isLoading = true);
    try {
      final querySnapshot = await _firestore.collection('products').get();
      setState(() {
        _products = querySnapshot.docs;
        _filteredProducts = List.from(_products);
      });
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _filterProducts(String query) {
    final filtered = _products.where((product) {
      final name = product['name']?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
    setState(() => _filteredProducts = filtered);
  }

  Future<void> _addProduct() async {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled')),
      );
      return;
    }

    final product = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'price': double.tryParse(_priceController.text) ?? 0.0,
      'amount': 0, // Initial amount set to 0
      'barcode': DateTime.now().millisecondsSinceEpoch.toString(),
    };

    try {
      await _firestore.collection('products').add(product);
      _fetchProducts();
      _clearTextFields();
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<void> _updateProduct(DocumentSnapshot product) async {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled')),
      );
      return;
    }

    final updatedProduct = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'price': double.tryParse(_priceController.text) ?? 0.0,
    };

    try {
      await _firestore
          .collection('products')
          .doc(product.id)
          .update(updatedProduct);
      _fetchProducts();
      _clearTextFields();
    } catch (e) {
      print('Error updating product: $e');
    }
  }

  void _clearTextFields() {
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
  }

  Future<void> _updateProductAmount(
      DocumentSnapshot product, int newAmount) async {
    try {
      await _firestore
          .collection('products')
          .doc(product.id)
          .update({'amount': newAmount});
      _fetchProducts();
    } catch (e) {
      print('Error updating product amount: $e');
    }
  }

  Future<void> _deleteProduct(DocumentSnapshot product) async {
    try {
      await _firestore.collection('products').doc(product.id).delete();
      _fetchProducts();
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  void _showAddOrEditDialog(DocumentSnapshot? product) {
    if (product != null) {
      _nameController.text = product['name'] ?? '';
      _descriptionController.text = product['description'] ?? '';
      _priceController.text = product['price']?.toString() ?? '';
    } else {
      _clearTextFields();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product != null ? 'Edit Product' : 'Add Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Product Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Price (₱)'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (product != null) {
                _updateProduct(product);
              } else {
                _addProduct();
              }
              Navigator.pop(context);
            },
            child: Text(product != null ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
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
          'INVENTORY',
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _filterProducts,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return Card(
                        child: ListTile(
                          title: Text(product['name'] ?? 'Unnamed Product'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Description: ${product['description'] ?? 'No Description'}'),
                              Text(
                                  'Price: ₱${product['price']?.toStringAsFixed(2) ?? '0.00'}'),
                              Text('Amount: ${product['amount'] ?? 0}'),
                              const SizedBox(height: 10),
                              BarcodeWidget(
                                data: product['barcode'] ?? '',
                                barcode: Barcode.code128(),
                                width: 200,
                                height: 50,
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add_circle),
                                onPressed: () => _updateProductAmount(
                                  product,
                                  (product['amount'] ?? 0) + 1,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: product['amount'] > 0
                                    ? () => _updateProductAmount(
                                          product,
                                          (product['amount'] ?? 0) - 1,
                                        )
                                    : null,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _deleteProduct(product),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showAddOrEditDialog(product),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddOrEditDialog(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
