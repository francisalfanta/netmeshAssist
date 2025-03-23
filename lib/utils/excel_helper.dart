import 'dart:io';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'text_parser.dart';  // ✅ Ensure you import text parsingS
import 'package:netmeshelperv2/utils/permission_helper.dart'; // ✅ Import the helper

class ExcelHelper {
  Future<String?> saveToExcel(List<Map<String, dynamic>> extractedData) async {
    if (extractedData.isEmpty) {
      debugPrint("❌ No data to save.");
      return null;
    }
    // await checkFileExists();
    await requestStoragePermission(); // ✅ Ensure permission is granted before saving

    final excel = Excel.createExcel();
    final Sheet sheet = excel.sheets.values.first;

    List<String> headers = [
      "timestamp", "ping", "jitter", "upload", "download", "region", "province",
      "municipality", "barangay", "rssi", "signal_quality", "operator", "lat", "lon",
      "phone_model", "email", "nro", "network_type", "cell_id", "mcc", "mnc", "tac", "success"
    ];

    sheet.appendRow(headers.map((header) => TextCellValue(header)).toList());

    // ✅ Append each data row
    for (var data in extractedData) {
      // print('Data :');
      // print(data);
      List<CellValue> rowData = headers.map((title) {
        return TextCellValue(data[title]?.toString() ?? ""); // Convert nulls to empty strings
      }).toList();
      // print(rowData);
      sheet.appendRow(rowData);
    }

    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download'); // ✅ Save in Internal Storage Downloads
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    };

    final filePath = "${directory!.path}/NetmesHEasyAid_$timestamp.xlsx";
    File file = File(filePath);

    try {
      await file.writeAsBytes(excel.encode()!);
      debugPrint("✅ Excel file saved at: $filePath");
      return filePath; // ✅ Return the saved file path
    } catch (e) {
      debugPrint("❌ Error saving Excel file: $e");
      return null; // Return null if there's an error
    }
  }

  /*
  Future<void> checkFileExists() async {
    File file = File('/storage/emulated/0/Download/NetmesHEasyAid_20250323_095813.xlsx');

    if (await file.exists()) {
      print("✅ File exists at: ${file.path}");
    } else {
      print("❌ File NOT found.");
    }
  }
   */
}
