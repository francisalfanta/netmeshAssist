import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Google_GeocodingService {
  String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ??
      ""; // Replace with your actual API key

  Future<Map<String, String>> getAddressFromLatLng(double lat,
      double lng) async {
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey";

    Map<String, String> formattedData = {
      "formatted": "", // Full address
      "suburb": "",
      "city": "",
      "region": "",
      "province": "",
    };

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data["results"] != null && data["results"].isNotEmpty) {
          for (var result in data["results"]) { // Loop through all results
            List<dynamic> addressComponents = result["address_components"] ??
                [];

            for (var component in addressComponents) {
              List<String> types = List<String>.from(component["types"] ?? []);

              if (types.contains("sublocality_level_2")) {
                print("Sublocality Level 2: ${component["long_name"]}");
                formattedData["suburb"] = component["short_name"] ?? "";

                // Fill the formattedData based on this result group
                formattedData["suburb"] = component["long_name"] ?? "Unknown";
                formattedData["formatted"] =
                    result["formatted_address"] ?? "Unknown";

                for (var comp in addressComponents) {
                  List<String> compTypes = List<String>.from(
                      comp["types"] ?? []);

                  if (compTypes.contains("locality")) {
                    formattedData["city"] = comp["long_name"] ?? "Unknown";
                  } else
                  if (compTypes.contains("administrative_area_level_2")) {
                    formattedData["province"] = comp["long_name"] ?? "Unknown";
                  } else
                  if (compTypes.contains("administrative_area_level_1")) {
                    formattedData["region"] = comp["long_name"] ?? "Unknown";
                  }
                }

                return formattedData; // Stop searching once found
              }
            }
          }
        }
      } else {
        //print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      //print("Exception: $e");
    }
    return {
      "formatted": "", // Full address
      "suburb": "",
      "city": "",
      "region": "",
      "state": "",
    };
  }
}