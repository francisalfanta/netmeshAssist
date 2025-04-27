import 'date_time_parser.dart'; // Import helper functions
import 'package:netmeshAssist/utils/provider_helper.dart';
import 'package:netmeshAssist/models/device_list.dart';
import 'package:intl/intl.dart';

Map<String, String> parseExtractedText(String text) {
  Map<String, String> data = {};
  bool isphonemodelfound = false;
  List<String> lines = text.split("\n").map((line) => line.trim()).toList();
  //print('lines : $lines');
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
    //print('key : $key');
    //print('line.contains(keyword) : ${line.contains(keyword)}');
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
      } else if (key =="phone_model") {
        data["phone_model"] = valuePart.replaceFirst("phone model:", "").trim();
        if(key == "phone_model"){
          isphonemodelfound = true; // end of data
          //print('phone_model: : $isphonemodelfound');
        }
      } else {
        data[key] = valuePart.split(" ")[0]; // Default extraction
      }
    }
  }

  void checkMissingDownloadUpload(List<String> lines, Map<String, String> data, int setStartingIndex) {
    if (!data.containsKey("download") || !data.containsKey("upload")) {
      for (int j = setStartingIndex - 1; j >= 0; j--) {
        String prevLine = lines[j];

        extractValue(prevLine, "Download:", "download");
        extractValue(prevLine, "Upload:", "upload");

        // If both values are found, exit the loop early
        if (data.containsKey("download") && data.containsKey("upload")) {
          break;
        }
      }
    }
  }

  String currentGroup = "";
  bool inGroup = false;            // first group of data to be extracted
  bool foundCompleteGroup = false;
  int setStartingIndex = 0;

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    //print('currentGroup : $currentGroup');
    if(!foundCompleteGroup) {
      // ✅ Start collecting when a line contains a date and time, and no group found
      if (daysOfWeek.any((day) => line.startsWith(day)) && !inGroup) {
        //print('clearing by : daysOfWeek.any((day) => line.startsWith(day)) && inGroup is false');
        inGroup = true;
        data.clear(); // Reset data to keep only the latest valid group
        currentGroup = "";

        // set Starting Date Index
        // looking for UL/DL above starting line
        setStartingIndex = i;
        // reset currentGroup when date and time is found and there's already a group
        // will not reset if isphonemodelfound
      } else if (daysOfWeek.any((day) => line.startsWith(day)) && inGroup && !isphonemodelfound) {
        //print('clearing by : daysOfWeek.any((day) => line.startsWith(day)) && inGroup is true');
        // if there's another date with day, reset data
          data.clear(); // Reset data to keep only the latest valid group
          currentGroup = "";
        // if date and time found with existing group & version but no email
      }else if (daysOfWeek.any((day) => line.startsWith(day)) && inGroup && isphonemodelfound && data["email"] == null) {
        //print('setting inGroup to false since daysOfWeek.any((day) => line.startsWith(day)) && inGroup && isphonemodelfound && data["email"] == null ');
        inGroup = false; // do not accept the current and succeeding line
      }

      if (inGroup) {
        currentGroup += "$line "; // Append full block of text

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
        extractValue(line, "version:", "version");
      }

      // Extract email (signals the end of a group)
      if (hasValidEmail(line) && !inGroup) {  // when the email is ahead than date
        //print('hasValidEmail(line) && !inGroup');
        data.clear(); // Reset data to keep only the latest valid group
        currentGroup = "";
      }
      // print( line.replaceAll(" ", ""));
      if (hasValidEmail(line) && inGroup) {
        //print('hasValidEmail(line) && inGroup');
        data["email"] = line.replaceAll(RegExp(r"\s+"), "");
        inGroup = false; // End group detection

        foundCompleteGroup = true; // Mark as complete
      }
    }
  }
  // If no email is found, notify the user to upload a screenshot
  // Check if data["email"] is null and show a SnackBar notification
  // Return status message or error if email is missing
  //print('is version found : $isphonemodelfound');
  // print('data[email] : ${data['email']}');

  // ✅ Extract Date & Time from this valid group
  String? extractedDate = parseDate(currentGroup.trim());
  String? extractedDate2 = parseDate2(currentGroup.trim());
  //print('extractedDate : $extractedDate');
  if (extractedDate != null && extractedDate2 != null) {
    data["date"] = extractedDate;
    data["date2"] = extractedDate2 ;
    data["timestamp"] = extractDateTimestamp(currentGroup.trim()) ?? "";
  }

  String? extractedTime = parseTime(currentGroup.trim()); // HH:MM
  String? extractedTime2 = parseTime2(currentGroup.trim()); // HH:MM AM/PM
  if (extractedTime != null && extractedTime2 != null) {
    data["time"] = extractedTime;
    data["time2"] = extractedTime2;
  }

  if (data["email"] == null && !isphonemodelfound) { // and no version found
    //print('data["email"] == null && !isphonemodelfound');
    return {
      "error": "❌ No valid email found. Please upload a screenshot from Speedtest History showing the Date at the top and Email below."
    };
  } //else if(data["email"] == null && isphonemodelfound){ // no email found but only version
    //print('phone model found then the data are : $data');
  //}

  // check data contain Download or Upload
  checkMissingDownloadUpload(lines, data, setStartingIndex);
  //print(data);

  return data;
}

Map<String, dynamic> parseExtractedTextFromOokla(String rawText) {
  final lines = rawText.split('\n').map((line) => line.trim()).toList();

  String? safeLine(List<String> lines, int index) {
    return (index >= 0 && index < lines.length) ? lines[index] : null;
  }

  final result = {
    'date': '',
    'date2': '',
    'time': '',
    'time2': '',
    'timestamp': '',
    'testId': '',
    'downloadMbps': '',
    'downloadDataUsedMB': '',
    'uploadMbps': '',
    'uploadDataUsedMB': '',
    'pingSet': {
      'idle': {},
      'download': {},
      'upload': {},
    },
    'packetLoss': '',
    'operator': '',
    'phone_model': '',
    'lat': '',
    'lon': '',
    'network_type': ''
  };

  void checkDeviceInLines(List<String> lines) {
    // Loop through each line in the list of lines and check for device models
    lines.forEach((line) {
      // Convert the line to lowercase for case-insensitive comparison
      String lowerCaseLine = line.toLowerCase().trim();
      //print('lowerCaseLine : $lowerCaseLine');
      // Check if the line exactly matches any device model in deviceLists
      bool foundDevice = deviceLists.any((device) {
        //print('device : ${device.model.toLowerCase().trim()}');
        return lowerCaseLine == device.model.toLowerCase().trim();
      });

      // Check if the line matches any device model in the possibleModels list
      bool foundDevice2 = deviceLists.any((device) {
        // Check if the line matches any model in the possibleModels list
        return device.possibleModels.any((possibleModel) {
          // Compare the lowercased version of both the line and the possible model
          return lowerCaseLine == possibleModel.toLowerCase().trim();
        });
      });

      //if (deviceLists.any((device) => lowerCaseLine.contains(device.model.toLowerCase()))) {
      if (foundDevice || foundDevice2) {
        //print('Device model found in line: $line');
        result['phone_model'] = line.trim();
      }
    });
   // print('phone_model : ${result['phone_model']}');
  }

  // check line for phone model
  checkDeviceInLines(lines);

  // Separate parsing logic for reuse
  DateTime? _parseFixedDate(String rawDate) {
    //final match = RegExp(r'^(\d{1,2})/(\d{1,2})/(\d{2})').firstMatch(rawDate);
    final match = RegExp(r'^(\d{1,2})/(\d{1,2})/(\d{2}),?\s*(\d{1,2}):(\d{2})?').firstMatch(rawDate);

    int yr = -1;
    int mon = -1;
    int day =-1;

    if (match == null) {
      //print('No valid date match');
      return null;
    } else {
      //print('__parseFixedDate match-month : ${match.group(1)}');
      //print('__parseFixedDate match-day : ${match.group(2)}');
      //print('__parseFixedDate match-year : ${match.group(3)}');
      //print('__parseFixedDate match-hour : ${match.group(4)}');
      //print('__parseFixedDate match-min : ${match.group(5)}');

      final grp1 = match.group(1); // Assert that the value is non-null
      final grp2 = match.group(2);
      final grp3 = match.group(3);
      final hour = match.group(4) != null ? int.parse(match.group(4)!) : 0;
      final minute = match.group(5) != null ? int.parse(match.group(5)!) : 0;

      if (grp1 == null || grp2 == null || grp3 == null) {
        //print('Incomplete match');
        return null;
      }
      // which one is month
      int ismonth = isValidMonth(grp1);
      yr = int.tryParse('20$grp3') ?? -1;
      if (ismonth == -1) { // means grp1 is not the month
        ismonth = isValidMonth(grp2);
        if (yr != -1) {
          day = getValidDay(grp1, ismonth, yr) ?? -1;
        }
      } else { // check grp2 if the month
        if (yr != -1) {
          day = getValidDay(grp2, ismonth, yr) ?? -1;
        }
      }
      mon = ismonth;

      //print('Parsed values -> Month: $mon, Day: $day, Year: $yr, Hour : $hour, Minute: $minute');
      try {
        //print('__parseFixedDate DateTime : ${DateTime(yr, mon, day, hour, minute)}');
        return DateTime(yr, mon, day, hour, minute);
      } catch (e) {
        //print('Error parsing date: $e');
        return null;
      }
    }
  }

  DateTime? normalizeRawDate(String rawDate) {
    Match? match;
    print('normalizeRawDate : $rawDate');

    // Step 1: Fix OCR mistakes ONLY if 'h' or '7' or '77' is BETWEEN digits
    // h77 → /17
    match = RegExp(r'(\d)h77(\d)').firstMatch(rawDate);
    if (match != null) {
      // Replace h77 with /17
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)h77(\d{2})'),
            (m) => '${m.group(1)}/17${m.group(2)}',
      );
      // Now check if second slash is missing before last two digits
      //print('After OCR fix (h77 → /17): $rawDate');
      final parts = rawDate.split('/');
      if (parts.length == 2 && parts[1].length > 2) {
        // Example: parts = ['4', '1725']
        final day = parts[1].substring(0, 2);  // 17
        final year = parts[1].substring(2);    // 25
        rawDate = '${parts[0]}/$day/$year';
        //print('After inserting second slash: $rawDate');
      }
      print('After OCR fix h77: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // h7 → /17
    match = RegExp(r'(\d)h7(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)h7(\d)'),
            (m) => '${m.group(1)}/17${m.group(2)}',
      );
      print('After OCR fix h7: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // /77 → /17
    match = RegExp(r'(\d)/77(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)/77(\d)'),
            (m) => '${m.group(1)}/17${m.group(2)}',
      );
      print('After OCR fix /77: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // 77 → /17
    match = RegExp(r'(\d)77(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)77(\d)'),
            (m) => '${m.group(1)}/17${m.group(2)}',
      );
      print('After OCR fix 77: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // h → /1
    match = RegExp(r'(\d)h(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)h(\d)'),
            (m) => '${m.group(1)}/1${m.group(2)}',
      );
      print('After OCR fix h: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // /7 → /1
    match = RegExp(r'(\d)/7(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)/7(\d)'),
            (m) => '${m.group(1)}/1${m.group(2)}',
      );
      print('After OCR fix /7: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // 7 → /1
    match = RegExp(r'(\d)7(\d)').firstMatch(rawDate);
    if (match != null) {
      rawDate = rawDate.replaceAllMapped(
        RegExp(r'(\d)7(\d)'),
            (m) => '${m.group(1)}/1${m.group(2)}',
      );
      print('After OCR fix 7: $rawDate');
      return _parseFixedDate(rawDate);
    }

    // No fix triggered, try parsing raw as-is
    return _parseFixedDate(rawDate);
  }

  int phase = 0; // 0 = idle, 1 = download, 2 = upload

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i];
    //print('line : $line');

    // Time
    final timeMatch = RegExp(r'\b\d{1,2}:\d{2}\s*(AM|PM)\b', caseSensitive: false).firstMatch(line);
    //print('timeMatch : $timeMatch');

    if (timeMatch != null) {
      final timeString = timeMatch.group(0)!.toUpperCase().trim();
      //print('⏰ Extracted time string: "$timeString"');

      DateTime? parsed24;
      DateTime? parsed12;

      try {
        parsed24 = DateFormat('HH:mm').parseStrict(timeString);
        result['time'] = DateFormat('HH:mm').format(parsed24); // ✅ string
      } catch (_) {
        //print('Invalid HH:mm format');
      }

      try {
        parsed12 = DateFormat('hh:mm a').parseStrict(timeString);
        result['time2'] = DateFormat('hh:mm a').format(parsed12); // ✅ string

        if (parsed24 == null) {
          result['time'] = DateFormat('HH:mm').format(parsed12);
        }
      } catch (_) {
        //print('Invalid hh:mm a format');
      }
    }

    // Date
    //final rawDateMatch = RegExp(r'\b\d{1,2}h\d{1,2}/\d{2}\b').firstMatch(line);
    final rawDateMatch = RegExp(r'\b\d{1,2}[h7]?\d{1,2}/\d{2}\b').firstMatch(line);
    final rawDateMatch2 = RegExp(r'\b\d[h7]?\d{2}\d{2}\b').firstMatch(line);
    final rawDateMatch3 = RegExp(r'\b\d{1,2}[/h7]?\d{2}[/h7]?\d{2}\b').firstMatch(line); // to look for value 4/77/25

    //print('rawDateMatch2 : $rawDateMatch2');
    if (rawDateMatch != null || rawDateMatch2 != null || rawDateMatch3 != null ) {
      //print('normalizeRawData : ${normalizeRawDate(line)}');
      // Attempt to parse the normalized rawDate
      final parsedDate = normalizeRawDate(line);

      //print('interior-loop-parsedDate : $parsedDate');
      //print('result["timestamp"] : ${result["timestamp"]}');
      if (parsedDate != null) {
        //print('✅ Parsed date: $parsedDate');
        final formattedDate = "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')} "
            "${parsedDate.hour.toString().padLeft(2, '0')}:${parsedDate.minute.toString().padLeft(2, '0')}";
        result["timestamp"] = formattedDate ?? "";
        result['date'] = DateFormat('MMM-dd').format(parsedDate); // full date
        result['date2'] = DateFormat('dd-MMM-yy').format(parsedDate); // full date
      } else {
        print('❌ Could not parse date');
      }
    }
    //print('result-date : ${result['date']}');
    if (line.contains(RegExp(r'\d{1,2}/\d{1,2}/\d{2},')) && result['date'] == null) { // fallback for date
      //result['timestamp'] = line;
      String cleanedLine = line
          .replaceAll(RegExp(r'[^\x00-\x7F]'), '') // remove non-ASCII chars
          .replaceAll('\u00A0', ' ')               // replace non-breaking space
          .replaceAll(RegExp(r'\s+'), ' ')         // normalize whitespace
          .trim()
          .replaceAllMapped(RegExp(r'\b(am|pm)\b'), (match) => match[0]!.toUpperCase());

      //print('Cleaned timestamp: "$cleanedLine"');

      try {
        DateTime parsed;

        // Try multiple date formats
        try {
          //parsed = DateFormat('M/d/yy, H:mm').parse(cleanedLine);
          parsed = DateFormat('dd/MM/yy, h:mm a').parse(cleanedLine);
        } catch (_) {
          //parsed = DateFormat('dd/MM/yy, h:mm a').parse(cleanedLine);
          parsed = DateFormat('M/d/yy, H:mm').parse(cleanedLine);
        }
        //DateFormat inputFormat = DateFormat('dd/MM/yy, h:mm a');
        //DateTime parsed  = inputFormat.parse(cleanedLine);
        print('datetime : ${parsed}');
        //result['timestamp'] =  DateFormat('yyyy-MM-dd HH:mm').format(parsed);//parsed;
        result['date'] = DateFormat('MMM-dd').format(parsed); // full date
        result['date2'] = DateFormat('dd-MMM-yy').format(parsed); // full date

        //result['time'] = DateFormat('HH:mm').format(parsed); // just time
        //result['time2'] = DateFormat('hh:mm a').format(parsed); // just time
        //print('✅ Date: ${result["date"]}');
        //print('🕒 Time: ${result["time"]}');
      } catch (e) {
        //print('Parse error: $e');
      }

    } else if (line.contains('Test ID')) {
      result['testId'] = line.split(' ').last;
    } else if (line.toLowerCase().trim() == 'lte') {
      result['network_type'] = 'LTE';
    } else if (line.toLowerCase().trim() == '5g') {
      result['network_type'] = '5G';
    } else if (line.toLowerCase().trim() == '4g') {
      result['network_type'] = '4G';
    } else if (line.toLowerCase().trim() == '3g') {
      result['network_type'] = '3G';
    } else if (line.toLowerCase().trim() == '2g') {
      result['network_type'] = '2G';
    } else if (line.toUpperCase().contains('DOWNLOAD MBPS') && i > 0) {
      double? number = double.tryParse(lines[i - 1].trim());
      if (number == null) {
        // check if the next line after i + 1 is not 'B/s'
        if(!lines[i + 2].toLowerCase().trim().contains('b/s') && i + 2 < lines.length ) {
          number = double.tryParse(lines[i + 1].trim());
        }

        if (number == null && !line.toUpperCase().contains('UPLOAD MBPS')){
          number = double.tryParse(lines[i + 2].trim());
        }
        // still null get the i + 3
        if (number == null && i < lines.length - 1) {
          number = double.tryParse(lines[i + 3].trim());
        }
      }
      //print('number : $number');
      result['download'] = number ?? '';

    } else if (line.contains('Data used') && result['downloadDataUsedMB'] == '') {
      result['downloadDataUsedMB'] = line.replaceAll('Data used', '').trim();
    } else if (line.toUpperCase().contains('UPLOAD MBPS') && i < lines.length - 1) {
      result['upload'] = '';
      // still null check previous line
      double? number = double.tryParse(lines[i - 1].trim());
      if (number != null && number != result['download']) {
        result['upload'] = number;
      }
      // still null check previous line
      number = double.tryParse(lines[i - 2].trim());
      if (number != null && number != result['download']) {
        result['upload'] = number;
      }
      // result['upload'] still null check the next line for value
      number = double.tryParse(lines[i + 1].trim());

      if (number != null && result['upload'] == '') {
        result['upload'] = number;
      } else {
        // result['upload'] still null check the next line for value
        number = double.tryParse(lines[i + 3].trim());
        if (number != null  && i + 3 < lines.length && result['upload'] == '') {
          result['upload'] = number;
        }
      }
      // result['upload'] still null check the next line for value
      number = double.tryParse(lines[i + 2].trim());
      if (number != null  && i + 2 < lines.length && result['upload'] == '') {
        result['upload'] = number;
      }

    } else if (line.contains('Data used') && result['uploadDataUsedMB'] == '') {
      result['uploadDataUsedMB'] = line.replaceAll('Data used', '').trim();
    } else if (line == 'Idle' || line == 'ldle' || line == 'dle') {
      result['pingSet'] ??= <String, dynamic>{};
      final pingMap = result['pingSet'] as Map<String, dynamic>;

      for (int j = i + 1; j <= i + 5 && j < lines.length; j++) {
        final checkline = safeLine(lines, i + j);

        if (checkline != null){
          //print('idle : ${lines[j].trim()}');
          String nextLine = lines[j].trim();
          int? number = int.tryParse(nextLine);

          if (number != null && number != 0) {
            pingMap['idle']['avg'] = lines[j];
            //print('Found download avg: $number');
            break; // ✅ stop searching once number found
          }
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null && lines[i + j].trim().contains('Low ')){
          //print("Low : ${lines[i + j].trim().contains('Low ')}");
          //print("Low value is : ${lines[i + j].trim()}");
          //print('idle-low : ${lines[i + j].replaceAll('Low ', '')
          //    .replaceAll('l', '1') // small letter L ➔ 1
           //   .replaceAll('O', '0') // capital O ➔ 0
           //   .replaceAll('o', '0')}');
          pingMap['idle']['low'] = lines[i + j].replaceAll('Low ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null && lines[i + j].trim().contains('High ')){
          pingMap['idle']['high'] = lines[i + j].replaceAll('High ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0
          break;
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null && lines[i + j].trim().contains('Jitter ')){
          String cleanLine = lines[i + j].trim().replaceFirst(RegExp(r'^[0O]'), '');
          pingMap['idle']['jitter'] = cleanLine.replaceAll('Jitter ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0
          break;
        }
      }
    } else if (line.trim() == 'Download' || line.trim() == 'O Download' || line.trim() == 'ODownload') {
      //print('line is Ping Download : $line');
      result['pingSet'] ??= <String, dynamic>{};
      final pingMap = result['pingSet'] as Map<String, dynamic>;

      // ✅ Found "Download" section, now search the next 5 lines max
      for (int j = i + 1; j <= i + 5 && j < lines.length; j++) {
        final checkline = safeLine(lines, i + j);
        //print('download-avg');
        if(checkline != null) {
          String nextLine = lines[j].trim();
          int? number = int.tryParse(nextLine);

          if (number != null) {
            pingMap['download']['avg'] = lines[j];
            //print('Found download avg: $number');
            break; // ✅ stop searching once number found
          }
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);
        //print('download-low');

        if(checkline != null && lines[i + j].trim().contains('Low ')){
          pingMap['download']['low'] = lines[i + j].replaceAll('Low ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);
        //print('download-high');

        if (checkline != null && lines[i + j].trim().contains('High ')) {
          //print('dl high : ${ lines[i + j].replaceAll('High ', '')}');

          pingMap['download']['high'] = lines[i + j].replaceAll('High ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;  // Exit the loop once the value is found and assigned
        }
      }

      for (int j = 1; j <= 11; j++) {
        final checkline = safeLine(lines, i + j);
        //print('download-jitter');

        if (checkline != null && lines[i + j].trim().contains('Jitter ')) {
          pingMap['download']['jitter'] =
              lines[i + j].replaceAll('Jitter ', '')
                  .replaceAll('l', '1') // small letter L ➔ 1
                  .replaceAll('O', '0') // capital O ➔ 0
                  .replaceAll('o', '0'); // small o ➔ 0;
          break;
        }
        //print('end-download');
      }
    } else if (line.trim() == 'Upload' || line.trim() == '0Upload' || line.trim() == '0 Upload' || line.trim() == 'OUpload' ||  line.trim() == 'O Upload' || line.trim() == '©Upload') {
      //print('line is Ping Download : $line');
      result['pingSet'] ??= <String, dynamic>{};
      final pingMap = result['pingSet'] as Map<String, dynamic>;

      for (int j = i + 1; j <= i + 5 && j < lines.length; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null) {
          String nextLine = lines[j].trim();
          int? number = int.tryParse(nextLine);

          if (number != null) {
            pingMap['upload']['avg'] = lines[j];
            //print('Found download avg: $number');
            break; // ✅ stop searching once number found
          }
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null && lines[i + j].trim().contains('Low ')){
          pingMap['upload']['low'] = lines[i + j].replaceAll('Low ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if (checkline != null && lines[i + j].trim().contains('High ')) {
          pingMap['upload']['high'] = lines[i + j].replaceAll('High ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;  // Exit the loop once the value is found and assigned
        }
      }

      for (int j = 1; j <= 9; j++) {
        final checkline = safeLine(lines, i + j);

        if(checkline != null && lines[i + j].trim().contains('Jitter ')){
          pingMap['upload']['jitter'] = lines[i + j].replaceAll('Jitter ', '')
              .replaceAll('l', '1') // small letter L ➔ 1
              .replaceAll('O', '0') // capital O ➔ 0
              .replaceAll('o', '0'); // small o ➔ 0;
          break;
        }
      }
    } else if (line.toLowerCase().contains('packet loss')) {
      result['packetLoss'] = i + 1 < lines.length ? lines[i + 1] : '';
    } else if (line.toLowerCase().contains('device')) {
      if (result['phone_model'] == null || result['phone_model'] == ''){
        //print('phone_model : ${result['phone_model']}');
        String nextline = lines[i + 1].trim();
        String nextline2 = lines[i + 2].trim();
        if( !nextline.toLowerCase().contains('connection type')) {

          result['phone_model'] = lines[i + 1].trim();
        } else  if( !nextline2.toLowerCase().contains('connection type')) {
          result['phone_model'] = lines[i + 2].trim();
        }
      }
    } else if (line.toLowerCase().contains('lat:') && line.toLowerCase().contains('lon:')) {
      // Adjustin the regex to allow commas in longitude
      final regex = RegExp(r'Lat:\s*([-\d.]+)\s+Lon:\s*([-\d.,]+)');
      final match = regex.firstMatch(line);

      if (match != null) {
        // Parse latitude and longitude, removing any commas from the longitude
        double lat = double.parse(match.group(1)!);
        double lon = double.parse(match.group(2)!.replaceAll(',', '.'));

        result['lat'] = lat.toString();
        result['lon'] = lon.toString();
      }
    }
    else if (i > 5 && getProviderName(line.toLowerCase()).length > 0){
      //print('xline : ${getProviderName(line.toLowerCase())}');
      String nextLine = line.trim();
      result["operator"] = getProviderName(nextLine);
    }
    final pingSet = result['pingSet'] as Map<String, dynamic>?;

    // if still the value for idle, download, upload is null
    final lowerLine = line.toLowerCase();

    if (RegExp(r'^\d+$').hasMatch(lowerLine)) {
      // If line is just numbers -> avg
      if (phase == 0) {
        pingSet?['idle']?['avg'] = int.tryParse(lowerLine);
      } else if (phase == 1) {
        pingSet?['download']?['avg'] = int.tryParse(lowerLine);
      } else if (phase == 2) {
        pingSet?['upload']?['avg'] = int.tryParse(lowerLine);
      }
      print('pingSet : ${pingSet}');
      phase++; // move to next phase after avg
      print('phase : $phase');
    } else if (lowerLine.startsWith('low')) {
      final number = int.tryParse(lowerLine.replaceFirst('low', '').trim().replaceFirst('l','1'));
      print('low : $number');
      if (phase == 1) {
        pingSet?['idle']?['low'] = number;
      } else if (phase == 2) {
        pingSet?['download']?['low'] = number;
      } else if (phase == 3) {
        pingSet?['upload']?['low'] = number;
      }
    } else if (lowerLine.startsWith('high')) {
      final number = int.tryParse(lowerLine.replaceFirst('high', '').trim().replaceFirst('l','1'));
      print('high : $number');
      if (phase == 1) {
        pingSet?['idle']?['high'] = number;
      } else if (phase == 2) {
        pingSet?['download']?['high'] = number;
      } else if (phase == 3) {
        pingSet?['upload']?['high'] = number;
      }
    } else if (lowerLine.startsWith('jitter')) {
      final number = int.tryParse(
          lowerLine.replaceFirst('jitter', '').trim().replaceFirst('l','1'));
      print('jitter : $number');
      if (phase == 1) {
        pingSet?['idle']?['jitter'] = number;
      } else if (phase == 2) {
        pingSet?['download']?['jitter'] = number;
      } else if (phase == 3) {
        pingSet?['upload']?['jitter'] = number;
      }
      print('after jitter pingSet : ${pingSet}');
      //phase++; // after jitter, move to next phase
      print('after jitter phase : $phase');

    }
    result['ping'] = pingSet?['idle']?['avg'] ?? '-';
    result['jitter'] = pingSet?['idle']?['jitter'] ?? '-';
    //print('result[timestamp] : ${result["timestamp"]}');
  }
  //print('ookla : $result');
  return result;
}

