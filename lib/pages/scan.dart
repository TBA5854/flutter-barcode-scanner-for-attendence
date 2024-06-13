import 'package:flutter/material.dart';
import 'package:barcodescanner/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Scan_Page extends ConsumerStatefulWidget {
  const Scan_Page({super.key});

  @override
  ConsumerState<Scan_Page> createState() => _Scan_PageState();
}

class _Scan_PageState extends ConsumerState<Scan_Page> {
  @override
  Widget build(BuildContext context) {
    // ref
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Container(), 
        TextButton(onPressed: () {}, child: Text("Scan Now")),
        Container(color: Theme.of(context).secondaryHeaderColor,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        TextButton(onPressed: (){},child: Text("Last Scan",style: TextStyle(),)),
          ],),
        )
        ],
      ),
    );
  }
}
