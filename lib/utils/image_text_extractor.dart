import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'text_parser.dart';  // ✅ Ensure you import the text parsing function
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';

class ImageTextExtractor {
  final ImagePicker _picker = ImagePicker();

  Future<List<Map<String, dynamic>?>> extractTextFromPickedImage({
    List<Map<String, dynamic>>? existingExtractedData,
}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Only allow images
      allowMultiple: true,  // Enable multiple selection
    );

    if (result == null) return []; // If the user cancels
    List<File> images = result.paths.map((path) => File(path!)).toList();

    List<Map<String, dynamic>> extractedData = [];

    for (File image in images) {
      List<Map<String, dynamic>> result = await _extractTextFromImage(File(image.path));
      //List<Future<List<Map<String, dynamic>>>> futures = images.map((image) => _extractTextFromImage(image)).toList();
      //List<List<Map<String, dynamic>>> results = await Future.wait(futures);

      // Check if the result contains an error message
      if (result.isNotEmpty && result[0]['error'] != null) {
        // Add a row indicating an error was encountered for this image
        extractedData.add({'error': 'Error processing this image'}); // Row with error message
      } else {
        //print('existingData : ${existingExtractedData}');
        Map<String, dynamic> newEntry = result[0];

        int existingIndex = _findMatchingIndex(extractedData, newEntry);
        //print('existingIndex : $existingIndex');

        if (existingIndex != -1) {
          print('existingIndex != -1 updating : ${newEntry}');
          // ✅ Matching pingSet found, update only specific fields
          extractedData[existingIndex]['operator'] = newEntry['operator'] ?? extractedData[existingIndex]['operator'];
          extractedData[existingIndex]['phone_model'] = newEntry['phone_model'] ?? extractedData[existingIndex]['phone_model'];
          extractedData[existingIndex]['lat'] = newEntry['lat'] ?? extractedData[existingIndex]['lat'];
          extractedData[existingIndex]['lon'] = newEntry['lon'] ?? extractedData[existingIndex]['lon'];
          extractedData[existingIndex]['network_type'] = newEntry['network_type'] ?? extractedData[existingIndex]['network_type'];
          extractedData[existingIndex]['ping'] = newEntry['pingSet']['idle']['avg'] ?? ''; // to know which record is updated
        } else if (existingIndex == -1 && existingExtractedData != null && existingExtractedData.length > 0) {
          // existingIndex == -1 means not related to page 1
          //print('checking existingExtractedData');
          existingIndex = _findMatchingIndex(existingExtractedData, newEntry);

          if (existingIndex != -1) {
            //print('old updating : ${existingExtractedData[existingIndex]}');
            //print('new updating : ${newEntry}');
            // ✅ Matching pingSet found, update only specific fields
            existingExtractedData[existingIndex]['operator'] = newEntry['operator'] ?? existingExtractedData[existingIndex]['operator'];
            existingExtractedData[existingIndex]['phone_model'] = newEntry['phone_model'] ?? existingExtractedData[existingIndex]['phone_model'];
            existingExtractedData[existingIndex]['lat'] = newEntry['lat'] ?? existingExtractedData[existingIndex]['lat'];
            existingExtractedData[existingIndex]['lon'] = newEntry['lon'] ?? existingExtractedData[existingIndex]['lon'];
            existingExtractedData[existingIndex]['network_type'] = newEntry['network_type'] ?? existingExtractedData[existingIndex]['network_type'];
            existingExtractedData[existingIndex]['nro'] = 'updated'; // to know which record is updated
            existingExtractedData[existingIndex]['ping'] = newEntry['pingSet']['idle']['avg'] ?? ''; // to know which record is updated
            // add to be shown
            extractedData.add(existingExtractedData[existingIndex]);
          } else {
            extractedData.add(newEntry); // simulatenous upload of page 1 & 2.
          }
        }  else {
          // ✅ No matching pingSet, add normally
          extractedData.add(newEntry);
        }
      }
    }
    //print('extractedData : $extractedData');
    return extractedData;
  }

  Future<List<Map<String, dynamic>>> _extractTextFromImage(File imageFile) async {
    File processedImage = await _handleJfifFile(imageFile); // ✅ Handle .jfif conversion

    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    //final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      //print('recognizedText $recognizedText.text');

      final parsedData = parseExtractedText(recognizedText.text);

      // Check if any of the desired keys are present
      bool hasPhoneInfo = parsedData.containsKey('mmc') ||
          parsedData.containsKey('tac') ||
          parsedData.containsKey('phone_model') ||
          parsedData.containsKey('operator') ||
          parsedData.containsKey('network_type');

      // If not, fall back to Ookla-specific parser
      final finalParsedData = hasPhoneInfo ? parsedData : parseExtractedTextFromOokla(recognizedText.text);

      // Check if parsed data contains an error message
      if (finalParsedData.containsKey('error')) {
        // Return the error message in the list
        return [{'error': finalParsedData['error']}];
      }
      // ✅ Ensure parsed data is valid and return it as a list
      return finalParsedData.isNotEmpty ? [finalParsedData] : [];
    } finally {
      textRecognizer.close(); // ✅ Always close recognizer
    }
  }

  Future<File> _handleJfifFile(File imageFile) async {
    String filePath = imageFile.path;

    if (filePath.toLowerCase().endsWith('.jfif')) {
      // ✅ Convert .jfif to .jpg using the image package
     return imageFile;
    }

    return imageFile; // Return original file if no conversion is needed
  }

  // Helper function to deeply compare two pingSet maps based on value similarity
  bool _isSamePingSet(Map<String, dynamic> a, Map<String, dynamic> b) {
    //print('_isSamePingSet a: $a');
    //print('_isSamePingSet b: $b');

    int totalFields = 0;
    int matchedFields = 0;

    for (String key in ['idle', 'download', 'upload']) {
      if (!a.containsKey(key) || !b.containsKey(key)) continue;

      Map<String, dynamic> aSub = Map<String, dynamic>.from(a[key]);
      Map<String, dynamic> bSub = Map<String, dynamic>.from(b[key]);
      //print('aSub : ${aSub}');
      //print('bSub : ${aSub}');

      for (String subKey in ['avg', 'low', 'high', 'jitter']) {
        totalFields++;
        //print('aSub ${subKey}: ${aSub[subKey].toString().replaceAll('-', '')}');
        //print('bSub ${subKey}: ${bSub[subKey].toString().replaceAll('-', '')}');

        final aValStr = aSub[subKey].toString().replaceAll('-', '').replaceAll(' ', '');
        final bValStr = bSub[subKey].toString().replaceAll('-', '').replaceAll(' ', '');
        // if both null count as 1
        if (aValStr == null && bValStr == null || aValStr == '' && bValStr == '') {
          matchedFields++;
        }

        final aVal = double.tryParse(aValStr);
        final bVal = double.tryParse(bValStr);

        if (aVal != null && bVal != null && aVal == bVal) {
          matchedFields++;
        }
      }
    }

    if (totalFields == 0) return false;

    double matchRatio = matchedFields / totalFields;
    //print('matchRadio : $matchRatio');
    return matchRatio > 0.7;
  }

  int _findMatchingIndex(List<Map<String, dynamic>> dataList, Map<String, dynamic> newEntry) {
    for (int i = 0; i < dataList.length; i++) {
      var existingEntry = dataList[i];

      if (existingEntry['pingSet'] != null && newEntry['pingSet'] != null) {
        print('isSamePingSet : ${_isSamePingSet(existingEntry['pingSet'], newEntry['pingSet'])}');

        if (_isSamePingSet(existingEntry['pingSet'], newEntry['pingSet'])) {
          return i;
        }
      }
    }
    return -1;
  }
}