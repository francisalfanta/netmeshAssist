import 'package:flutter/material.dart';

/// Returns the color based on the signal quality.
Color getSignalColor(String quality) {
  switch (quality) {
    case "Excellent":
      return Colors.green; // Strongest signal
    case "Good":
      return Colors.lightGreen;
    case "Average":
      return Colors.amber; // Medium strength
    case "Weak":
      return Colors.orange;
    case "Very Weak":
      return Colors.deepOrange; // Almost no signal
    case "No Signal":
      return Colors.red; // No signal at all
    default:
      return Colors.grey; // Default fallback color
  }
}

String getSignalTooltip(String quality) {
  switch (quality.toUpperCase()) {
    case "EXCELLENT":
      return "Strongest signal, fast and stable connection.";
    case "GOOD":
      return "Good signal, should work fine for most tasks.";
    case "AVERAGE":
      return "Decent signal, may experience some slowdowns.";
    case "WEAK":
      return "Weak signal, possible interruptions or slow speeds.";
    case "VERY WEAK":
      return "Very poor signal, frequent disconnections likely.";
    case "NO SIGNAL":
      return "No signal detected, connection unavailable.";
    default:
      return "Signal strength unknown.";
  }
}
