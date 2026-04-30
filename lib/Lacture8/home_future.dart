import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/Lacture8/future_provider.dart';

/// Lecture 8 screen.
///
/// This page consumes `futureProvider` and renders the result using
/// `AsyncValue.when`, which is the standard way to handle loading, error, and
/// data states from a `FutureProvider`.
class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider so the widget rebuilds when the async state changes.
    final provider = ref.watch(futureProvider);
    return Scaffold(
      // Tap to reload the async data.
      appBar: AppBar(title: Text('Future Provider')),
      body: Column(
        children: [
          Center(
            child: provider.when(
              // Show the loading UI again when the provider reloads.
              skipLoadingOnReload: false,

              // Render the list when the Future completes.
              data: (value) => ListView.builder(
                shrinkWrap: true,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(value[index]));
                },
              ),
              // Show the error message if the Future throws.
              error: (error, stack) => Text('Error: $error'),
              // Show a spinner while the Future is waiting.
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
