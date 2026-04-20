import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Holds counter value for the lecture 3 demo.
final counter = StateProvider<int>((ref) {
  return 0;
});

// Holds switch state (ON/OFF).
final isOn = StateProvider<bool>((ref) {
  return false;
});

// Stateful Riverpod example screen.
class CounterAppStatefull extends ConsumerStatefulWidget {
  const CounterAppStatefull({super.key});

  @override
  ConsumerState<CounterAppStatefull> createState() =>
      _CounterAppStatefullState();
}

class _CounterAppStatefullState extends ConsumerState<CounterAppStatefull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App State Provider")),
      body: Column(
        children: [
          // Switch section: updates `isOn` provider state.
          Consumer(
            builder: (context, ref, child) {
              final isToggle = ref.watch(isOn);
              return Switch(
                value: isToggle,
                onChanged: (value) {
                  // Write new switch value.
                  ref.read(isOn.notifier).state = value;
                },
              );
            },
          ),
          // Counter controls section.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Prevent counter from going below 0.
                  if (ref.read(counter) > 0) {
                    ref.read(counter.notifier).state--;
                  }
                },
                child: const Text("-"),
              ),

              const SizedBox(width: 10),

              Consumer(
                builder: (context, ref, child) {
                  // Only this Text rebuilds when counter changes.
                  final count = ref.watch(counter);
                  return Center(
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Increment counter.
                  ref.read(counter.notifier).state++;
                },
                child: const Text("+"),
              ),
              const SizedBox(width: 10),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              // Reset counter back to initial state.
              ref.read(counter.notifier).state = 0;
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}

// Stateless Riverpod example screen using ConsumerWidget.
class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App State Provider (Stateless)")),
      body: Column(
        children: [
          // Switch section: reads and updates `isOn` provider.
          Consumer(
            builder: (context, ref, child) {
              final isToggle = ref.watch(isOn);
              return Switch(
                value: isToggle,
                onChanged: (value) {
                  // Save the new switch value into provider state.
                  ref.read(isOn.notifier).state = value;
                },
              );
            },
          ),
          // Counter control buttons + counter display.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Prevent counter from becoming negative.
                  if (ref.read(counter) > 0) {
                    ref.read(counter.notifier).state--;
                  }
                },
                child: const Text("-"),
              ),

              const SizedBox(width: 10),

              Consumer(
                builder: (context, ref, child) {
                  // Rebuild only this text when counter changes.
                  final count = ref.watch(counter);
                  return Center(
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Increase counter by 1.
                  ref.read(counter.notifier).state++;
                },
                child: const Text("+"),
              ),
              const SizedBox(width: 10),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              // Reset counter to initial value.
              ref.read(counter.notifier).state = 0;
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}