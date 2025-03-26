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
        // print(placemarks);
        // print(placemarks);
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

  static String getNTCCodeFromRegion(Map<String, String> addressDetails) {
    String? region = addressDetails["region"] ?? "??";
    String? province = addressDetails["state"] ?? "??";

    // Mapping regions to NTC codes (all capitalized)
    Map<String, String> regionToNTC = {
      'ILOCOS REGION': 'NTC 1',
      'CAGAYAN VALLEY': 'NTC 2',
      'CENTRAL LUZON': 'NTC 3',
      'CALABARZON': 'NTC 4',
      'MIMAROPA': 'NTC 4-B',
      'BICOL': 'NTC 5',
      'BICOL REGION': 'NTC 5',
      'WESTERN VISAYAS': 'NTC 6',
      'CENTRAL VISAYAS': 'NTC 7',
      'EASTERN VISAYAS': 'NTC 8',
      'ZAMBOANGA PENINSULA': 'NTC 9',
      'NORTHERN MINDANAO': 'NTC 10',
      'DAVAO REGION': 'NTC 11',
      'REGION XII': 'NTC 12',
      'CARAGA': 'NTC 13',
      'NATIONAL CAPITAL REGION': 'NTC NCR',
      'METRO MANILA': 'NTC NCR',
      'BANGSAMORO AUTONOMOUS REGION IN MUSLIM MINDANAO': 'NTC BARMM',
      'CORDILLERA ADMINISTRATIVE REGION': 'NTC CAR',
      'BANGSAMORO': 'NTC BARMM',
    };

    // Capitalize the first letter of each word in the region input string
    String regionUpperCase = region.toUpperCase();
    // check first for NCR
    if(province.toUpperCase() == "METRO MANILA"){
      return "NTC NCR";
    }
    // Check if the region exists in the map and return the corresponding NTC code
    else if (regionToNTC.containsKey(regionUpperCase)) {
      return regionToNTC[regionUpperCase]!;
    } else {
      // Return a default message if region is not found
      return 'NTC CODE NOT FOUND';
    }
  }

  static String convertToRoman(String  ntcCode) {
    String numericPart = ntcCode.split(" ")[1]; // Extract the number after "NTC"
    if (numericPart.length < 1) return ntcCode; // Return original if no number

    int? number = int.parse(numericPart);
    if (number == null || number <= 0) return ntcCode; // Return original if invalid

    List<MapEntry<int, String>> romanMap = [
      MapEntry(10, "X"),
      MapEntry(9, "IX"),
      MapEntry(8, "VIII"),
      MapEntry(7, "VII"),
      MapEntry(6, "VI"),
      MapEntry(5, "V"),
      MapEntry(4, "IV"),
      MapEntry(3, "III"),
      MapEntry(2, "II"),
      MapEntry(1, "I")
    ];

    String result = "";
    int safeNumber = number; // Ensure number is non-null

    for (var entry in romanMap) {
      while (safeNumber >= entry.key) {
        result += entry.value;
        safeNumber -= entry.key;
      }
    }
    return result;
  }
 }