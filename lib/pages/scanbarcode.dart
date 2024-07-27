import 'dart:async';
import 'package:barcodescanner/pages/scan.dart';

// import 'package:barcodescanner/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:barcodescanner/providers/attendence.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:barcodescanner/widgets/scanner_button_widget.dart';
import 'package:barcodescanner/widgets/scanner_error_widget.dart';

class BarcodeScannerWithController extends ConsumerStatefulWidget {
  const BarcodeScannerWithController({super.key});

  @override
  ConsumerState<BarcodeScannerWithController> createState() =>
      _BarcodeScannerWithControllerState();
}

bool isContinuous = true;

class _BarcodeScannerWithControllerState
    extends ConsumerState<BarcodeScannerWithController>
    with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    torchEnabled: true,
    useNewCameraSelector: true,
  );

  Barcode? _barcode;
  StreamSubscription<Object?>? _subscription;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }
    if(invalid){
      return Text(
        value.displayValue ?? 'No display value.',
        overflow: TextOverflow.fade,
        style: const TextStyle(color: Colors.red),
      );
    }if(duplicate){
      return Text(
        value.displayValue ?? 'No display value.',
        overflow: TextOverflow.fade,
        style: const TextStyle(color: Colors.green),
      );
    }
    return Text(
      
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }
//fix duplicate entry
  bool ifDup(String value) {
    var attendeesList = ref.watch(attendeesProvider);
    for (var element in attendeesList) {
      if (element.registration_number == value) {
        return true;
      }
    }
    return false;
  }
  String lastScan="";
  bool duplicate=false,invalid=false;
  bool valid(String value) {
    RegExp idCardRegex = RegExp(r"[0-9]{2}[A-Za-z]{3}[0-9]{4}");
    return idCardRegex.hasMatch(value);
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    var attendeesList = ref.watch(attendeesProvider);
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
        print(_barcode?.displayValue);
        if (!valid(_barcode?.displayValue as String)) {
          invalid=true;
          return;
        }
        lastScan=_barcode?.displayValue as String;
        if (ifDup(_barcode?.displayValue as String)) {
          duplicate=true;
          return;
        }
        ref.read(attendeesProvider.notifier).add_attendees(
            _barcode?.displayValue as String,
            ref.read(attendeesProvider.notifier).no_of_participants + 1);
        List<List<dynamic>> tmp = [];
        for (var element in attendeesList) {
          tmp.add(
              [element.registration_number, element.time_of_scan, element.sno]);
        }
        datafile.writeCsv(tmp);
        if (isContinuous) {
          controller.stop();
          Navigator.of(context).pop(_barcode?.displayValue);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
        actions: [
          PopupMenuButton(
            onOpened: () {},
            icon: const Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: () => setState(() {
                          print("popup");
                          // () {
                          // ;
                        }),
                    child: CheckboxListTile(
                        value: isContinuous,
                        onChanged: (value) {
                          // clearAfterExport = !clearAfterExport;
                          print(isContinuous);
                          setState(() {
                            isContinuous = !isContinuous;
                          });
                        },
                        title: const Text("Continuous Scan")))
              ];
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleFlashlightButton(controller: controller),
                  StartStopMobileScannerButton(controller: controller),
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                  SwitchCameraButton(controller: controller),
                  AnalyzeImageFromGalleryButton(controller: controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }
}
