import 'package:cloud_firestore/cloud_firestore.dart';

class ReportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to update daily, monthly, and yearly reports after a sale
  Future<void> updateSalesReports(
      double saleAmount, String saleType, String barcode) async {
    try {
      // 1. Query the product by its barcode (or any other unique identifier you have)
      final productSnapshot = await _firestore
          .collection('products')
          .where('barcode', isEqualTo: barcode)
          .limit(1)
          .get();

      if (productSnapshot.docs.isEmpty) {
        throw Exception('Product not found');
      }

      // Fetch the first product document that matches the barcode
      final productDoc = productSnapshot.docs.first;

      // Decrease stock value after sale (assuming stock_value is present)
      await productDoc.reference.update({
        'stock_value':
            FieldValue.increment(-1), // Decrease by 1 after each sale
      });

      // 2. Fetch the reports document
      final reportRef = _firestore.collection('reports').doc('reportID');
      final reportDoc = await reportRef.get();

      if (!reportDoc.exists) {
        // If reportID doesn't exist, create a new one
        await reportRef.set({
          'daily_sales': 0,
          'monthly_sales': 0,
          'yearly_report': 0,
          'stock_value': 0,
          'daily_sales_last_updated': FieldValue.serverTimestamp(),
          'monthly_sales_last_updated': FieldValue.serverTimestamp(),
          'yearly_report_last_updated': FieldValue.serverTimestamp(),
          'transactions': [], // Initialize transactions array
        });
      }

      // Update sales for daily, monthly, or yearly based on the sale type
      if (saleType == 'daily') {
        await reportRef.update({
          'daily_sales': FieldValue.increment(saleAmount),
          'daily_sales_last_updated': FieldValue.serverTimestamp(),
        });
      } else if (saleType == 'monthly') {
        await reportRef.update({
          'monthly_sales': FieldValue.increment(saleAmount),
          'monthly_sales_last_updated': FieldValue.serverTimestamp(),
        });
      } else if (saleType == 'yearly') {
        await reportRef.update({
          'yearly_report': FieldValue.increment(saleAmount),
          'yearly_report_last_updated': FieldValue.serverTimestamp(),
        });
      }

      // Add the new transaction to the transactions array
      await reportRef.update({
        'transactions': FieldValue.arrayUnion([
          {
            'id': DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
            'amount': saleAmount,
            'type': saleType,
            'time': FieldValue.serverTimestamp(),
          }
        ]),
      });
    } catch (e) {
      print('Error updating sales reports: $e');
    }
  }

  // Method to fetch reports (daily_sales, monthly_sales, yearly_report, stock_value)
  Future<Map<String, double>> getReports() async {
    try {
      // Fetch the report document (reportID)
      DocumentSnapshot reportDoc =
          await _firestore.collection('reports').doc('reportID').get();

      if (!reportDoc.exists) {
        throw Exception('Report document not found');
      }

      final reportData = reportDoc.data()! as Map<String, dynamic>;

      // Return the values as a Map
      return {
        'daily_sales': reportData['daily_sales']?.toDouble() ?? 0.0,
        'monthly_sales': reportData['monthly_sales']?.toDouble() ?? 0.0,
        'yearly_report': reportData['yearly_report']?.toDouble() ?? 0.0,
        'stock_value': reportData['stock_value']?.toDouble() ?? 0.0,
      };
    } catch (e) {
      print('Error fetching reports: $e');
      throw Exception("Error fetching reports: $e");
    }
  }

  // Method to fetch all transactions for displaying breakdown
  Future<List<Map<String, dynamic>>> getTransactions() async {
    try {
      // Fetch the report document (reportID)
      DocumentSnapshot reportDoc =
          await _firestore.collection('reports').doc('reportID').get();

      if (!reportDoc.exists) {
        throw Exception('Report document not found');
      }

      final reportData = reportDoc.data()! as Map<String, dynamic>;

      // Return the transactions array
      return List<Map<String, dynamic>>.from(reportData['transactions'] ?? []);
    } catch (e) {
      print('Error fetching transactions: $e');
      throw Exception("Error fetching transactions: $e");
    }
  }
}
