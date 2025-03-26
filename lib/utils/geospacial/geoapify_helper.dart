import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeocodingService {
  String apiKey = dotenv.env['GEOAPIFY_API_KEY'] ?? ""; // Replace with your actual API key

  Future<Map<String, dynamic>> getAddressFromLatLng(double lat, double lng) async {
    final String url =
        "https://api.geoapify.com/v1/geocode/reverse?lat=$lat&lon=$lng&format=json&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["results"] != null && data["results"].isNotEmpty) {
          var result = data["results"][0];

          return {
            "formatted": result["formatted"] ?? "",  // Full address
            "suburb": result["suburb"] ?? "",
            "city": result["city"] ?? "Unknown",
            "region": result["region"] ?? "Unknown",
            "state": result["state"] ?? "Unknown",
          };
        }
      } else {
        //print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      //print("Exception: $e");
    }
    return {
      "formatted": "",  // Full address
      "suburb": "",
      "city": "",
      "region": "",
      "state": "",
    };
  }
}
