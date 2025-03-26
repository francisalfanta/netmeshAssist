import 'date_time_parser.dart'; // Import helper functions
import 'package:netmeshAssist/utils/provider_helper.dart';

Map<String, String> parseExtractedText(String text) {
  Map<String, String> data = {};
  List<String> lines = text.split("\n").map((line) => line.trim()).toList();
  //print(lines);

  // List of possible date prefixes
  List<String> daysOfWeek = ["Mon,", "Tue,", "Wed,", "Thu,", "Fri,", "Sat,", "Sun,"];

  bool hasValidEmail(String line) {
    String potentialEmail = line.replaceAll(" ", ""); // Remove spaces within the email

    RegExp emailRegex = RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");

    return emailRegex.hasMatch(potentialEmail);
  }

  // ✅ Regular expression to match date & time format
  RegExp dateTimeRegex = RegExp(r"\b[A-Za-z]{3},?\s?\d{1,2}/\d{1,2}/\d{4}\s\d{1,2}:\d{2}:\d{2}\s[APap][Mm]\b");

  void extractValue(String line, String keyword, String key) {
    if (line.contains(keyword)) {

      String valuePart = line.split(":")[1].trim();

      // Handle special case for "Signal Quality" (extract both dBm value and quality)
      if (key == "signal_quality") {
        List<String> parts = valuePart.split("|");
        if (parts.length == 2) {
          data["signal_strength"] = parts[0].trim(); // Extract `-102 dBm`
          data["signal_quality"] = parts[1].trim();  // Extract `Very Weak`
        } else {
          data[key] = valuePart.split(" ")[0]; // Default behavior
        }
      } else if (key == "mcc") {
        // Special handling for MCC/MNC
        String cleanValue = valuePart.replaceAll(
            RegExp(r'\s+'), ''); // Remove spaces
        if (cleanValue.length >= 5) {
          data["mcc"] =
              cleanValue.substring(0, 3); // Extract first 3 characters as MCC
          data["mnc"] =
              cleanValue.substring(3); // Extract last 2 characters as MNC
        } else {
          //print("❌ Invalid MCC/MNC format: $cleanValue");
        }
      } else if (key =="operator") {
        data["operator"] = getProviderName(valuePart);
      }  else {
        data[key] = valuePart.split(" ")[0]; // Default extraction
      }
    }
  }

  String currentGroup = "";
  bool inGroup = false;
  bool foundCompleteGroup = false;

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    //print(line);
    if(!foundCompleteGroup) {
      // ✅ Start collecting when a line contains a date and time
      if (daysOfWeek.any((day) => line.startsWith(day)) && !inGroup) {
        inGroup = true;
        data.clear(); // Reset data to keep only the latest valid group
        currentGroup = "";
      }

      if (inGroup) {
        currentGroup += "$line "; // Append full block of text
      }

      extractValue(line, "Download:", "download");
      extractValue(line, "Upload:", "upload");
      extractValue(line, "Ping:", "ping");
      extractValue(line, "Jitter:", "jitter");
      extractValue(line, "Provider:", "operator");
      extractValue(line, "Network Type:", "network_type");
      extractValue(line, "Signal Quality:", "signal_quality");
      extractValue(line, "MCC/MNC:", "mcc");
      extractValue(line, "LAC/TAC:", "tac");
      extractValue(line, "lat:", "lat");
      extractValue(line, "lon:", "lon");
      extractValue(line, "phone model:", "phone_model");
      extractValue(line, "Cell ID:", "cell_id");

      // Extract email (signals the end of a group)
      // print( line.replaceAll(" ", ""));
      if (hasValidEmail(line)) {
        data["email"] = line.replaceAll(RegExp(r"\s+"), "");
        inGroup = false; // End group detection

        //print('currentGroup');
        //print(currentGroup.trim());
        // ✅ Extract Date & Time from this valid group
        String? extractedDate = parseDate(currentGroup.trim());
        //print('extractedDate : $extractedDate');
        if (extractedDate != null) {
          data["date"] = extractedDate;
          data["timestamp"] = extractDateTimestamp(currentGroup.trim()) ?? "";
        }

        String? extractedTime = parseTime(currentGroup.trim());
        if (extractedTime != null) {
          data["time"] = extractedTime;
        }

        foundCompleteGroup = true; // Mark as complete
      }
    }
  }
  // If no email is found, notify the user to upload a screenshot
  // Check if data["email"] is null and show a SnackBar notification
  // Return status message or error if email is missing
  if (data["email"] == null) {
    return {
      "error": "❌ No valid email found. Please upload a screenshot from Speedtest History showing the Date at the top and Email below."
    };
  }
  //print(data);
  // print("🟡 Current Group: $currentGroup");
  // print("Signal Quality :  ${data["signal_quality"]}");
  // print("📆 Date Found: ${data["date"]}");
  // print("⏰ Time Found: ${data["time"]}");
  return data;
}