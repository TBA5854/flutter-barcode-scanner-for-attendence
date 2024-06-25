import 'package:barcodescanner/pages/list.dart';
import 'package:barcodescanner/pages/scan.dart';
// import 'package:barcodescanner/providers/attendence.dart';
// import 'package:barcodescanner/providers/data.dart';
// import 'package:barcodescanner/utilities/android_file_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

int tmp = 0;
List<Widget> bottomnavpages = const [ScanPage(), ListPage()];

class _HomeState extends ConsumerState<Home> {

    //   void test() async {
    //   .then(
    //     (value) {
    //       // print("data:${ref.watch(dataProvider)}");
          
    //     },
    //   );
    // }
  

  @override
  Widget build(BuildContext context) {
    // String dir = ModalRoute.of(context)!.settings.arguments as String;
    // ref.read(dataProvider.notifier).init();
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: MediaQuery.sizeOf(context).shortestSide / 14,
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
