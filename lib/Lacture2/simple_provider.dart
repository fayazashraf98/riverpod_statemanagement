import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that exposes a constant user name.
final name = Provider<String>((ref) {
  return 'Fayaz';
});

/// Provider that exposes a constant age.
final age = Provider<int>((ref) {
  return 25;
});

/// Lecture 2 (A): Stateless version using ConsumerWidget.
class SimpleProvider extends ConsumerWidget {
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch() rebuilds this widget when provider value changes.
    final nameWatch = ref.watch(name);
    final ageWatch = ref.watch(age);

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Provider (Stateless)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ConsumerWidget Example'),
            Text('Name: $nameWatch'),
            Text('Age: $ageWatch'),
          ],
        ),
      ),
    );
  }
}

/// Lecture 2 (B): Stateful version using ConsumerStatefulWidget.
class SimpleProviderStateful extends ConsumerStatefulWidget {
  const SimpleProviderStateful({super.key});

  @override
  ConsumerState<SimpleProviderStateful> createState() =>
      _SimpleProviderStatefulState();
}

class _SimpleProviderStatefulState
    extends ConsumerState<SimpleProviderStateful> {
  @override
  Widget build(BuildContext context) {
    // In ConsumerState, ref is available as a member variable.
    final nameWatch = ref.watch(name);
    final ageWatch = ref.watch(age);

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Provider (Stateful)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ConsumerStatefulWidget Example'),
            Text('Name: $nameWatch'),
            Text('Age: $ageWatch'),
          ],
        ),
      ),
    );
  }
}
