import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:netmeshelperv2/utils/image_text_extractor.dart';
import 'package:netmeshelperv2/utils/excel_helper.dart';
import 'package:netmeshelperv2/utils/csv_helper.dart';
import 'package:netmeshelperv2/utils/date_time_parser.dart'; // Import helper functions
import 'package:netmeshelperv2/utils/text_parser.dart';  // ✅ Import the file
import 'package:netmeshelperv2/utils/signal_helper.dart';  // ✅ Import the file
import 'package:netmeshelperv2/utils/address_helper.dart';  // ✅ Import the file

import 'package:netmeshelperv2/widgets/app_bar_widget.dart';
import 'package:netmeshelperv2/widgets/bottom_navigation.dart';
import 'package:netmeshelperv2/widgets/floating_action_button.dart';
import 'package:netmeshelperv2/widgets/speed_test_header.dart';
import 'package:netmeshelperv2/widgets/speed_test_list.dart';


void main() {
  runApp(const MaterialApp(home: NetmesHelperApp()));
}

class NetmesHelperApp extends StatefulWidget {
  const NetmesHelperApp({super.key});

  @override
  _NetmesHelperAppState createState() => _NetmesHelperAppState();
}

class _NetmesHelperAppState extends State<NetmesHelperApp> {
  final ImageTextExtractor imageTextExtractor = ImageTextExtractor();
  final ExcelHelper excelHelper = ExcelHelper();
  // Sample data from CSV/XLSX
  List<Map<String, dynamic>> speedTestData = []; // ✅ Initialize as an empty list
  List<Map<String, dynamic>> TobeSharedData = []; // ✅ Initialize as an empty list
  List<Map<String, dynamic>> extractedData = []; // Initialize with an empty list
  String extractedText = "Choose a screenshot from the History Results in NetMesh Speedtest to extract text.";
  String processedText = "";
  String failedProcessedText = "";

  // Track the loading state
  bool isLoading = false;

  Future<void> pickImage() async {
    setState(() {
      isLoading = true;  // Show loading spinner when the image extraction starts
    });

    final extracted  = await imageTextExtractor.extractTextFromPickedImage();
    if (extracted == null || extracted.isEmpty) {
      setState(() {
        isLoading = false; // Hide the loading spinner if there's no extracted data
      });

      return; // Early exit if no data is available
    }
    // print(extracted );

    setState(() {
      // ✅ Remove null values before assigning
      extractedData = extracted.where((item) => item != null).cast<Map<String, dynamic>>().toList();
    });

    // Get the total number of images to be processed
    int totalImages = extracted.length;

    // Loop through all extracted maps
    int imagesProcessed = 0;  // Counter for images processed
    int imagesFailedProcessed = 0; // Counter for failed images processed

    // Convert parsed data into the correct format for speedTestData
    // Safely access extractedData using null-aware operators (`?` and `??`)
    // Loop through all extracted maps
    for (var extractedMap in extracted) {
      if (extractedMap == null || extractedMap['error'] != null) {
        // If there's an error in extractedMap, increment the failed images counter and continue
        imagesFailedProcessed++;
        setState(() {
          failedProcessedText = "$imagesFailedProcessed"; // Update the failed processed counter
        });
        continue; // Skip the rest of the loop and move to the next image
      }

      // If no error and the map is not null, increment the imagesProcessed count
      imagesProcessed++;

      // Update extractedText with the current progress (numerator/denominator)
      setState(() {
        processedText = "$imagesProcessed/$totalImages"; // Update the processed text value
        failedProcessedText = "$imagesFailedProcessed"; // Update the failed processed
      });


      // Convert String to double
      double latitude = double.parse(extractedMap["lat"]);
      double longitude = double.parse(extractedMap["lon"]);

      Map<String, String> addressDetails = await AddressHelper.getAddressDetails(latitude, longitude);

      try {
        latitude = double.parse(extractedMap["lat"]);
        longitude = double.parse(extractedMap["lon"]);
      } catch (e) {
        //print("Error converting latitude/longitude: $e");
        latitude = 0.0; // Default value (or handle accordingly)
        longitude = 0.0;
      }

      // Introduce a delay (e.g., 2 seconds)
      await Future.delayed(Duration(seconds: 2));

      // Await must be inside an async function
      extractedMap["region"] = addressDetails['region'] ?? '';
      extractedMap["province"] = addressDetails['province'] ?? '';
      extractedMap["municipality"] = addressDetails['locality'] ?? '';
      extractedMap["barangay"] = addressDetails['subLocality'] ?? '';

      extractedMap["nro"] = await AddressHelper.getNTCCodeFromRegion(extractedMap["region"]);
      //print(extractedMap);

      // Constructing the location by combining the locality (municipality) and subLocality (barangay)
      String location = extractedMap["barangay"] != null && extractedMap["barangay"].isNotEmpty
          ? '${extractedMap["barangay"]}, ${extractedMap["municipality"]}'
          : '${extractedMap["municipality"]}';

      Map<String, dynamic> formattedData = {
        "Location": location.isNotEmpty ? location : "Unknown", // Ensure the location is set correctly
        "Date": extractedMap["date"] ?? "Unknown",
        "Time": extractedMap["time"] ?? "Unknown",
        "PTE": extractedMap["operator"] ?? "Unknown",
        "DL": extractedMap["download"] ?? "0",
        "UL": extractedMap["upload"] ?? "0",
        "Model": extractedMap["phone_model"] ?? "Unknown",
        "Signal Quality": extractedMap["signal_quality"] ?? "??",
        "Ping": extractedMap["ping"] ?? "??",
        "Jitter": extractedMap["jitter"] ?? "??",
        "Network Type": extractedMap["network_type"] ?? "??",
      };
      //print(formattedData);

      // Set the state with the updated formattedData
      setState(() {
        speedTestData.add(formattedData); // Add extracted data to the list
        // Extract email from the first entry (optional)
        //extractedText = (extracted.isNotEmpty && extracted.first != null && extracted.first is Map<String, dynamic>)
        //    ? (extracted.first?["email"] ?? "No email found")
        //    : "No email found";

        // Add only if the extractedData is not already in the list
        for (var item in extractedData) {
          if (!TobeSharedData.contains(item)) {  // ✅ Prevents duplicate entries
            TobeSharedData.add(item);
          }
        }
      });
    }

    setState(() {
      isLoading = false;  // Hide the loading spinner when the operation is complete
    });

    // Save extracted text to Excel
    // excelHelper.saveToExcel(extractedText);
  }

  void _showModal(BuildContext context, String title, String content) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) =>
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(content, style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close", style: TextStyle(fontSize: 16)),
                  ),
                )
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(showModal: _showModal),

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const SpeedTestHeader(),
            const SizedBox(height: 4),
            SpeedTestList(speedTestData: speedTestData, getSignalColor: getSignalColor, isLoading: isLoading),  // Pass the isLoading value here),
            const SizedBox(height: 10),
            // Show extractedText at the bottom-right only when loading
            if (isLoading)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(  // Use Column to arrange the text vertically
                    crossAxisAlignment: CrossAxisAlignment.end,  // Align text to the right
                    children: [
                      Text(
                        processedText,
                        style: const TextStyle(fontSize: 10),
                      ),
                      SizedBox(height: 4),  // Add some space between the texts
                      Text(
                        failedProcessedText,  // Second line showing failedProcessedText
                        style: const TextStyle(fontSize: 10, color: Colors.red),  // Style for failed text
                      ),
                    ],
                  ),
                ),
              ),

            // If loading, show the loading spinner
            if (isLoading)
              Center(
                child: CircularProgressIndicator(), // Show loading spinner
              ),
            // If not loading, show the extracted text or other content
            if (!isLoading)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    extractedText,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            const SizedBox(height: 40),
          ], // children
        ), // Column
      ), // padding
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigation(
        extractedData: TobeSharedData, // ✅ Pass extracted data
      ),

      // Floating Action Button for Upload Image
      floatingActionButton: FloatingUploadButton(onUpload: pickImage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
