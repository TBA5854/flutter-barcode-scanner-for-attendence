import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/enum.dart';

import 'package:simple_barcode_scanner/screens/shared.dart';
// import 'package:simple_barcode_scanner/screens/shared.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

var rez = "";
void main() {
  return runApp(MaterialApp(
    home: s(),
  ));
  // print(DateTime.now().toString());
}

class T extends StatefulWidget {
  const T({super.key});

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var res = await Navigator.push(context,
                MaterialPageRoute(builder: (context)=>s())
            );
            setState(() {
              if (res is String) {
                print(res);
                rez = res;
              }
            });
          }),
    );
  }
}

class s extends StatelessWidget {
  const s({super.key});

  @override
  Widget build(BuildContext context) {
    return BarcodeScanner(
      
                    lineColor: "#00ff00",
                    cancelButtonText: "cancel",
                    isShowFlashIcon: true,
                    scanType: ScanType.barcode,
                    // appBarTitle: appBarTitle,
                    // centerTitle: centerTitle,
                    onScanned: (res) {
                      Navigator.pop(context, res);
                    });
  }
}