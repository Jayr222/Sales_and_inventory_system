import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For rendering SVG
import 'package:firebase_storage/firebase_storage.dart'; // For Firebase Storage
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firestore
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class GenerateBarcodePage extends StatelessWidget {
  final String productId;

  const GenerateBarcodePage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Barcode"),
      ),
      body: Center(
        child: BarcodeWidget(productId: productId),
      ),
    );
  }
}

class BarcodeWidget extends StatelessWidget {
  final String productId;

  const BarcodeWidget({super.key, required this.productId});

  Future<void> _saveBarcodeToFirebase(String svg) async {
    try {
      // Get a temporary directory
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Save the SVG string to a file in the temporary directory
      File file = File('$tempPath/barcode_$productId.svg');
      await file.writeAsString(svg);

      // Upload the file to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('barcodes/barcode_$productId.svg');
      UploadTask uploadTask = storageRef.putFile(file);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Optionally, save the download URL to Firestore (you can create a "barcodes" collection)
      await FirebaseFirestore.instance.collection('barcodes').add({
        'productId': productId,
        'barcodeUrl': downloadUrl,
        'createdAt': Timestamp.now(),
      });

      print('Barcode uploaded successfully: $downloadUrl');
    } catch (e) {
      print('Failed to save barcode: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final barcode = Barcode.code128(); // Using Code 128 barcode
    final svg = barcode.toSvg(
      productId, // Using product ID as barcode data
      width: 250, // Customize barcode width
      height: 150, // Customize barcode height
    );

    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Column(
        children: [
          Text("Barcode for Product ID: $productId"),
          const SizedBox(height: 100),
          // Render the barcode SVG in your Flutter app
          SvgPicture.string(svg),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () async {
              await _saveBarcodeToFirebase(svg);
              // Show a snackbar to indicate success
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Barcode saved and uploaded!')),
              );
            },
            child: const Text("Save Barcode"),
          ),
        ],
      ),
    );
  }
}
