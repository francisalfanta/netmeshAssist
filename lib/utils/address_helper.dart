import 'package:geocoding/geocoding.dart';

class AddressHelper {
  static Future<Map<String, String>> getAddressDetails(double latitude, double longitude) async {
    try {
      // Call the geocoding API once to get the address components
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      // Initialize variables
      String region = "Province not found";
      String province = "Province not found";
      String locality = "Locality not found";
      String subLocality = "Sub Locality not found";

      // If placemarks are not empty, assign the values from the first placemark
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        region = place.administrativeArea ?? "??";
        province = place.subAdministrativeArea ?? "??";
        locality = place.locality ?? "??";
        subLocality = place.subLocality ?? "??";
      }

      // Return the address components as a map
      return {
        'region': region,
        'province': province,
        'locality': locality,
        'subLocality': subLocality,
      };
    } catch (e) {
      //print("Error retrieving address: $e");
      return {
        'region': "Error retrieving address",
        'province': "Error retrieving address",
        'locality': "Error retrieving address",
        'subLocality': "Error retrieving address",
      };
    }
  }

  static String getNTCCodeFromRegion(String region) {
    // Mapping regions to NTC codes (all capitalized)
    Map<String, String> regionToNTC = {
      'ILOCOS': 'NTC 1',
      'CAGAYAN VALLEY': 'NTC 2',
      'CENTRAL LUZON': 'NTC 3',
      'CALABARZON': 'NTC 4',
      'MIMAROPA': 'NTC 4-B',
      'BICOL': 'NTC 5',
      'WESTERN VISAYAS': 'NTC 6',
      'CENTRAL VISAYAS': 'NTC 7',
      'EASTERN VISAYAS': 'NTC 8',
      'ZAMBOANGA PENINSULA': 'NTC 9',
      'NORTHERN MINDANAO': 'NTC 10',
      'DAVAO': 'NTC 11',
      'SOCCSKSARGEN': 'NTC 12',
      'CARAGA': 'NTC 13',
      'NATIONAL CAPITAL REGION': 'NTC NCR',
      'ARMM': 'NTC ARMM',
      'CORDILLERA ADMINISTRATIVE': 'NTC CAR',
    };

    // Capitalize the first letter of each word in the region input string
    String regionUpperCase = region.toUpperCase();

    // Check if the region exists in the map and return the corresponding NTC code
    if (regionToNTC.containsKey(regionUpperCase)) {
      return regionToNTC[regionUpperCase]!;
    } else {
      // Return a default message if region is not found
      return 'NTC CODE NOT FOUND';
    }
  }
}
