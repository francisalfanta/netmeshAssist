import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:netmeshAssist/utils/signal_helper.dart';  // ✅ Import the file
import 'package:netmeshAssist/utils/pick_image.dart';
import 'package:netmeshAssist/modal/_show_modal.dart';

import 'package:netmeshAssist/widgets/app_bar_widget.dart';
import 'package:netmeshAssist/widgets/bottom_navigation.dart';
import 'package:netmeshAssist/widgets/floating_action_button.dart';
import 'package:netmeshAssist/widgets/speed_test_header.dart';
import 'package:netmeshAssist/widgets/speed_test_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async  {
  await dotenv.load();

  runApp(const MaterialApp(home: NetmesHelperApp()));
}

class NetmesHelperApp extends StatefulWidget {
  const NetmesHelperApp({super.key});

  @override
  _NetmesHelperAppState createState() => _NetmesHelperAppState();
}

class _NetmesHelperAppState extends State<NetmesHelperApp> {
  final PickImageHelper pickImageHelper = PickImageHelper();
  final mapEquality = const MapEquality();

  List<Map<String, dynamic>> speedTestData = [];
  List<Map<String, dynamic>> speedTestDataStatic = []; // Static copy of speedTestData before removals
  List<Map<String, dynamic>> onextractedData = [];
  String overallText = "";
  String failedProcessedText = "0";
  bool isLoading = false;
  String notifyUser = "Choose a screenshot from the History Results in NetMesh Speedtest to extract text.";
  int duplicateCount = 0;
  int processed = 0;
  int overall = 0;

  void handlePickImage() {
    overallText = "$processed/$overall";
    duplicateCount = 0;
    processed = 0;
    overall = 0;

    pickImageHelper.pickImage(
      onSpeedTestData: (data){
        setState((){
          //speedTestData = data;
          for (var item in data) {
            bool isDuplicate  = speedTestData.any((existingItem) => mapEquality.equals(existingItem, item));  // ✅ Deep comparison of all key-value pairs

            if (isDuplicate) {
              duplicateCount++; // ✅ Count duplicates
            } else {
              speedTestData.add(item); // ✅ Add unique items
            }
          }

          // ✅ Reset and then update speedTestDataStatic
          speedTestDataStatic.clear(); // Clear previous data
          speedTestDataStatic = List.from(speedTestData); // Assign fresh copy
        });
      },
      onExtractedData: (data) {
        setState(() {
          for (var item in data) {
            bool isDuplicate  = onextractedData.any((existingItem) => mapEquality.equals(existingItem, item));  // ✅ Deep comparison of all key-value pairs

            if (!isDuplicate) {
              onextractedData.add(item); // ✅ Add unique items
            }
          }
        });
      },
      onProcessingUpdate: (overall, failed, processed) {
        setState(() {
          overallText = "$processed/$overall";
          overall = overall;
          failedProcessedText = failed;
          processed = processed;
        });
      },
      onLoading: (loading) {
        if (!loading) {
          //Future.delayed(const Duration(seconds: 2), () {  // ✅ Delay hiding for 2 seconds
            setState(() {
              isLoading = loading;
            });
          //});
        } else {
          setState(() {
            isLoading = loading;
          });
        }
      },
    );
  }

  void _clearData() {
    setState(() {
      speedTestData.clear();
      onextractedData.clear();
      overallText = "";
      failedProcessedText = "0";
      duplicateCount = 0;
      processed = 0;
      overall = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    speedTestDataStatic = List.from(speedTestData);  // ✅ Store a full copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showModal: showModal,
        onClear: _clearData,
        overallText: processed,
        failedProcessedText: failedProcessedText,
        duplicateCount: duplicateCount,
        speedTestDataLength: onextractedData.length, // Pass the length here
      ),

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const SpeedTestHeader(),
            const SizedBox(height: 4),
            //SpeedTestList(speedTestData: speedTestData, getSignalColor: getSignalColor, isLoading: isLoading),  // Pass the isLoading value here),
            SpeedTestList(
              speedTestData: speedTestData,
              getSignalColor: getSignalColor,
              isLoading: isLoading,
              onRemove: (index) {
                setState(() {
                  if (speedTestDataStatic.isEmpty || index >= speedTestDataStatic.length) {
                    print("⚠️ Invalid index or static data is empty!");
                    return;
                  }
                  // ✅ Store the item before removing it
                  final removedItem = speedTestDataStatic![index];

                  /// ✅ Find & remove the corresponding item in `speedTestData`
                  int matchIndex = onextractedData.indexWhere((item) =>
                      item["email"] == removedItem["email"] &&
                      item["timestamp"].toString() == removedItem["timestamp"].toString() &&  // Ensure same type
                      item["phone_model"] == (removedItem["phone_model"] ?? removedItem["Model"])  // Check both keys
                  );

                  // 🚨 Prevent crash if item is not found
                  if (matchIndex != -1) {
                    onextractedData.removeAt(matchIndex);
                  } else {
                    print("⚠️ Item not found in onextractedData. Skipping removal.");
                  }

                  // Show SnackBar with undo option
                  //ScaffoldMessenger.of(context).showSnackBar(
                  //  SnackBar(
                  //    content: Text("Item removed"),
                  //    action: SnackBarAction(
                  //      label: "UNDO",
                  //      onPressed: () {
                  //        setState(() {
                  //          speedTestData.insert(index, removedItem);

                            // ✅ Restore the corresponding item in `onextractedData`
                  //          final extractedItem = {
                  //            "someKey": removedItem["matchingKey"],
                  //            "otherData": "restored data",
                  //          };

                  //          onextractedData.insert(index, removedItem);
                  //        });
                  //      },
                  //    ),
                  //  ),
                  //);
                });
              },
            ),

            const SizedBox(height: 10),
            // Show notifyUser at the bottom-right only when loading
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
                        "Processing : $overallText",
                        style: const TextStyle(fontSize: 10),
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
            if (!isLoading && speedTestData.isEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    notifyUser,
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
        extractedData: onextractedData, // ✅ Pass extracted data
      ),

      // Floating Action Button for Upload Image
      floatingActionButton: FloatingUploadButton(onUpload: handlePickImage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
