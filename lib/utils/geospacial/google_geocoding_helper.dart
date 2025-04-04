import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Google_GeocodingService {
  String apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ??
      ""; // Replace with your actual API key

  Future<Map<String, String>> getAddressFromLatLng(double lat,
      double lng) async {
    await Future.delayed(Duration(seconds: 2)); // Prevents exceeding quota
    //print('lat : $lat');
    //print('long : $lng');

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
            //print('addressComponents : $addressComponents');
            for (var component in addressComponents) {
              List<String> types = List<String>.from(component["types"] ?? []);
              String longName = component["long_name"] ?? "??";
              String shortName = component["short_name"] ?? "";

              if (types.contains("locality") && formattedData["city"]!.isEmpty) {
                formattedData["city"] = longName;
              }
              if (types.contains("administrative_area_level_2") && formattedData["province"]!.isEmpty) {
                formattedData["province"] = longName;
              }
              if (types.contains("administrative_area_level_1") && formattedData["region"]!.isEmpty) {
                formattedData["region"] = longName;
              }

              if (result.containsKey("formatted_address") && result["formatted_address"] != null) {
                formattedData["formatted"] = result["formatted_address"];
              } else {
                formattedData["formatted"] = "??"; // Default value if key is missing or null
              }

              if (types.contains("sublocality_level_2")) {
                formattedData["suburb"] = shortName;
                formattedData["formatted"] = result["formatted_address"] ?? "??";

                return formattedData; // Stop searching once found
              }
            }

          }
        }
        if (formattedData["suburb"] == null || formattedData["suburb"]!.isEmpty) {
          List<String> parts = [
            formattedData["city"] ?? "",
            formattedData["province"] ?? "",
            formattedData["region"] ?? ""
          ].where((value) => value.isNotEmpty).toList();

          formattedData["formatted"] = parts.isNotEmpty ? parts.join(", ") : "??";
        }

        return formattedData;
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
      "province": "",
    };
  }
}