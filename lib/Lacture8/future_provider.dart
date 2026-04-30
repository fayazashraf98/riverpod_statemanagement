import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lecture 8 provider for async data loading.
///
/// `FutureProvider` is used when you want Riverpod to run an asynchronous
/// task once and expose the result as `AsyncValue`.
///
/// That gives the UI three clear states:
/// - loading: the async task is still running
/// - data: the task completed successfully
/// - error: the task failed with an exception
final futureProvider = FutureProvider<List<String>>((ref) async {
  // Simulate an async operation such as a network request.
  await Future.delayed(const Duration(seconds: 2));

  // Return sample data for the UI to display.
  return [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
  ];
});
