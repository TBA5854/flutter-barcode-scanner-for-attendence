import 'dart:math';

import 'package:barcodescanner/pages/scanbarcode.dart';
import 'package:barcodescanner/providers/attendence.dart';
import 'package:flutter/material.dart';
import 'package:barcodescanner/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  @override
  Widget build(BuildContext context) {
    var attendeesList = ref.watch(attendeesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Barcodescan()));
              },
              child: Text("Scan Now")),
          Container(
            color: Theme.of(context).secondaryHeaderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Last Scan",
                      style: TextStyle(),
                    )),
                if (attendeesList.isNotEmpty)
                  ListTile(
                    title: Text(attendeesList.last.registration_number),
                    subtitle: Text(attendeesList.last.time_of_scan.toString()),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
