import 'package:flutter/material.dart';
import 'package:riverpod_statemanagement/Lacture1CopyWithMetho.dart';
import 'package:riverpod_statemanagement/Lacture2SimpleProvider.dart';
import 'package:riverpod_statemanagement/Lacture3StateProvider.dart';
import 'package:riverpod_statemanagement/Lacture4StateProviderMultipleState.dart';

// Central menu page: each button opens one lecture screen.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Lectures')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Choose a lecture to open',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          _LectureButton(
            title: 'Lecture 1: Copy With Method',
            subtitle: 'StatefulWidget example',
            onTap: () {
              // Push lecture 1 screen on top of HomePage.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CopyWith()),
              );
            },
          ),
          _LectureButton(
            title: 'Lecture 2: Simple Provider (Stateless)',
            subtitle: 'ConsumerWidget example',
            onTap: () {
              // Push lecture 2 stateless version.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SimpleProvider()),
              );
            },
          ),
          _LectureButton(
            title: 'Lecture 2: Simple Provider (Stateful)',
            subtitle: 'ConsumerStatefulWidget example',
            onTap: () {
              // Push lecture 2 stateful version.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SimpleProviderStateful(),
                ),
              );
            },
          ),
          _LectureButton(
            title: 'Lecture 3: State Provider (Stateful)',
            subtitle: 'Counter + toggle using ConsumerStatefulWidget',
            onTap: () {
              // Push lecture 3 state provider demo.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterAppStatefull()),
              );
            },
          ),
          _LectureButton(
            title: 'Lecture 3: State Provider (Stateless)',
            subtitle: 'Counter + toggle using ConsumerWidget',
            onTap: () {
              // Push lecture 3 stateless state provider demo.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterApp()),
              );
            },
          ),
          _LectureButton(
            title: 'Lecture 4: Multiple State in One Model',
            subtitle: 'Slider + toggle using one AppState object',
            onTap: () {
              // Push lecture 4 multiple-state demo.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SliderProvider()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Reusable button UI for each lecture card in the list.
class _LectureButton extends StatelessWidget {
  const _LectureButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 72,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
