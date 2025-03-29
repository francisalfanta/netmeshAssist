import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:netmeshAssist/utils/excel_helper.dart'; // Import the ExcelHelper class
import 'package:netmeshAssist/utils/csv_helper.dart'; // Import the ExcelHelper class

class BottomNavigation extends StatelessWidget {
  final List<Map<String, dynamic>> extractedData;
  final ExcelHelper excelHelper = ExcelHelper();
  final CsvHelper csvHelper = CsvHelper();

  BottomNavigation({super.key, required this.extractedData});

  /// Saves data to Excel and shares it via available apps (Messenger, Gmail, WhatsApp, etc.).
  Future<void> _saveAndShareExcel() async {
    String? filePath = await excelHelper.saveToExcel(extractedData);

    if (filePath != null) {
      Share.shareFiles(
        [filePath],
        text: "📂 Here's the extracted Excel file from NetmesHelper.",
        mimeTypes: ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"], // Ensures correct file type
      );
    } else {
      debugPrint("❌ Failed to save the Excel file.");
    }
  }

  Future<void> _saveAndShareMBSVReport() async {
    String? filePath = await excelHelper.saveToExcelMBSVReport(extractedData);

    if (filePath != null) {
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
      shape: (extractedData.isNotEmpty)
          ? const CircularNotchedRectangle()
          : null,
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Tooltip(
            message: 'Share table as an Excel Net Mesh Format (.xlsx) file', // Tooltip message
            child: IconButton(
              icon: const Icon(Icons.table_chart_outlined, color: Colors.green),
              onPressed: _saveAndShareExcel, // Call saveToExcel with extractedData
            ),
          ),
          const SizedBox(width: 48),
          Tooltip(
            message: 'Share MBSV Report  as an Excel (.xlsx) file', // Tooltip message
            child: IconButton(
              icon: const Icon(Icons.text_snippet_outlined, color: Colors.blueAccent),
              onPressed: _saveAndShareMBSVReport, // Call saveToExcel with extractedData
            ),
          ),
          const SizedBox(width: 48),
          // Add the version number in the center of the BottomAppBar
          Center(
            child: Text(
              'v1.0.9', // The version number
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
              icon: const Icon(Icons.insert_drive_file_outlined),
              onPressed: _saveAndShareCsv, // Call saveToCsv with extractedData
            ),
          )
        ],
      ),
    );
  }
}
