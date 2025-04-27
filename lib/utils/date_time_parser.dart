import 'package:intl/intl.dart';

String? parseDate(String text) {
  RegExp dateRegex = RegExp(r"\b([A-Za-z]{3}),\s(\d{1,2})/(\d{1,2})/(\d{4})\b");
  Match? match = dateRegex.firstMatch(text);

  if (match != null) {
    return _formatDate(match);
  }

  String? strDate = findDate(text) ?? "??";
  RegExp dateRegex2 = RegExp(r"\b([A-Za-z]{3}),(\d{1,2})/(\d{1,2})/(\d{4})\b");

  if (strDate != null) {
    match = dateRegex2.firstMatch(strDate.replaceAll(RegExp(r'\s+'), ''));
    if (match != null) return _formatDate(match);
  }
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
  return "??";
}

String? parseTime2(String text) {
  RegExp timeRegex = RegExp(r"(\d{1,2}):(\d{2}):\d{2}\s(AM|PM)");
  Match? match = timeRegex.firstMatch(text);

  if (match != null) {
    int hour = int.parse(match.group(1)!);
    String minute = match.group(2)!;
    String ampm = match.group(3)!;

    return "${hour.toString().padLeft(2, '0')}:$minute $ampm"; // HH:MM AM/PM format
  }

  //print("❌ Time not found in: $text");
  return "??";
}

String? parseDate2(String text) {
  RegExp dateRegex = RegExp(r"\b([A-Za-z]{3}),\s(\d{1,2})/(\d{1,2})/(\d{4})\b"); // date with s after Day,
  Match? match = dateRegex.firstMatch(text);

  if (match != null) {
    String month = match.group(2)!;
    String day = match.group(3)!;
    String year = match.group(4)!;
    return "$month/$day/$year"; // YYYY-MM-DD format
  }

  RegExp dateRegex2 = RegExp(r"\b([A-Za-z]{3}),(\d{1,2})/(\d{1,2})/(\d{4})\b"); // date with no spaces
  String strDate = findDate(text) ?? "??";
  Match? match2 = dateRegex2.firstMatch(strDate.replaceAll(RegExp(r'\s+'), ''));

  if (match2 != null) {
    String month = match2.group(2)!;
    String day = match2.group(3)!;
    String year = match2.group(4)!;

    // Convert numeric month to short month name (MMM)
    List<String> months = [
      "", "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    int monthIndex = int.parse(month);
    String monthAbbr = months[monthIndex];

    // Format as dd-MMM-yy
    return "$day-$monthAbbr-${year.substring(2)}";
    //return "$month/$day/$year"; // YYYY-MM-DD format
  }

  return "??";
}

String? parseDate3(String text) { // output format // YYYY-MM-DD format
  RegExp dateRegex = RegExp(r"\b([A-Za-z]{3}),\s(\d{1,2})/(\d{1,2})/(\d{4})\b"); // date with s after Day,
  Match? match = dateRegex.firstMatch(text);

  if (match != null) {
    String month = match.group(2)!;
    String day = match.group(3)!;
    String year = match.group(4)!;
    return "$month/$day/$year"; // YYYY-MM-DD format
  }

  RegExp dateRegex2 = RegExp(r"\b([A-Za-z]{3}),(\d{1,2})/(\d{1,2})/(\d{4})\b"); // date with no spaces
  String strDate = findDate(text) ?? "??";
  Match? match2 = dateRegex2.firstMatch(strDate.replaceAll(RegExp(r'\s+'), ''));

  if (match2 != null) {
    String month = match2.group(2)!;
    String day = match2.group(3)!;
    String year = match2.group(4)!;

    return "$month/$day/$year"; // YYYY-MM-DD format
  }

  return "??";
}

String? extractDateTimestamp(String text) {
  // print("text : $text");
  String setDate = parseDate3(text) ?? "";
  String setTime = parseTime(text) ?? "";

  if (setDate  == null && setTime == null) {
    // print("❌ Timestamp not found in: $text");
    return null; // No match found
  }

  return "$setDate $setTime";
}

String? findDate(String text ){
  // Convert text to uppercase
  String upperText = text.toUpperCase();

  // Find the position of ":"
  int index = upperText.indexOf(":");

  if (index != -1) {
    // Extract everything before ":"
    String beforeColon = upperText.substring(0, index).trim();
    // Find the last space index before :
    int lastSpaceIndex = beforeColon.lastIndexOf(' ');

    return lastSpaceIndex != -1 ? beforeColon.substring(0, lastSpaceIndex).trim() : null;
  }
  return null;
}

String? _formatDate(Match match) {
  int monthNum = int.parse(match.group(2)!);
  String day = match.group(3)!.padLeft(2, '0');

  List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];

  return "${months[monthNum - 1]}-$day"; // MMM-dd format
}

String formatTimestamp(String timestamp) {
  try {
    final inputFormat = DateFormat('yyyy-MM-dd hh:mm a'); // "2025-04-19 04:43 PM"
    final outputFormat = DateFormat('MMM-dd hh:mm'); // "Apr-19 04:43"

    final dateTime = inputFormat.parse(timestamp);
    return outputFormat.format(dateTime);
  } catch (e) {
    return timestamp; // fallback if parsing fails
  }
}

bool isLeapYear(int year) {
  // A year is a leap year if it's divisible by 4, but not by 100, except if it's divisible by 400.
  return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
}

int isValidMonth(String? monthStr) {
  if (monthStr != null) {
    final month = int.tryParse(monthStr);

    if (month != null && month <= 12) {
      print('Valid month: $monthStr');
      return month; // Valid month
    } else {
      print('Invalid or out-of-range month: $monthStr');
      return -1;
    }
  }
  return -1; // Invalid or null month
}

int? getValidDay(String? dayStr, int month, int year) {
  if (dayStr != null) {
    final day = int.tryParse(dayStr);

    if (day != null) {
      // List of days per month (index 0 = January, index 1 = February, ..., index 11 = December)
      List<int> daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

      // Adjust for leap year
      if (isLeapYear(year) && month == 2) {
        daysInMonth[1] = 29; // February gets 29 days in a leap year
      }

      if (day >= 1 && day <= daysInMonth[month - 1]) {
        print('Valid day: $dayStr');
        return day;
      } else {
        print('Invalid or out-of-range day: $dayStr');
      }
    }
  }
  return null; // Return null for invalid or null day
}