import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Lecture 9 stream provider.
// StreamProvider is used when data changes over time and the UI should listen
// to every new value automatically.
final stockPriceProvider = StreamProvider<double>((ref) async* {
  // Random makes the stock price move up and down.
  final random = Random();

  // Start the fake stock at a simple base value.
  double currentPrice = 100.0;

  // Keep emitting new values forever so the screen feels live.
  while (true) {
    // Wait one second between updates.
    await Future.delayed(const Duration(seconds: 1));

    // Move the price a little bit up or down.
    currentPrice += random.nextDouble() * 10 - 5;

    // Send the new price to the UI.
    yield double.parse(currentPrice.toStringAsFixed(3));
  }
});
