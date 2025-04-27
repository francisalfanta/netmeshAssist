import 'dart:io';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
// ✅ Ensure you import text parsingS
import 'package:netmeshAssist/utils/permission_helper.dart'; // ✅ Import the helper
import 'package:netmeshAssist/utils/address_helper.dart'; // ✅ Import the helper

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
    print('extractedData : $extractedData');
    // ✅ Append each data row
    for (var data in extractedData) {
      //data["rssi"] = data["signal_strength"]R.split(" ")[0].trim();
      data["rssi"] = (data["signal_strength"] ?? "").toString().split(" ")[0].trim();

      List<CellValue> rowData = headers.map((title) {
        return TextCellValue(data[title]?.toString() ?? ""); // Convert nulls to empty strings
      }).toList();

      sheet.appendRow(rowData);
    }

    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download'); // ✅ Save in Internal Storage Downloads
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    final filePath = "${directory!.path}/NetmeshAssist_defaultformat_$timestamp.xlsx";
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

  Future<String?> saveToExcelMBSVReport(List<Map<String, dynamic>> extractedData) async {
    if (extractedData.isEmpty) {
      debugPrint("❌ No data to save.");
      return null;
    }
    // await checkFileExists();
    await requestStoragePermission(); // ✅ Ensure permission is granted before saving

    final excel = Excel.createExcel();
    final Sheet sheet = excel.sheets.values.first;

    List<String> headers = [
      "Region No", "Province", "City/Municipality", "Barangay", "Date", "Time", "Network/Technology",
      "Service Provider", "UPLOAD Mbps", "DOWNLOAD Mbps", "Signal Strength dbm", "Remarks (Signal Strength Equivalency)"
    ];

    sheet.appendRow(headers.map((header) => TextCellValue(header)).toList());

    List<String> dataList = [
      "nro", "province",  "municipality", "barangay","date","time", "network_type",
      "operator", "upload", "download","signal_strength", "signal_quality"
    ];

    // ✅ Append each data row
    for (var data in extractedData) {
      // Get Date & Time using  "timestamp"
      data["date"] = data["date2"] ?? "";
      data["time"] = data["time2"] ?? "";

      // ✅ Signal Strength Extraction - Safely split first part
      if (data["signal_strength"] != null) {
        List<String> parts = data["signal_strength"].split(" ");
        data["signal_strength"] = parts.isNotEmpty ? parts[0].trim() : "";
      }

      // ✅ Convert "nro" to Roman Numerals only if it exists and is a valid number
      if
      (data.containsKey("nro") && data["nro"] != null && data["nro"].toString().isNotEmpty) {
        data["nro"] = AddressHelper.convertToRoman(data["nro"]);
      } else {
        data["nro"] = ""; // Provide a default value if necessary
      }

      List<CellValue> rowData = dataList.map((title) {
        return TextCellValue(data[title]?.toString() ?? ""); // Convert nulls to empty strings
      }).toList();

      sheet.appendRow(rowData);
    }

    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory(); // Use safer storage API
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    if (directory == null) {
      debugPrint("❌ Error: Unable to find a storage directory.");
      return null;
    }

    final filePath = "${directory!.path}/NetmeshAssist_mbvp_$timestamp.xlsx";
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
}