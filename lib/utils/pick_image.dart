import 'package:flutter/material.dart';
import 'package:netmeshAssist/utils/image_text_extractor.dart';
import 'package:netmeshAssist/utils/address_helper.dart';
import 'package:netmeshAssist/utils/geospacial/google_geocoding_helper.dart';
import 'package:intl/intl.dart';

class PickImageHelper {
  final ImageTextExtractor imageTextExtractor = ImageTextExtractor();
  final Google_GeocodingService google_geocodingService = Google_GeocodingService();

  Future<void> pickImage({
    List<Map<String, dynamic>>? preExtractedData, // data that are already shown
    List<Map<String, dynamic>>? preonSpeedTestData, // data that are already shown
    required Function(List<Map<String, dynamic>>) onSpeedTestData,
    required Function(List<Map<String, dynamic>>) onExtractedData,
    required Function(int, String, int) onProcessingUpdate,
    required Function(bool) onLoading,  // Handles loading state
  }) async {
    onLoading(true);  // Start loading
    if (preExtractedData!.isNotEmpty) {
      print('pickImage : ${preExtractedData[0]}');
    } else {
      print('pickImage : No data found');
    }
    final extracted = await imageTextExtractor.extractTextFromPickedImage( existingExtractedData: preExtractedData,);

    if (extracted.isEmpty) {
      onLoading(false); // Stop loading if no data is found
      return;
    }

    List<Map<String, dynamic>> speedTestData = preonSpeedTestData ?? [];
    List<Map<String, dynamic>> onextractedData = [];
    int totalImages = extracted.length;
    int imagesProcessed = 0;
    int imagesFailedProcessed = 0;

    for (var extractedMap in extracted) {
      if (extractedMap == null || extractedMap['error'] != null) {
        imagesFailedProcessed++;
        onProcessingUpdate(totalImages, "$imagesFailedProcessed", imagesProcessed);
        continue;
      }

      imagesProcessed++;
      onProcessingUpdate(totalImages, "$imagesFailedProcessed", imagesProcessed);

      double latitude = double.tryParse(extractedMap["lat"] ?? "0") ?? 0.0;
      double longitude = double.tryParse(extractedMap["lon"] ?? "0") ?? 0.0;

      Map<String, String>? addressDetails = await google_geocodingService.getAddressFromLatLng(latitude, longitude);

      extractedMap["formatted"] = addressDetails['formatted'] ?? '';
      extractedMap["region"] = addressDetails['region'] ?? '';
      extractedMap["province"] = addressDetails['province'] ?? '';
      extractedMap["municipality"] = addressDetails['city'] ?? '';
      extractedMap["barangay"] = addressDetails['suburb'] ?? '';


      String location = extractedMap["barangay"].isNotEmpty
          ? '${extractedMap["barangay"]}, ${extractedMap["municipality"]}'
          : extractedMap["municipality"];

      if(extractedMap["nro"] == 'updated'){ // the record was merge from pre-data
        //print('nro - updated : ${extractedMap}');
        speedTestData.removeWhere((item) {
          //print('item : ${item}');
          //print('extractedMap["pingSet"]["idle"]["avg"]?.toString() : ${(item["Ping"]?.toString() ?? "") == extractedMap["pingSet"]["idle"]["avg"]?.toString()}');
          //print('extractedMap["pingSet"]["idle"]["jitter"]?.toString() : ${(item["Jitter"]?.toString() ?? "") == extractedMap["pingSet"]["idle"]["jitter"]?.toString()}');
          //print('item["Date"]?.toString() ?? "") == (extractedMap["date"]?.toString()) : ${ (item["Date"]?.toString() ?? "") == (extractedMap["date"]?.toString())}');
          //print('(item["Time"]?.toString() ?? "") == (extractedMap["time"]?.toString() ?? "") : ${(item["Time"]?.toString() ?? "") == (extractedMap["time"]?.toString() ?? "")}');
          //print('(item["DL"]?.toString() ?? "") == (extractedMap["download"]?.toString() ?? "") : ${(item["DL"]?.toString() ?? "") == (extractedMap["download"]?.toString() ?? "")}');
          //print('(item["UL"]?.toString() ?? "") == (extractedMap["upload"]?.toString() ?? "") : ${(item["UL"]?.toString() ?? "") == (extractedMap["upload"]?.toString() ?? "")}');
          // First, check the 6 important fields must match
          bool fieldsMatch =
              (item["Date"]?.toString() ?? "") == (extractedMap["date"]?.toString()) &&
              (item["Time"]?.toString() ?? "") == (extractedMap["time"]?.toString() ?? "") &&
              (item["DL"]?.toString() ?? "") == (extractedMap["download"]?.toString() ?? "") &&
              (item["UL"]?.toString() ?? "") == (extractedMap["upload"]?.toString() ?? "") &&
              (item["Ping"]?.toString() ?? "") == (extractedMap["pingSet"]["idle"]["avg"]?.toString() ?? "") &&
              (item["Jitter"]?.toString() ?? "") == (extractedMap["pingSet"]["idle"]["jitter"]?.toString() ?? "");
          //print('!fieldsMatch : ${!fieldsMatch}');
          if (!fieldsMatch) return false;

          // Second, check that all other fields are null, empty, or missing
          for (var key in item.keys) {
            print('key : ${key}');

            if (!["Date", "Time", "DL", "UL", "Ping", "Jitter"].contains(key)) {
              var value = item[key];
              //print('value : $value');
              if (value.toString().trim().replaceAll('Unknown','').replaceAll('??','').length == 0) {
                //print('return true');
                // If any other field is NOT null/empty, don't remove
                return true;
              }
            }
          }
          //print('return false');
          return false; // Okay to remove this item
        });

        //print('speedTestData : ${speedTestData}');
      }

      speedTestData.add({
      "Location": location.isNotEmpty ? location : "Unknown",
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
      "Formatted Address" : extractedMap["formatted"] ?? "??",
      "timestamp": extractedMap["timestamp"] ?? "??",
      "email": extractedMap["email"] ?? "??",
      });

      extractedMap["nro"] = AddressHelper.getNTCCodeFromRegion(addressDetails);

      //print('speedTestDta : $speedTestData');
      //print('extractedMap : $extractedMap');
      //print('extractedMap : $extractedMap');
      onextractedData.add(extractedMap);
    }

    onSpeedTestData(speedTestData);
    onExtractedData(onextractedData);

    onLoading(false);  // Stop loading after processing
  }
}
