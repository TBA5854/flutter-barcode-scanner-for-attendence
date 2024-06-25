// import 'package:excel/excel.dart';
// // import 'dart:convert';
// import 'dart:io';
import 'dart:io';

import 'package:barcodescanner/models/attendees.dart';

// import 'package:csv/csv.dart';
// class XlsxFileHandler {
//   Excel _excel= Excel.createExcel();

//   XlsxFileHandler(String filePath) {
//     _excel = Excel.createExcel();
//     // _excel.(filePath);
//   }

//   List<String> getSheetNames() {
//     return _excel.tables.keys.toList();
//   }

//   List<List<dynamic>> readSheet(String sheetName) {
//     if (!_excel.tables.containsKey(sheetName)) {
//       throw Exception('Sheet $sheetName does not exist');
//     }

//     Sheet? sheet = _excel.tables[sheetName];
//     // return sheet.rows.isEmpty;
//   }

//   void writeSheet(String sheetName, List<List<dynamic>> data) {
//     _excel.update(sheetName, data);
//   }

//   void saveChanges() {
//     _excel.encode().then((bytes) {
//       // Save the bytes to a file or send it as a response
//       // For example:
//       // File('output.xlsx').writeAsBytes(bytes);
//     });
//   }
// }
// // TO BE IMPLEMENTED
// /*

// class CsvFileHandler {
//   final String filePath;

//   CsvFileHandler(this.filePath);

//   List<List<dynamic>> readCsv() {
//     File file = File(filePath);
//     List<List<dynamic>> csvData = [];

//     // try {
//       List<String> lines = file.readAsLinesSync();
//       for (String line in lines) {
//         List<dynamic> row = line.split(',');
//         csvData.add(row);
//       }
//     // } catch (e) {
//       // throw Exception('Failed to read CSV file: $e');
//     // }

//     return csvData;
//   }

//   void writeCsv(List<List<dynamic>> data) {
//     File file = File(filePath);

//     // try {
//       String csvContent = '';

//       for (List<dynamic> row in data) {
//         String line = row.map((cell) => cell.toString()).join(',');
//         csvContent += line + '\n';
//       }

//       file.writeAsStringSync(csvContent);
//     // } catch (e) {
//       // throw Exception('Failed to write CSV file: $e');
//     // }
//   }
// } */

class CsvFileHandler {
  late String filePath;

  // CsvFileHandler(){
  // filePath = "";
  // };
  CsvFileHandler(String path) {
    filePath = path;
    print("$filePath");
  }
  CsvFileHandler.neww(); // filePath = "hello.csv";

  List<List<dynamic>> readCsv() {
    print("object $filePath");
    File file = File(filePath);
    List<List<dynamic>> csvData = [];
    try {
      List<String> lines = file.readAsLinesSync();
      for (String line in lines) {
        List<dynamic> row = line.split(',');
        csvData.add(row);
      }
    } catch (e) {
      throw Exception('Failed to read CSV file: $e');
    }
    return csvData;
  }

  void writeCsv(List<List<dynamic>> data) {
    File file = File(filePath);
    try {
      String csvContent = '';
      for (List<dynamic> row in data) {
        String line = row.map((cell) => cell.toString()).join(',');
        csvContent += '$line\n';
      }
     file.writeAsStringSync(csvContent);
    } catch (e) {
      throw Exception('Failed to write CSV file: $e');
    }
  }

  List<Attendee> csvToListOfAttendees(List<List<dynamic>> csvData) {
    List<Attendee> attendees = [];
    for (List<dynamic> row in csvData) {
      String registrationNumber = row[0];
      String timeOfScan = row[1];
      String sno = row[2];
      Attendee attendeeInfo = Attendee(
          registration_number: registrationNumber,
          time_of_scan: timeOfScan,
          sno: int.parse(sno));
      attendees.add(attendeeInfo);
    }
    return attendees;
  }
}
