import 'package:flutter/material.dart';
import 'package:netmeshAssist/utils/signal_helper.dart'; // ✅ Import the file

class SpeedTestList extends StatelessWidget {
  final List<Map<String, dynamic>> speedTestData;
  final Color Function(String) getSignalColor;
  final bool isLoading; // Add a loading state

  const SpeedTestList({
    super.key,
    required this.speedTestData,
    required this.getSignalColor,
    required this.isLoading, // Accept the isLoading parameter
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: speedTestData.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(speedTestData[index]['Date']), // Use a unique key for each item
            direction: DismissDirection.horizontal, // Allow swiping left or right
            onDismissed: (direction) {
              // Remove the item from the list when dismissed
              speedTestData.removeAt(index);

              // Show a snackbar or do some other action after dismissal
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Test data deleted'),
              ));
            },
            background: Container(
              color: Colors.red, // Red background for delete action
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.blue, // Blue background for some other action (optional)
              alignment: Alignment.centerRight,
              child: Icon(Icons.archive, color: Colors.white),
            ),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Tooltip(
                              message: getSignalTooltip(
                                  speedTestData[index]["Signal Quality"] ?? ""), // Pass the signal quality dynamically
                              child: Icon(
                                Icons.signal_cellular_alt,
                                color: getSignalColor(
                                    speedTestData[index]["Signal Quality"] ?? ""),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 2, child: Text(speedTestData[index]["Date"], style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 2, child: Text(speedTestData[index]["Time"], style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis)),
                        Expanded(flex: 3, child: Text(speedTestData[index]["PTE"], style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis)),
                        Expanded(
                          flex: 3,
                          child: Text("${speedTestData[index]["UL"]} / ${speedTestData[index]["DL"]}", style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                        ),
                        Expanded(flex: 3, child: Text(speedTestData[index]["Model"], style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(flex: 1, child: Center(child: Icon(Icons.location_pin, color: Colors.blue, size: 20))),
                        Expanded(
                          flex: 6,
                          child: Tooltip(
                            message: speedTestData[index]["Formatted Address"] ?? "??", // Full location
                            child: Text(
                              speedTestData[index]["Location"] ?? "??",
                              style: const TextStyle(fontSize: 10),
                              overflow: TextOverflow.ellipsis, // Ensures text is truncated
                            ),
                          ),
                        ),
                        Expanded(flex: 2, child: Text(speedTestData[index]["Ping"] ?? "??", style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
                        Expanded(flex: 2, child: Text(speedTestData[index]["Jitter"] ?? "??", style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
                        Expanded(flex: 2, child: Text(speedTestData[index]["Network Type"] ?? "??", style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}