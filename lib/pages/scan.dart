import 'dart:math';
// import '';
import 'package:barcodescanner/pages/scanbarcode.dart';
import 'package:barcodescanner/providers/attendence.dart';
// import 'package:barcodescanner/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:barcodescanner/utilities/android_file_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CsvFileHandler datafile = CsvFileHandler.neww();

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
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
          TextButton(
              onLongPress:()=> setState(() {
                
              }),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Barcodescan()));
              },
              child: const Text("Scan Now")),
          Container(
            color: Theme.of(context).secondaryHeaderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        var regno = "23BCE${Random().nextInt(2000)}";
                        // var scantime = DateTime.now();
                        ref.read(attendeesProvider.notifier).add_attendees(
                            regno,
                            ref
                                    .read(attendeesProvider.notifier)
                                    .no_of_participants +
                                1);
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
                    },
                    child: const Text(
                      "Last Scan",
                      style: TextStyle(),
                    )),
                if (attendeesList.isNotEmpty)
                  ListTile(
                    title: Text(attendeesList.last.registration_number),
                    subtitle: Text(attendeesList.last.time_of_scan),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
