import 'package:barcodescanner/pages/list.dart';
import 'package:barcodescanner/pages/scan.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int tmp = 0;
List<Widget> bottomnavpages = const [
  Scan_Page(),
  ListPage()
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: MediaQuery.sizeOf(context).shortestSide / 12,
        elevation: 100,
        enableFeedback: true,
        showUnselectedLabels: false,
        currentIndex: tmp,
        onTap: (value) {
          tmp = value;
          // print(tmp);
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.barcode_reader),
            label: "Scan",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: "List"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.download_rounded), label: "Export"),
        ],
      ),
      body: bottomnavpages.elementAt(tmp), 
      // endDrawer: //,
    ));
  }
}
