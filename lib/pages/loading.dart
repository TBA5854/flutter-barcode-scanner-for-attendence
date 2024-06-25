import 'dart:io';

import 'package:barcodescanner/pages/scan.dart';
import 'package:barcodescanner/providers/attendence.dart';
import 'package:barcodescanner/utilities/android_file_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

Future<String> init() async {
  // super.initState();
  var appDir = await getApplicationDocumentsDirectory();
  if (appDir.path.isEmpty) {
    throw Exception("Failed to get application directory");
  }
  var file = File('${appDir.path}/data.csv');
  if (!await file.exists()) {
    await file.create();
  }
  return '${appDir.path}/data.csv';
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          datafile = CsvFileHandler(snapshot.data as String);
          Future(() {
            setState(() {
              var readCsv = datafile.readCsv();
              print(readCsv);
              ref
                  .read(attendeesProvider.notifier)
                  .init(datafile.csvToListOfAttendees(readCsv));
            });
            print('\n\n${ref.watch(attendeesProvider)}');
            Navigator.popAndPushNamed(context, 'home',
                arguments: snapshot.data as String);
          });
          // Navigator.
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
