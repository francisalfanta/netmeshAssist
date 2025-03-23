import 'package:flutter/material.dart';

class SpeedTestHeader extends StatelessWidget {
  const SpeedTestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(flex: 1, child: Center(child: Icon(Icons.signal_cellular_alt, color: Colors.green, size: 24))),
                Expanded(flex: 2, child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Time", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                  flex: 3,
                  child: Tooltip(
                    message: 'Operator',  // The message that will appear when the user hovers/taps
                    child: Text(
                      "PTE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Tooltip(
                    message: "Upload/Download in MHz",
                    child: Text("UL/DL", style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Tooltip(
                    message: 'Phone Model',  // The message that will appear when the user hovers/taps
                    child: Text(
                      "Model",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(flex: 1, child: Center(child: Icon(Icons.check_circle, color: Colors.green, size: 15))),
                Expanded(
                  flex: 6,
                  child: Tooltip(
                    message: "Address format: Barangay, Municipality/City", // The tooltip message
                    child: Text(
                      "Address",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: "in Millisecond(ms)",
                    child: Text("Ping", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10), textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: "in Millisecond(ms)",
                    child: Text("Jitter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10), textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Tooltip(
                    message: 'Network Type',  // The message that will appear when the user hovers/taps
                    child: Text(
                      "Type",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
