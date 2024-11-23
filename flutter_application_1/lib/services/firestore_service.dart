import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Adds a new inventory item
  Future<void> addInventoryItem(Map<String, dynamic> itemData) async {
    try {
      // Validate the item data before adding to Firestore
      if (itemData['name'] == null || itemData['name'].isEmpty) {
        throw 'Item name is required.';
      }
      if (itemData['amount'] == null || itemData['amount'] < 0) {
        throw 'Amount should be a positive number.';
      }

      await firestore.collection('inventory').add(itemData);
      print('Inventory item added successfully!');
    } catch (e) {
      print('Error adding inventory item: $e');
      rethrow; // Allow to catch errors in UI or elsewhere
    }
  }

  // Fetches all inventory items
  Future<List<Map<String, dynamic>>> getInventoryItems() async {
    try {
      final snapshot = await firestore.collection('inventory').get();
      // Map each document to a Map object with ID included
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Include the document ID for updates/deletes
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching inventory items: $e');
      return [];
    }
  }

  // Updates an inventory item
  Future<void> updateInventoryItem(
      String docId, Map<String, dynamic> updatedData) async {
    try {
      if (updatedData['amount'] != null && updatedData['amount'] < 0) {
        throw 'Amount should be a positive number.';
      }
      await firestore.collection('inventory').doc(docId).update(updatedData);
      print('Inventory item updated successfully!');
    } catch (e) {
      print('Error updating inventory item: $e');
      rethrow; // Allow to catch errors in UI or elsewhere
    }
  }

  // Deletes an inventory item
  Future<void> deleteInventoryItem(String docId) async {
    try {
      await firestore.collection('inventory').doc(docId).delete();
      print('Inventory item deleted successfully!');
    } catch (e) {
      print('Error deleting inventory item: $e');
      rethrow; // Allow to catch errors in UI or elsewhere
    }
  }
}
