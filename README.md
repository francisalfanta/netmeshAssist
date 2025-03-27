# Net Mesh Speedtest Assist

Features
- Automatic Entry from Screenshot
  - Automatically enters data from the Speed Test screenshot taken from the History page for easy access.
  - Ignore duplicate entries during upload.
- Export Data (XLSX/CSV)
  - Allows users to export the generated table in either XLSX or CSV format for further analysis or reporting.
- Export Format Ready
  - Net Mesh export table format
  - Mobile Broadband Speed Validation Report format

Limitation
- The app is exclusively available for Android.
- Google Geolocation API Request Limit
    -- The app uses Google Geolocation API with a maximum of 1333 free requests per day.
- Effect Beyond
    -- Limit	If the daily limit is exceeded, the Region, Province, Municipality, or Barangay columns will remain blank.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


| <div align="center"><b>Accepted Screenshot</b></div> | <div align="center"><b>Not Accepted Screenshot</b></div> |
|-------------|--------------|
| <div align="center"><img src="https://github.com/user-attachments/assets/6af97bcc-01fe-4537-b357-071958f43625" width="25%" /></div> | <div align="center"><img src="https://github.com/user-attachments/assets/08e78679-bd20-495c-bba9-19b1934025da" width="25%" /></div> |

### 📱 Android Version Compatibility

This Flutter app supports:
- Minimum SDK: 21 (Android 5.0 - Lollipop, Released in 2014)
- Target SDK: 35 (Android 14, Released in 2024)
  
### Release Notes

##### [Android APK v1.0.6]([https://drive.google.com/file/d/1OZtMTMN_QWgK_73-J2Lyn1FuvEEOjrEU/view?usp=drive_link](https://drive.google.com/file/d/188wQP7SlPTE1zSdMISVthuosoftALAQ4/view?usp=sharing)

March 26, 2025
 - Used Google Geocoding API instead than Geoapify for more accuracy.
 - Added Clear lists button
 - Added Export to xlsx formatted to MobileBroadband Speed Validation Report
 - Fixed Date out when date character contain spaces in between.

 March 25, 2025
 - Added short name for providers

 March 24, 2025
 - Fixed issue with exporting

 March 23, 2025
 - Initial launch, testing different type of History Report image.

[Introduction to Getting Started with NetMeshEasyAid](https://drive.google.com/file/d/147S5ZxCn_OZYKkAeIHigYXV3QU-pqdm_/view?usp=sharing)

This guide helps you quickly get started with the NetMeshEasyAid app. It walks you through the setup process, starting from installation to understanding the basic functionalities and how to make the most out of the app. You’ll learn the key steps to get your project up and running with ease, including configuring your environment and using the core features effectively.

**March 23**  
Currently undergoing testing on all Android device. Please report any bugs by creating an issue.

