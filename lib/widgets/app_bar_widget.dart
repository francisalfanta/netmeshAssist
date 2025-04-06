import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function(BuildContext, String, String) showModal;
  final VoidCallback onClear;
  final int overallText;
  final String failedProcessedText;
  final int duplicateCount;
  final int speedTestDataLength;  // Add this to check the condition

  const AppBarWidget({
    required this.showModal,
    required this.onClear,
    required this.overallText,
    required this.failedProcessedText,
    required this.duplicateCount,
    required this.speedTestDataLength, // Pass data length
    super.key,
  });

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
          // Processing Info Box
          if (speedTestDataLength > 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align to the left
            children: [
              //Text(
              //  "Processed: $overallText",
              //  style: const TextStyle(fontSize: 8,),
              //),
              Text(
                "Duplicate: $duplicateCount",
                style: const TextStyle(fontSize: 8, color: Colors.orange),
              ),
              Text(
                "Unsuccessful: $failedProcessedText",
                style: const TextStyle(fontSize: 8, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: "App Info",
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("App Information", style: TextStyle(fontSize: 18)),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Version 1.0.8", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const Text("Release Date: March 23, 2025", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                      const Text("https://github.com/francisalfanta/netmeshAssist", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                      const SizedBox(height: 12),
                      const Text("Features:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      _buildListItem(Icons.check, "Automatic Data Entry", ["Automatically extracts data from Speed Test screenshots. (JPG, JPEG, BMP, PNG files)",]),
                      _buildListItem(Icons.check, "Export Data", ["Supports XLSX and CSV export for analysis.",]),
                      _buildListItem(
                        Icons.check,
                        "Export Format Ready",
                        [
                          "Net Mesh export table format",
                          "Mobile Broadband Speed Validation Report format",
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text("Limitations:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      _buildListItem(Icons.warning, "Supports image uploads", ["Only in the following formats: JPG, JPEG, BMP, and PNG."]),
                      _buildListItem(Icons.warning, "Google Geocoding API Limit", ["Max 1,333 free requests per day."]),
                      _buildListItem(Icons.warning, "Effect Beyond Limit", ["Region, Province, Municipality, and Barangay fields remain blank after limit is reached."]),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Close"),
                  ),
                ],
              );
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.clear_outlined, color: Colors.redAccent,),
          tooltip: "Clear Data",
          onPressed: onClear, // Calls the onClear function when pressed
        ),
      ],
    );
  }

  Widget _buildListItem(IconData icon, String title, List<String> descriptions) {
    return ListTile(
      leading: Icon(icon, size: 16),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: descriptions.map((desc) => Text("• $desc")).toList(),
      ),
    );
  }



  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
