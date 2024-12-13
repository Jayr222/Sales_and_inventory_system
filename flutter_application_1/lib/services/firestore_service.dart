import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to add a product with a custom ID (barcode)
  Future<void> addProductWithCustomId(
      String barcode, Map<String, dynamic> productData) async {
    if (barcode.isEmpty) {
      throw 'Barcode cannot be empty.';
    }
    try {
      await _firestore.collection('products').doc(barcode).set(productData);
      debugPrint('Product added successfully with barcode: $barcode');
    } catch (e) {
      debugPrint('Failed to add product: $e');
      rethrow;
    }
  }

  // Example method to demonstrate adding a product with a custom ID
  Future<void> addProduct() async {
    String barcode = "1234567890"; // Set your custom barcode value
    Map<String, dynamic> productData = {
      "name": "Sample Product",
      "price": 100.0,
      "stock": 50,
    };

    try {
      await addProductWithCustomId(barcode, productData);
    } catch (e) {
      debugPrint('Error in addProduct: $e');
    }
  }

  /// Updates a product item
  Future<void> updateProduct(
      String barcode, Map<String, dynamic> updatedData) async {
    if (barcode.isEmpty) {
      throw 'Barcode cannot be empty.';
    }
    if (updatedData.isEmpty) {
      throw 'Updated data cannot be empty.';
    }
    try {
      if (updatedData['amount'] != null && updatedData['amount'] < 0) {
        throw 'Amount should be a positive number.';
      }
      await _firestore.collection('products').doc(barcode).update(updatedData);
      debugPrint('Product item with barcode $barcode updated successfully!');
    } catch (e) {
      debugPrint('Error updating product item: $e');
      rethrow;
    }
  }

  /// Deletes a product item
  Future<void> deleteProduct(String barcode) async {
    if (barcode.isEmpty) {
      throw 'Barcode cannot be empty.';
    }
    try {
      await _firestore.collection('products').doc(barcode).delete();
      debugPrint('Product item with barcode $barcode deleted successfully!');
    } catch (e) {
      debugPrint('Error deleting product item: $e');
      rethrow;
    }
  }
}
