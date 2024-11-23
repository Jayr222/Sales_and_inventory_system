import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map<String, dynamic>> _cart = [];
  double _totalPrice = 0.0;

  final Map<String, dynamic> _productsDatabase = {
    '12345': {'name': 'Product A', 'price': 50.0},
    '67890': {'name': 'Product B', 'price': 30.0},
    '11122': {'name': 'Product C', 'price': 20.0},
  };

  Future<void> _scanAndProcessPayment() async {
    try {
      var result = await BarcodeScanner.scan();
      String scannedCode = result.rawContent;

      if (_productsDatabase.containsKey(scannedCode)) {
        var product = _productsDatabase[scannedCode];

        setState(() {
          _cart.add({
            'name': product['name'],
            'price': product['price'],
          });
          _totalPrice += product['price'];
        });

        _processPayment();
      } else {
        _showMessage('Product not found!');
      }
    } catch (e) {
      _showMessage('Error scanning barcode: $e');
    }
  }

  void _processPayment() async {
    if (_cart.isNotEmpty) {
      try {
        var accessToken = await _getPayPalAccessToken();
        var orderId = await _createPayPalOrder(accessToken, _totalPrice);

        if (orderId != null) {
          _showMessage('Payment successful! Order ID: $orderId');
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
      var data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      throw Exception('Failed to get access token');
    }
  }

  Map<String, String> headersWithBasicAuth(String clientId, String secret) {
    var basicAuth = 'Basic ${base64Encode(utf8.encode('$clientId:$secret'))}';
    return {
      'Authorization': basicAuth,
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  Future<String?> _createPayPalOrder(String accessToken, double amount) async {
    const orderUrl = 'https://api-m.sandbox.paypal.com/v2/checkout/orders';

    var response = await http.post(
      Uri.parse(orderUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'intent': 'CAPTURE',
        'purchase_units': [
          {
            'amount': {
              'currency_code': 'PHP',
              'value': amount.toStringAsFixed(2),
            }
          }
        ]
      }),
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return data['id'];
    } else {
      throw Exception('Failed to create PayPal order');
    }
  }

  void _showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _scanAndProcessPayment,
            child: const Text('Scan and Process Payment'),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Price: \$$_totalPrice',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                var item = _cart[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Price: \$${item['price']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
