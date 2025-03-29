import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:netmeshAssist/utils/permission_helper.dart'; // ✅ Import permission helper

class CsvHelper {
  Future<String?> saveToCsv(List<Map<String, dynamic>> extractedData) async {
    if (extractedData.isEmpty) {
      debugPrint("❌ No data to save.");
      return null;
    }

    await requestStoragePermission(); // ✅ Ensure permission is granted before saving

    List<String> headers = [
      "timestamp", "ping", "jitter", "upload", "download", "region", "province",
      "municipality", "barangay", "rssi", "signal_quality", "operator", "lat", "lon",
      "phone_model", "email", "nro", "network_type", "cell_id", "mcc", "mnc", "tac", "success"
    ];

    StringBuffer csvContent = StringBuffer();
    csvContent.writeln(headers.join(",")); // ✅ Write headers

    for (var data in extractedData) {
      data["rssi"] = data["signal_strength"].split(" ")[0].trim();
      List<String> row = headers.map((title) => '"${data[title]?.toString() ?? ""}"').toList();
      csvContent.writeln(row.join(","));
    }

    String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download'); // ✅ Save in Internal Storage Downloads
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    final filePath = "${directory!.path}/NetmeshAssist_$timestamp.csv";
    File file = File(filePath);

    try {
      await file.writeAsString(csvContent.toString());
      debugPrint("✅ CSV file saved at: $filePath");
      return filePath; // ✅ Return the saved file path
    } catch (e) {
      debugPrint("❌ Error saving CSV file: $e");
      return null;
    }
  }
}
