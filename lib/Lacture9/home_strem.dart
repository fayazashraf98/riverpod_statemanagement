import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/Lacture9/stream_provider.dart';

// Lecture 9 screen that listens to the stock stream and shows the live value.
class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  // Connect this widget to its state class.
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

// State keeps the widget running while the stream keeps sending data.
class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    // Print helps show when the widget rebuilds.
    print('widget build');

    return Scaffold(
      // Simple app bar title.
      appBar: AppBar(title: const Text('Live Stock Market')),
      body: Consumer(
        builder: (context, ref, child) {
          // Watch the provider so the UI updates for each new price.
          final stockAsync = ref.watch(stockPriceProvider);
          // Print helps show when the stream is rebuilt.
          print('Stock 2');
          return Center(
            // Convert the stream state into loading, error, or data UI.
            child: stockAsync.when(
              // Show a spinner while waiting for the first price.
              loading: () => const CircularProgressIndicator(),
              // Show the error text if the stream fails.
              error: (error, stack) => Text(error.toString()),
              // Show the live stock card when data arrives.
              data: (price) {
                return Container(
                  // Full-width card.
                  width: double.infinity,
                  // Add space around the card.
                  margin: const EdgeInsets.all(20),
                  // Add inner padding so the content is readable.
                  padding: const EdgeInsets.all(20),
                  // Dark card background to match a market look.
                  decoration: BoxDecoration(
                    color: const Color(0xFF0B1E2D),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    // Keep the card compact.
                    mainAxisSize: MainAxisSize.min,
                    // Align content to the left.
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row with the symbol and company name.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Stock identity block.
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Symbol name.
                              Text(
                                'RVRP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              // Small label row with an up arrow.
                              Row(
                                children: [
                                  // Company name.
                                  Text(
                                    'Riverpod Stock',
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.trending_up,
                                    color: Colors.greenAccent,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Space before the price.
                      const SizedBox(height: 20),
                      // Live price value.
                      Text(
                        price.toStringAsFixed(3),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
