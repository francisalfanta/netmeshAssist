import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'text_parser.dart';  // ✅ Ensure you import the text parsing function
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';

class ImageTextExtractor {
  final ImagePicker _picker = ImagePicker();

  Future<List<Map<String, dynamic>?>> extractTextFromPickedImage() async {
    //final List<XFile> images = await _picker.pickMultiImage();
    //if (images.isEmpty) return [];

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Only allow images
      allowMultiple: true,  // Enable multiple selection
    );

    if (result == null) return []; // If the user cancels
    List<File> images = result.paths.map((path) => File(path!)).toList();

    List<Map<String, dynamic>> extractedData = [];

    for (File image in images) {
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
    File processedImage = await _handleJfifFile(imageFile); // ✅ Handle .jfif conversion

    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    //final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    try {
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      //print('recognizedText $recognizedText.text');

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

  Future<File> _handleJfifFile(File imageFile) async {
    String filePath = imageFile.path;

    if (filePath.toLowerCase().endsWith('.jfif')) {
      // ✅ Convert .jfif to .jpg using the image package
     return imageFile;
    }

    return imageFile; // Return original file if no conversion is needed
  }

}
