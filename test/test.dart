// // // import 'dart:async';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:excel/excel.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // import '../analysis_options.yaml';

// // Directory docDir = Directory("");

// // void getDir() async {
// //   // print(tmp);
// // }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   return runApp(MaterialApp(
// //     home: Home(),
// //   ));
// //   // Permission.manageExternalStorage.request();
// //   // await code();
// // // final byteSream=File(fileName).writeAsStringSync(contents)
// // }

// // class Home extends StatefulWidget {
// //   const Home({super.key});

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Center(child: FloatingActionButton(onPressed: code)),
// //     );
// //   }
// // }

// // Future<void> code() async {
// //   var tmp = await getApplicationDocumentsDirectory();
// //   // docDir = tmp;
// //   // getDir();
// //   // sleep(Duration(seconds: 5));
// //   print(docDir);
// //   print(docDir.path);
// //   print(docDir.parent);
// //   print(docDir.path + "/test.xlsx");
// //   // final fileName = docDir.path + r"/test.xlsx";

// //   // exit(0);
// //   var f = File("/home/tba/Desktop/Bar-code-attendance-app/test.xlsx").createSync(exclusive: false);

// //   final List<List<TextCellValue>> Attendees = [];
// //   Attendees.add([TextCellValue("1"), TextCellValue(DateTime.now().toString())]);
// //   // sleep(Duration(milliseconds: 500));
// //   Attendees.add([TextCellValue("2"), TextCellValue(DateTime.now().toString())]);
// //   // sleep(Duration(milliseconds: 500));
// //   Attendees.add([TextCellValue("3"), TextCellValue(DateTime.now().toString())]);
// //   // sleep(Duration(milliseconds: 500));
// //   Attendees.add([TextCellValue("4"), TextCellValue(DateTime.now().toString())]);
// //   // sleep(Duration(milliseconds: 500));
// //   Attendees.add([TextCellValue("5"), TextCellValue(DateTime.now().toString())]);
// //   // sleep(Duration(milliseconds: 500));
// //   print(Attendees);
// //   // Excel.createExcel();
// //   // for (var element in Attendees) {
// //   // excel.insertRowIterables("sheet-1", element, Enum.compareByName(Attendees));
// //   var excel = Excel.createExcel();
// //   excel.rename("Sheet 1", "Attendence");
// //   for (var i = 0; i < Attendees.length; i++) {
// //     excel.insertRowIterables("Attendence", Attendees[i], i);
// //   }
// //   print(DateTime.now());
// //   var writestramf =
// //       File("/home/tba/Desktop/Bar-code-attendance-app/test.xlsx").writeAsBytes(excel.encode()!);
// //   print(DateTime.now());
// //   //   .onError(
// //   // (error, stackTrace) {
// //   //   print(error);
// //   //   // return FutureOr<File;
// //   // },
// //   // );
// //   // var readstreamf = File("/storage/emulated/0/test.xlsx").readAsBytesSync();
// //   // var readstreame = Excel.decodeBytes(readstreamf);
// //   // print(readstreame);
// //   // final byteSream = File(fileName).writeAsBytesSync(BytesBuilder(copy: Attendees).toBytes());
// // }
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner_example/barcode_scanner_controller.dart';
// import 'package:mobile_scanner_example/barcode_scanner_listview.dart';
// import 'package:mobile_scanner_example/barcode_scanner_pageview.dart';
// import 'package:mobile_scanner_example/barcode_scanner_returning_image.dart';
// import 'package:mobile_scanner_example/barcode_scanner_simple.dart';
// import 'package:mobile_scanner_example/barcode_scanner_window.dart';
// import 'package:mobile_scanner_example/barcode_scanner_zoom.dart';
// import 'package:mobile_scanner_example/mobile_scanner_overlay.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Mobile Scanner Example',
//       home: MyHome(),
//     ),
//   );
// }

// class MyHome extends StatelessWidget {
//   const MyHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Mobile Scanner Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerSimple(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner Simple'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerListView(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner with ListView'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerWithController(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner with Controller'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerWithScanWindow(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner with ScanWindow'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerReturningImage(),
//                   ),
//                 );
//               },
//               child: const Text(
//                 'MobileScanner with Controller (returning image)',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerWithZoom(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner with zoom slider'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => const BarcodeScannerPageView(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner pageView'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => BarcodeScannerWithOverlay(),
//                   ),
//                 );
//               },
//               child: const Text('MobileScanner with Overlay'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }