import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Barcodescan extends StatefulWidget {
  const Barcodescan({super.key});

  @override
  State<Barcodescan> createState() => _barcodescanState();
}

class _barcodescanState extends State<Barcodescan> {
  String Result = "Scanned Barcode will appear here";
  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;
      setState(() {
        this.Result = barcode.toString();
      });
    } on PlatformException {
      Result = "Failed to scan Barcode";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode Scanning")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              '$Result',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: scanBarcode, child: Text("Scan Barcode"))
          ],
        ),
      ),
    );
  }
}
