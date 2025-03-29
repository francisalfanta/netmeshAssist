import 'package:flutter/material.dart';
import 'package:netmeshAssist/utils/signal_helper.dart'; // ✅ Import the file

class SpeedTestList extends StatelessWidget {
  final List<Map<String, dynamic>> speedTestData;
  final Color Function(String) getSignalColor;
  final bool isLoading; // Add a loading state
  final Function(int index)? onRemove;  // ✅ Add this parameter

  const SpeedTestList({
    super.key,
    required this.speedTestData,
    required this.getSignalColor,
    required this.isLoading, // Accept the isLoading parameter
    this.onRemove, // ✅ Accept onRemove as an optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: speedTestData.length,
        itemBuilder: (context, index) {
          final item = speedTestData[index];
          return Dismissible(
            //key: Key(speedTestData[index]['Date']), // Use a unique key for each item
            key: Key(item.toString()), // Unique key for each item
            //direction: DismissDirection.horizontal, // Allow swiping left or right
            direction: DismissDirection.endToStart, // Swipe from right to left
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              // Remove the item from the list when dismissed
              speedTestData.removeAt(index);
              if (onRemove != null) {
                onRemove!(index);
              }
              // Show a snackbar or do some other action after dismissal
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Speed Test data deleted'),
              ));
            },
            secondaryBackground: Container(
              color: Colors.blue, // Blue background for some other action (optional)
              alignment: Alignment.centerRight,
              child: Icon(Icons.archive, color: Colors.white),
            ),
            child: Stack(
              clipBehavior: Clip.none, // Allows the bubble to overflow
              children: [
                Card(
                  elevation: 4, // Increase for more elevation
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
                                  message: getSignalTooltip(speedTestData[index]["Signal Quality"] ?? ""),
                                  child: Icon(
                                    Icons.signal_cellular_alt,
                                    color: getSignalColor(speedTestData[index]["Signal Quality"] ?? ""),
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
                        const Divider(thickness: 0.5, color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(flex: 1, child: Center(child: Icon(Icons.location_pin, color: Colors.blue, size: 20))),
                            Expanded(
                              flex: 6,
                              child: Tooltip(
                                message: speedTestData[index]["Formatted Address"] ?? "??",
                                child: Text(
                                  speedTestData[index]["Location"] ?? "??",
                                  style: const TextStyle(fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
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

                // Bubble showing the total count
                if (speedTestData.length > 0) // Show only if the list is not empty
                // Bubble showing the index + 1
                  Positioned(
                    top: -5,
                    right: 15,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        (index + 1).toString(), // Show index + 1
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          );
        },
      ),
    );
  }
}