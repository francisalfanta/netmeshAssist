import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(BuildContext, String, String) showModal;

  const AppBarWidget({required this.showModal, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/images/easyaidlogo.png',
                  height: MediaQuery.of(context).size.height * 0.07,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.article),
          tooltip: "Release Notes",
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Release Notes"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Release Date: March 23, 2025",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "New Features:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      ListTile(
                        leading: Icon(Icons.check, size: 16),
                        title: Text("Automatic Data Entry"),
                        subtitle: Text(
                            "Automatically enters data from the Speed Test screenshot taken from the History page."),
                      ),
                      ListTile(
                        leading: Icon(Icons.check, size: 16),
                        title: Text("Export Data"),
                        subtitle: Text(
                            "Users can now export data in XLSX or CSV format for further analysis."),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Close"),
                  ),
                ],
              );
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.info_outline),
          tooltip: "App Scope",
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("App Scope"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Features",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check, size: 16),
                        title: Text(
                          "Automatic Entry from Screenshot",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Automatically enters data from the Speed Test screenshot taken from the History page for easy access.",
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.check, size: 16),
                        title: Text(
                          "Export/Share Data (XLSX/CSV)",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Allows users to export the generated table in either XLSX or CSV format for further analysis or reporting.",
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Limitation",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.warning, size: 16),
                        title: Text(
                          "Google Geolocation API Request Limit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "The app uses Google Geolocation API with a maximum of 1677 free requests per day.",
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.warning, size: 16),
                        title: Text(
                          "Effect Beyond Limit",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "If the daily limit is exceeded, the Region, Province, Municipality, or Barangay columns will remain blank.",
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Close"),
                  ),
                ],
              );
            },
          ),
        )

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
