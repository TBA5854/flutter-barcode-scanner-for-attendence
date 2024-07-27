// import '';
// import 'package:barcodescanner/pages/scanbarcode.dart';
import 'package:barcodescanner/providers/attendence.dart';
// import 'package:barcodescanner/providers/data.dart';
import 'package:barcodescanner/pages/scanbarcode.dart';
import 'package:flutter/material.dart';
import 'package:barcodescanner/utilities/android_file_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CsvFileHandler datafile = CsvFileHandler.neww();

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

// class _barcodescanState extends State<Barcodescan> {

class _ScanPageState extends ConsumerState<ScanPage> {
  String result = "";
  RegExp idCardRegex=RegExp(r"[0-9]{2}[A-Za-z]{3}[0-9]{4}");
  Future<void> scanBarcode(attendeesList) async {
    try {
      final barcode = await FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (!mounted) return;
      setState(() {
        result = barcode.toString();
        if (result == "-1" || !idCardRegex.hasMatch(result)) {
          return;
          // throw Exception("Failed to scan Barcode");
        }
        ref.read(attendeesProvider.notifier).add_attendees(result,
            ref.read(attendeesProvider.notifier).no_of_participants + 1);
                                    List<List<dynamic>> tmp = [];
                        for (var element in attendeesList) {
                          tmp.add([
                            element.registration_number,
                            element.time_of_scan,
                            element.sno
                          ]);
                        }
                        datafile.writeCsv(tmp);
      });
    } on PlatformException {
      // Result = "Failed to scan Barcode";
      throw Exception("Failed to scan Barcode");
    }
  }

  @override
  Widget build(BuildContext context) {
    // void test() async {
    //   await ref.read(dataProvider.notifier).init().then(
    //     (value) {
    //       // print("data:${ref.watch(dataProvider)}");
    //       datafile = CsvFileHandler(ref.watch(dataProvider));
    //       ref
    //           .read(attendeesProvider.notifier)
    //           .init(datafile.csvToListOfAttendees(datafile.readCsv()));
    //     },
    //   );
    // }

    // test();
    var attendeesList = ref.watch(attendeesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          Text("Barcode\nScanner",style: TextStyle(fontSize: 45),),
          OutlinedButton(
              // onLongPress: () => setState(() {}),
              onPressed: () {
                // scanBarcode(attendeesList);
            //     ref.read(attendeesProvider.notifier).add_attendees(result,
            // ref.read(attendeesProvider.notifier).no_of_participants + 1);
            //                         List<List<dynamic>> tmp = [];
            //             for (var element in attendeesList) {
            //               tmp.add([
            //                 element.registration_number,
            //                 element.time_of_scan,
            //                 element.sno
            //               ]);
            //             }
            //             datafile.writeCsv(tmp);
                Navigator.of(context).push(
                                      MaterialPageRoute<String>(
                    builder: (context) => const BarcodeScannerWithController(),
                  ),);
              },
              child: const Text("Scan Now")),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Theme.of(context).dividerColor,),
              // color: Theme.of(context).highlightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Last Scan",
                      style: TextStyle(
                        debugLabel: "label",
                        color: Theme.of(context).primaryColorLight
                      ),
                    ),
                  ),
                  if (attendeesList.isNotEmpty)
                    ListTile(
                      title: Text(attendeesList.last.registration_number),
                      subtitle: Text(attendeesList.last.time_of_scan),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
