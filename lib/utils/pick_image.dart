import 'package:flutter/material.dart';
import 'package:netmeshAssist/utils/image_text_extractor.dart';
import 'package:netmeshAssist/utils/address_helper.dart';
import 'package:netmeshAssist/utils/geospacial/google_geocoding_helper.dart';

class PickImageHelper {
  final ImageTextExtractor imageTextExtractor = ImageTextExtractor();
  final Google_GeocodingService google_geocodingService = Google_GeocodingService();

  Future<void> pickImage({
    required Function(List<Map<String, dynamic>>) onSpeedTestData,
    required Function(List<Map<String, dynamic>>) onExtractedData,
    required Function(int, String, int) onProcessingUpdate,
    required Function(bool) onLoading,  // Handles loading state
  }) async {
    onLoading(true);  // Start loading

    final extracted = await imageTextExtractor.extractTextFromPickedImage();

    if (extracted.isEmpty) {
      onLoading(false); // Stop loading if no data is found
      return;
    }

    List<Map<String, dynamic>> speedTestData = [];
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
      extractedMap["province"] = addressDetails['state'] ?? '';
      extractedMap["municipality"] = addressDetails['city'] ?? '';
      extractedMap["barangay"] = addressDetails['suburb'] ?? '';
      extractedMap["nro"] = AddressHelper.getNTCCodeFromRegion(addressDetails);

      String location = extractedMap["barangay"].isNotEmpty
          ? '${extractedMap["barangay"]}, ${extractedMap["municipality"]}'
          : extractedMap["municipality"];

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
      });

      onextractedData.add(extractedMap);
    }
    onSpeedTestData(speedTestData);
    onExtractedData(onextractedData);

    onLoading(false);  // Stop loading after processing
  }
}
