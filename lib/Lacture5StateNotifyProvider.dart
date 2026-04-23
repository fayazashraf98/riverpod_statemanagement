import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Lecture 5: StateNotifierProvider with a custom state model.
// This provider exposes SearchState and delegates updates to SearchNotifier.

final searchNotifier = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  return SearchNotifier();
});

// Notifier contains all mutation logic for SearchState.
class SearchNotifier extends StateNotifier<SearchState> {
  // Initial state for this screen.
  SearchNotifier() : super(SearchState(search: '', isOn: false));

  // Update only the search field.
  void search(String query) {
    state = state.copyWith(search: query);
  }

  // Update only the switch value.
  void isswitch(bool isOn) {
    state = state.copyWith(isOn: isOn);
  }
}

// Immutable state object used by the notifier.
class SearchState {
  final String search;
  final bool isOn;

  SearchState({required this.search, required this.isOn});

  // copyWith keeps unchanged fields and replaces only provided values.
  SearchState copyWith({String? search, bool? isOn}) {
    return SearchState(search: search ?? this.search, isOn: isOn ?? this.isOn);
  }
}

// UI for reading and updating SearchState.
class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(
      "Search page rebuilds",
    ); // This print statement helps show when the SearchPage widget rebuilds.

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          const Center(child: Text('Search Page')),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),

              // Every key stroke updates the search value in provider state.
              onChanged: (value) {
                ref.read(searchNotifier.notifier).search(value);
              },
            ),
          ),

          // This Consumer rebuilds only when state.search changes.
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(
                searchNotifier.select((state) => state.search),
              );
              print(
                "Search query changes",
              ); // This print shows rebuilds caused by search query changes.
              return Text(search);
            },
          ),

          // This Consumer rebuilds only when state.isOn changes.
          Consumer(
            builder: (context, ref, child) {
              final isChanged = ref.watch(
                searchNotifier.select((state) => state.isOn),
              );
              print(
                "Switch changes",
              ); // This print shows rebuilds caused by switch changes.
              return Switch(
                value: isChanged,
                onChanged: (value) {
                  // Delegate update to notifier to keep mutation logic centralized.
                  ref.read(searchNotifier.notifier).isswitch(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
