String? parseDate(String text) {
  RegExp dateRegex = RegExp(r"\b([A-Za-z]{3}),\s(\d{1,2})/(\d{1,2})/(\d{4})\b");
  Match? match = dateRegex.firstMatch(text);

  if (match != null) {
   // String month = match.group(2)!;
   // String day = match.group(3)!;
   // String year = match.group(4)!;
   // return "$year-$month-$day"; // YYYY-MM-DD format
    int monthNum = int.parse(match.group(2)!); // Convert month to int
    String day = match.group(3)!.padLeft(2, '0'); // Ensure two-digit day

    // Convert numeric month to abbreviated text format
    List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    String month = months[monthNum - 1]; // Get the month name

    return "$month-$day"; // Format: MMM-dd
  }

  // print("❌ Date not found in: $text");
  return "unknown Date";
}

String? parseTime(String text) {
  RegExp timeRegex = RegExp(r"(\d{1,2}):(\d{2}):\d{2}\s(AM|PM)");
  Match? match = timeRegex.firstMatch(text);

  if (match != null) {
    int hour = int.parse(match.group(1)!);
    String minute = match.group(2)!;
    String ampm = match.group(3)!;

    if (ampm == "PM" && hour != 12) hour += 12;
    if (ampm == "AM" && hour == 12) hour = 0;

    return "${hour.toString().padLeft(2, '0')}:$minute"; // HH:MM format
  }

  //print("❌ Time not found in: $text");
  return "unknown Time";
}


String? parseDate2(String text) {
  RegExp dateRegex = RegExp(r"\b([A-Za-z]{3}),\s(\d{1,2})/(\d{1,2})/(\d{4})\b");
  Match? match = dateRegex.firstMatch(text);

  if (match != null) {
    String month = match.group(2)!;
    String day = match.group(3)!;
    String year = match.group(4)!;
    return "$month/$day/$year"; // YYYY-MM-DD format
  }

  // print("❌ Date not found in: $text");
  return "unknown Date";
}

String? extractDateTimestamp(String text) {
  // print("text : $text");
  String setDate = parseDate2(text) ?? "";
  String setTime = parseTime(text) ?? "";

  if (setDate  == null && setTime == null) {
    // print("❌ Timestamp not found in: $text");
    return null; // No match found
  }

  return "$setDate $setTime";
}
