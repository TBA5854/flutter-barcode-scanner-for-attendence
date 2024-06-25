// import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:permission_handler/permission_handler.dart';

import '../analysis_options.yaml';

Directory docDir = Directory("");

void getDir() async {
  // print(tmp);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MaterialApp(
    home: Home(),
  ));
  // Permission.manageExternalStorage.request();
  // await code();
// final byteSream=File(fileName).writeAsStringSync(contents)
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FloatingActionButton(onPressed: code)),
    );
  }
}

Future<void> code() async {
  var tmp = await getApplicationDocumentsDirectory();
  // docDir = tmp;
  // getDir();
  // sleep(Duration(seconds: 5));
  print(docDir);
  print(docDir.path);
  print(docDir.parent);
  print(docDir.path + "/test.xlsx");
  // final fileName = docDir.path + r"/test.xlsx";

  // exit(0);
  var f = File("/home/tba/Desktop/Bar-code-attendance-app/test.xlsx").createSync(exclusive: false);

  final List<List<TextCellValue>> Attendees = [];
  Attendees.add([TextCellValue("1"), TextCellValue(DateTime.now().toString())]);
  // sleep(Duration(milliseconds: 500));
  Attendees.add([TextCellValue("2"), TextCellValue(DateTime.now().toString())]);
  // sleep(Duration(milliseconds: 500));
  Attendees.add([TextCellValue("3"), TextCellValue(DateTime.now().toString())]);
  // sleep(Duration(milliseconds: 500));
  Attendees.add([TextCellValue("4"), TextCellValue(DateTime.now().toString())]);
  // sleep(Duration(milliseconds: 500));
  Attendees.add([TextCellValue("5"), TextCellValue(DateTime.now().toString())]);
  // sleep(Duration(milliseconds: 500));
  print(Attendees);
  // Excel.createExcel();
  // for (var element in Attendees) {
  // excel.insertRowIterables("sheet-1", element, Enum.compareByName(Attendees));
  var excel = Excel.createExcel();
  excel.rename("Sheet 1", "Attendence");
  for (var i = 0; i < Attendees.length; i++) {
    excel.insertRowIterables("Attendence", Attendees[i], i);
  }
  print(DateTime.now());
  var writestramf =
      File("/home/tba/Desktop/Bar-code-attendance-app/test.xlsx").writeAsBytes(excel.encode()!);
  print(DateTime.now());
  //   .onError(
  // (error, stackTrace) {
  //   print(error);
  //   // return FutureOr<File;
  // },
  // );
  // var readstreamf = File("/storage/emulated/0/test.xlsx").readAsBytesSync();
  // var readstreame = Excel.decodeBytes(readstreamf);
  // print(readstreame);
  // final byteSream = File(fileName).writeAsBytesSync(BytesBuilder(copy: Attendees).toBytes());
}
