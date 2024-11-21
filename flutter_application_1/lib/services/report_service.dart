import 'package:cloud_firestore/cloud_firestore.dart';

class ReportService {
  Future<Map<String, double>> fetchReports() async {
    double totalSales = 0.0;
    double yearlyReport = 0.0;
    double overallOrders = 0.0;

    // Fetch all documents in the reports collection
    final reportsSnapshot =
        await FirebaseFirestore.instance.collection('reports').get();

    // Iterate over each document in the snapshot
    for (var doc in reportsSnapshot.docs) {
      print('Document ID: ${doc.id}, Data: ${doc.data()}');

      // Safely check if the required fields exist and assign values
      if (doc.id == 'total_sales') {
        // Accessing the field Total_Sales directly and parsing it to double
        totalSales =
            double.tryParse(doc.data()['Total_Sales'].toString()) ?? 0.0;
      } else if (doc.id == 'yearly_report') {
        // Accessing the field Yearly Report directly and parsing it to double
        yearlyReport =
            double.tryParse(doc.data()['Yearly Report'].toString()) ?? 0.0;
      } else if (doc.id == 'overall_orders') {
        // Accessing the field Overall Orders directly and parsing it to double
        overallOrders =
            double.tryParse(doc.data()['Overall Orders'].toString()) ?? 0.0;
      }
    }

    // Return the results as a map
    return {
      'Total Sales': totalSales,
      'Yearly Report': yearlyReport,
      'Overall Orders': overallOrders,
    };
  }
}
