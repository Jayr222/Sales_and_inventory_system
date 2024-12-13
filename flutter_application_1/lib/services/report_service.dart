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
      final reportDoc =
          await _firestore.collection('reports').doc('reportID').get();
      if (!reportDoc.exists) {
        // If reportID doesn't exist, create a new one
        await _firestore.collection('reports').doc('reportID').set({
          'daily_sales': 0,
          'monthly_sales': 0,
          'yearly_report': 0,
          'stock_value': 0,
          'daily_sales_last_updated': FieldValue.serverTimestamp(),
          'monthly_sales_last_updated': FieldValue.serverTimestamp(),
          'yearly_report_last_updated': FieldValue.serverTimestamp(),
        });
      }

      final reportData = reportDoc.data()!;
      double newDailySales = reportData['daily_sales'] + saleAmount;
      double newMonthlySales = reportData['monthly_sales'] + saleAmount;
      double newYearlySales = reportData['yearly_report'] + saleAmount;

      // Update the sales for daily, monthly, or yearly based on the sale type
      if (saleType == 'daily') {
        await _firestore.collection('reports').doc('reportID').update({
          'daily_sales': newDailySales,
          'daily_sales_last_updated': FieldValue.serverTimestamp(),
        });
      } else if (saleType == 'monthly') {
        await _firestore.collection('reports').doc('reportID').update({
          'monthly_sales': newMonthlySales,
          'monthly_sales_last_updated': FieldValue.serverTimestamp(),
        });
      } else if (saleType == 'yearly') {
        await _firestore.collection('reports').doc('reportID').update({
          'yearly_report': newYearlySales,
          'yearly_report_last_updated': FieldValue.serverTimestamp(),
        });
      }
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
}
