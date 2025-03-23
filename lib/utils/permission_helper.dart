import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  if (await Permission.manageExternalStorage.request().isGranted ||
      await Permission.storage.request().isGranted) {
    // print("✅ Storage permission granted.");
  } else {
    // print("❌ Storage permission denied. Please enable it in settings.");
    openAppSettings(); // Open settings if denied
  }
}
