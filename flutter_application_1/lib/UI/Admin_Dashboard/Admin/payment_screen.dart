import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map<String, dynamic>> _cart = [];
  double _totalPrice = 0.0;

  // Inside _scanAndProcessPayment
  Future<void> _scanAndProcessPayment() async {
    try {
      var result = await BarcodeScanner.scan();
      String scannedCode = result.rawContent;

      var productRef = FirebaseFirestore.instance.collection('products');
      var productSnapshot =
          await productRef.where('barcode', isEqualTo: scannedCode).get();

      if (productSnapshot.docs.isNotEmpty) {
        var product = productSnapshot.docs.first.data();

        if (product['amount'] > 0) {
          // Update the amount of the product in Firestore
          await productRef.doc(productSnapshot.docs.first.id).update({
            'amount': FieldValue.increment(-1), // Decrease amount by 1
          });

          setState(() {
            _cart.add({
              'name': product['name'] ??
                  'Unknown Product', // Ensuring the name is added
              'price': product['price'] ?? 0.0, // Ensuring price is added
              'description':
                  product['description'] ?? 'No description', // Default value
              'amount': 1, // Default amount of 1 for simplicity
              'barcode': product['barcode'] ??
                  'No barcode', // Default value for barcode
            });
            _totalPrice += product['price'] ?? 0.0; // Update total price
          });

          _showMessage('Product added to cart!');
        } else {
          _showMessage('Not enough stock for this product!');
        }
      } else {
        _showMessage('Product not found!');
      }
    } catch (e) {
      _showMessage('Error scanning barcode: $e');
    }
  }

  // Method to trigger payment process
  void _processPayment() async {
    if (_cart.isNotEmpty) {
      try {
        var accessToken = await _getPayPalAccessToken();
        var orderId = await _createPayPalOrder(accessToken, _totalPrice);

        if (orderId != null) {
          // Save to Firestore
          await _saveTransactionHistory(orderId);

          // Update Reports collection
          await _updateReportsCollection(_totalPrice);

          _showMessage('Payment successful! Order ID: $orderId');

          // Generate receipt before clearing cart
          _generateReceipt(
              orderId, _totalPrice); // Passing the correct totalPrice

          // Clear cart and reset total price only after receipt is generated
          setState(() {
            _cart.clear();
            _totalPrice = 0.0;
          });
        } else {
          _showMessage('Payment failed! Please try again.');
        }
      } catch (e) {
        _showMessage('Payment error: $e');
      }
    } else {
      _showMessage('No items in the cart to process payment!');
    }
    print("Cart items: $_cart");
  }

  // Function to generate receipt
  void _generateReceipt(String orderId, double totalPrice) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Receipt - Order ID: $orderId'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Items Purchased:'),
            // Loop through the cart and display each item's name and price
            ..._cart.map((item) {
              return Text(
                  '${item['name']} - ₱${item['price'].toStringAsFixed(2)}'); // Show name and price
            }),
            const Divider(),
            // Display the total amount
            Text('Total Amount: ₱${totalPrice.toStringAsFixed(2)}'),
            // Display the time of purchase
            Text('Purchased on: ${DateTime.now().toString()}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _printReceipt(orderId, totalPrice); // Call print function
            },
            child: const Text('Print Receipt'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _printReceipt(String orderId, double totalPrice) {
    try {
      // In a real-world scenario, you would integrate with a printer SDK or service
      // This is a simulated print functionality
      print('------- RECEIPT -------');
      print('Order ID: $orderId');
      print('Items:');
      for (var item in _cart) {
        print('${item['name']} - ₱${item['price'].toStringAsFixed(2)}');
      }
      print('Total Amount: ₱${totalPrice.toStringAsFixed(2)}');
      print('Printed on: ${DateTime.now()}');
      print('----------------------');

      // Show a success message
      _showMessage('Receipt printed successfully!');

      // Close the dialog
      Navigator.of(context).pop();
    } catch (e) {
      _showMessage('Error printing receipt: $e');
    }
  }

  // Function to update the Reports collection
  Future<void> _updateReportsCollection(double paymentAmount) async {
    final reportsRef = FirebaseFirestore.instance.collection('reports');
    final dailySalesRef = reportsRef.doc('daily_sales');
    final monthlySalesRef = reportsRef.doc('monthly_sales');
    final yearlySalesRef = reportsRef.doc('yearly_report');
    final reportIDRef = reportsRef.doc('reportID');

    final timestamp = FieldValue.serverTimestamp();

    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final dailySalesDoc = await transaction.get(dailySalesRef);
        final monthlySalesDoc = await transaction.get(monthlySalesRef);
        final yearlySalesDoc = await transaction.get(yearlySalesRef);
        final reportIDDoc = await transaction.get(reportIDRef);

        if (dailySalesDoc.exists) {
          transaction.update(
            dailySalesRef,
            {
              'value': FieldValue.increment(paymentAmount),
              'daily_sales_last_updated': timestamp,
            },
          );
        } else {
          transaction.set(
            dailySalesRef,
            {
              'value': paymentAmount,
              'daily_sales_last_updated': timestamp,
            },
          );
        }

        if (monthlySalesDoc.exists) {
          transaction.update(
            monthlySalesRef,
            {
              'value': FieldValue.increment(paymentAmount),
              'monthly_sales_last_updated': timestamp,
            },
          );
        } else {
          transaction.set(
            monthlySalesRef,
            {
              'value': paymentAmount,
              'monthly_sales_last_updated': timestamp,
            },
          );
        }

        if (yearlySalesDoc.exists) {
          transaction.update(
            yearlySalesRef,
            {
              'value': FieldValue.increment(paymentAmount),
              'yearly_report_last_updated': timestamp,
            },
          );
        } else {
          transaction.set(
            yearlySalesRef,
            {
              'value': paymentAmount,
              'yearly_report_last_updated': timestamp,
            },
          );
        }

        if (reportIDDoc.exists) {
          transaction.update(
            reportIDRef,
            {
              'daily_sales': FieldValue.increment(paymentAmount),
              'monthly_sales': FieldValue.increment(paymentAmount),
              'yearly_report': FieldValue.increment(paymentAmount),
              'daily_sales_last_updated': timestamp,
              'monthly_sales_last_updated': timestamp,
              'yearly_report_last_updated': timestamp,
            },
          );
        } else {
          transaction.set(
            reportIDRef,
            {
              'daily_sales': paymentAmount,
              'monthly_sales': paymentAmount,
              'yearly_report': paymentAmount,
              'stock_value': 0,
              'daily_sales_last_updated': timestamp,
              'monthly_sales_last_updated': timestamp,
              'yearly_report_last_updated': timestamp,
            },
          );
        }
      });

      print("Reports updated successfully!");
    } catch (error) {
      print("Error updating reports: $error");
    }
  }

  Future<void> _saveTransactionHistory(String orderId) async {
    for (var item in _cart) {
      try {
        await FirebaseFirestore.instance.collection('transactions').add({
          'name': item['name'] ?? 'Unnamed product',
          'amount': item['amount'] ?? 'N/A',
          'price': item['price'] ?? 0,
          'barcode': item['barcode'] ?? 'No barcode',
          'description': item['description'] ?? 'No description',
          'date': Timestamp.now(),
          'order_id': orderId,
        });
      } catch (error) {
        print("Error saving transaction: $error");
      }
    }
  }

  // Step 1: Get PayPal Access Token
  Future<String> _getPayPalAccessToken() async {
    const clientId =
        'ARaDpTRsLIJGSzRL1MIHOuca4xP7bsJBjZnOOwadEA_CW_VR_dWocNJZTERaMhnPWHHgccw4aUdOfIyx';
    const secret =
        'EHgJ5f-q4uQB8FRezI2f3J5rGfmPzijZvGaYR0KIn6nKZFva8I-YQWN_N5nsqj3tmnYkUt3QAn_dQr7Q';
    const authUrl = 'https://api-m.sandbox.paypal.com/v1/oauth2/token';

    var response = await http.post(
      Uri.parse(authUrl),
      headers: headersWithBasicAuth(clientId, secret),
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  // Step 2: Create PayPal Order
  Future<String?> _createPayPalOrder(
      String accessToken, double totalAmount) async {
    const createOrderUrl =
        'https://api-m.sandbox.paypal.com/v2/checkout/orders';

    var response = await http.post(
      Uri.parse(createOrderUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'intent': 'CAPTURE',
        'purchase_units': [
          {
            'amount': {'currency_code': 'USD', 'value': totalAmount.toString()}
          }
        ],
      }),
    );

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['id'];
    } else {
      throw Exception('Failed to create PayPal order');
    }
  }

  // Utility function to handle authentication headers
  Map<String, String> headersWithBasicAuth(String clientId, String secret) {
    return {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
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
          'PAYMENTS',
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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _scanAndProcessPayment,
            child: const Text('Scan and Add Product'),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Price: ₱$_totalPrice', // Changed to Peso (₱)
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                var item = _cart[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle:
                      Text('Price: ₱${item['price']}'), // Changed to Peso (₱)
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _processPayment,
            child: const Text('Process Payment'),
          ),
        ],
      ),
    );
  }
}
