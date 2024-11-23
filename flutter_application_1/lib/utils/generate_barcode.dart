import 'dart:io';
import 'package:barcode/barcode.dart';

void main() {
  // Define the barcode data
  String data = '12345'; // This matches your product in the database

  // Generate the barcode
  final barcode = Barcode.code128(); // Use Code 128
  final svg = barcode.toSvg(
    data,
    width: 200, // width in pixels
    height: 80, // height in pixels
  );

  // Save as a .svg file
  final file =
      File('barcode.svg'); // This will save the file in the current directory
  file.writeAsStringSync(svg);

  print('Barcode saved as barcode.svg');
}
