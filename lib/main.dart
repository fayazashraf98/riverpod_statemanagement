import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/home_page.dart';
import 'package:riverpod_statemanagement/Lacture7/home_favorite.dart';

void main() {
  // App entry point.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ProviderScope makes all Riverpod providers available to the widget tree.
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {'/lecture7': (_) => const MyWidget()},
        // Home page contains buttons to open each lecture screen.
        home: const HomePage(),
      ),
    );
  }
}
