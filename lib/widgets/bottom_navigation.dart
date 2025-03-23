import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:netmeshelperv2/utils/excel_helper.dart'; // Import the ExcelHelper class
import 'package:netmeshelperv2/utils/csv_helper.dart'; // Import the ExcelHelper class

class BottomNavigation extends StatelessWidget {
  final List<Map<String, dynamic>> extractedData;
  final ExcelHelper excelHelper = ExcelHelper();
  final CsvHelper csvHelper = CsvHelper();

  BottomNavigation({Key? key, required this.extractedData}) : super(key: key);

  /// Saves data to Excel and shares it via available apps (Messenger, Gmail, WhatsApp, etc.).
  Future<void> _saveAndShareExcel() async {
    String? filePath = await excelHelper.saveToExcel(extractedData);

    if (filePath != null) {
      //print("Sharing");
      Share.shareFiles(
        [filePath],
        text: "📂 Here's the extracted Excel file from NetmesHelper.",
        mimeTypes: ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"], // Ensures correct file type
      );
    } else {
      debugPrint("❌ Failed to save the Excel file.");
    }
  }

  /// Saves data to CSV and shares it via available apps (Messenger, Gmail, WhatsApp, etc.).
  Future<void> _saveAndShareCsv() async {
    String? filePath = await csvHelper.saveToCsv(extractedData);

    if (filePath != null) {
      //print("Sharing CSV");
      Share.shareFiles(
        [filePath],
        text: "📂 Here's the extracted CSV file from NetmesHelper.",
        mimeTypes: ["text/csv"], // Correct MIME type for CSV
      );
    } else {
      debugPrint("❌ Failed to save the CSV file.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: (extractedData != null && extractedData!.isNotEmpty)
          ? const CircularNotchedRectangle()
          : null,
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tooltip(
            message: 'Share table as an Excel (.xlsx) file', // Tooltip message
            child: IconButton(
              icon: const Icon(Icons.table_chart),
              onPressed: _saveAndShareExcel, // Call saveToExcel with extractedData
            ),
          ),
          const SizedBox(width: 48),
          // Add the version number in the center of the BottomAppBar
          Center(
            child: Text(
              'v1.0.0', // The version number
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 48),
          Tooltip(
            message: 'Share table as a CSV file', // Tooltip message
            child: IconButton(
              icon: const Icon(Icons.insert_drive_file),
              onPressed: _saveAndShareCsv, // Call saveToCsv with extractedData
            ),
          )
        ],
      ),
    );
  }
}
