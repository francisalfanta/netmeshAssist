import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'text_parser.dart';  // ✅ Ensure you import the text parsing function

class ImageTextExtractor {
  final ImagePicker _picker = ImagePicker();

  Future<List<Map<String, dynamic>?>> extractTextFromPickedImage() async {
    //final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images == null || images.isEmpty) return [];

    List<Map<String, dynamic>> extractedData = [];

    for (XFile image in images) {
      List<Map<String, dynamic>> result = await _extractTextFromImage(File(image.path));

      // Check if the result contains an error message
      if (result.isNotEmpty && result[0]['error'] != null) {
        // Add a row indicating an error was encountered for this image
        extractedData.add({'error': 'Error processing this image'}); // Row with error message
      } else {
        extractedData.addAll(result); // ✅ Append all valid results from each image
      }
    }

    return extractedData;
  }

  Future<List<Map<String, dynamic>>> _extractTextFromImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      final parsedData = parseExtractedText(recognizedText.text);

      // Check if parsed data contains an error message
      if (parsedData.containsKey('error')) {
        // Return the error message in the list
        return [{'error': parsedData['error']}];
      }
      // ✅ Ensure parsed data is valid and return it as a list
      return parsedData.isNotEmpty ? [parsedData] : [];
    } finally {
      textRecognizer.close(); // ✅ Always close recognizer
    }
  }
}
