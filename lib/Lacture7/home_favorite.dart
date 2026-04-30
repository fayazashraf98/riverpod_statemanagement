import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/Lacture7/Provider/favorite_provider.dart';

/// Lecture 7: Favorites with Filter and Toggle
///
/// This demo showcases a practical use case of StateNotifierProvider combined with
/// search functionality. The main features include:
/// - Add items to a favorites list using the FloatingActionButton
/// - Search/filter items by name using the TextField
/// - Toggle favorite status by clicking the heart icon
/// - Real-time filtering as you type
///
/// Key concepts demonstrated:
/// - StateNotifierProvider for managing complex state (all items, filtered items, search query)
/// - `ref.watch()` for reading provider state and rebuilding when it changes
/// - `ref.read()` for triggering state updates in callbacks (addItems, updateSearch, toggleFavorite)
/// - Immutable state updates using copyWith pattern
class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the favorite provider to get the current state (all items, filtered items, search text)
    final favoriteState = ref.watch(favoriteProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        /// Adds 5 sample fruit items (Apple, Banana, Orange, Grapes, Mango) to the list
        onPressed: () {
          ref.read(favoriteProvider.notifier).addItems();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Home Favorite')),
      body: Column(
        children: [
          /// Search TextField: Updates the filtered list in real-time as user types
          /// Calls updateSearch() on the provider notifier to filter items by name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                ref.read(favoriteProvider.notifier).updateSearch(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          /// Displays the filtered list of items based on search query
          /// Each item shows its name and a heart icon to toggle favorite status
          Expanded(
            child: ListView.builder(
              itemCount: favoriteState.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favoriteState.filteredItems[index];
                return ListTile(
                  title: Text(item.name),

                  /// Heart icon toggles favorite status for an item
                  /// Red heart = favorited, outline heart = not favorited
                  trailing: IconButton(
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: item.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      // Toggle favorite status and update filtered list accordingly
                      ref
                          .read(favoriteProvider.notifier)
                          .toggleFavorite(item.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
