import 'dart:typed_data';

import 'package:barcodescanner/controllers/textcontrollers.dart';
import 'package:barcodescanner/models/attendees.dart';
import 'package:barcodescanner/pages/scan.dart';
import 'package:barcodescanner/providers/attendence.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slidable_button/slidable_button.dart';
// import 'package:barcodescanner/pages/scanbarcode.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

bool clearAfterExport = false;
String _buttonText = 'Slide me';

class _ListPageState extends ConsumerState<ListPage> {
  @override
  Widget build(BuildContext context) {
    List<Attendee> attendeesList = ref.watch(attendeesProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        // print(constraints.maxHeight);
        // print(constraints.maxHeight / 12);
        // print(constraints.maxHeight / 50);
        // double available_height=constraints.maxHeight;
        return Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                onOpened: () {},
                icon: const Icon(Icons.more_vert_rounded),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        onTap: () => setState(() {
                              // () {
                              datafile.writeCsv([]);
                              ref.read(attendeesProvider.notifier).emptyAll();
                              // ;
                            }),
                        child: const Text("Clear List"))
                  ];
                },
              )
            ],
            title: Padding(
              padding: EdgeInsets.only(
                  top: (constraints.maxHeight / 50 > 12
                      ? 0
                      : constraints.maxHeight / 50)),
              child: Text(
                "Attendees List",
                style: TextStyle(
                    fontSize: (constraints.maxHeight / 12 > 56.75
                        ? 45
                        : constraints.maxHeight / 12)),
              ),
            ),
          ),
          body: ListView(
            children: attendeesList.map(
              (e) {
                // print(e);
                return ListTile(
                  title: Text(e.registration_number),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.time_of_scan.toString()),
                      Text("#${e.sno}"),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, setTheState) {
                  return AlertDialog(
                    title: const Text("Export Options"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Export as"),

                        // HorizontalSlidableButton(
                        //   autoSlide: true,
                        //   color: Colors.white24,
                        //   buttonColor: Colors.grey,
                        //   dismissible: false,
                        //   label: Center(
                        //       child: Text(
                        //     _buttonText,
                        //   )),
                        //   initialPosition: SlidableButtonPosition.center,
                        //   width: MediaQuery.sizeOf(context).width / 3,
                        //   buttonWidth: 60,
                        //   onChanged: (position) {
                        //     setState(
                        //       () {
                        //         if (position == SlidableButtonPosition.start) {
                        //           _buttonText = '.CSV';
                        //         } else if (position ==
                        //             SlidableButtonPosition.end) {
                        //           _buttonText = '.XLSX';
                        //         } else {
                        //           _buttonText = 'Slide me';
                        //         }
                        //       },
                        //     );
                        //   },
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(8.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Text(".CSV"),
                        //         Text(".XLSX"),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: exportFileName,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Enter your File name',
                          ),
                        ),
                        const SizedBox(height: 20),
                        CheckboxListTile(
                            value: clearAfterExport,
                            onChanged: (value) {
                              clearAfterExport = !clearAfterExport;
                              setTheState(() {
                                // print(clearAfterExport);
                              });
                            },
                            title: const Text("Clear List After Export")),
                        // TextButton(onPressed: () => setState(() {

                        // }), child: Text("child"))
                      ],
                    ),
                    actions: [
                      TextButton(
                          onLongPress: () {
                            setState(() {});
                          },
                          onPressed: () {
                            Navigator.pop(context);
                            clearAfterExport = false;
                          },
                          child: const Text("Cancel")),
                      TextButton(
                          onLongPress: () async {},
                          onPressed: () async {
                            var excel = Excel.createExcel();
                            excel.rename("Sheet1", "Attendence");
                            for (var i = 0; i < attendeesList.length; i++) {
                              excel.insertRowIterables(
                                  "Attendence",
                                  [
                                    TextCellValue(
                                        attendeesList[i].registration_number),
                                    TextCellValue(DateTime.now().toString()),
                                    TextCellValue(
                                        attendeesList[i].sno.toString()),
                                  ],
                                  i);
                            }
                            String? op = await FilePicker.platform.saveFile(
                              dialogTitle: "Save File",
                              fileName: "${exportFileName.text}.xlsx",
                              bytes: Uint8List.fromList(excel.encode()!),
                              initialDirectory: "./",
                            );
                            if (op != null) {
                              if (context.mounted) {
                                if (clearAfterExport) {
                                  setState(() {
  datafile.writeCsv([]);
  ref
      .read(attendeesProvider.notifier)
      .emptyAll();
});
                                }
                                Navigator.pop(context);
                              }
                            }
                            // ignore: avoid_print
                            print(op);

                            clearAfterExport = false;
                          },
                          child: const Text("Export"))
                    ],
                  );
                });
              },
            ),
            child: const Icon(Icons.output_rounded),
          ),
        );
      },
    );
  }
}
