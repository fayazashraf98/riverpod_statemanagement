import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_statemanagement/Lacture6/item.dart';

// Exposes the todo list state and its notifier methods to the UI.
final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  // Adds a new item by creating a new list instance (immutable update).
  void addItem(String name) {
    final item = Item(id: DateTime.now().toString(), name: name);
    state = [...state, item];
  }

  // Removes an item by id and publishes the filtered list as new state.
  void removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  // Updates only the matched item while keeping other items unchanged.
  void updateItem(String id, String name) {
    final foundIndex = state.indexWhere((item) => item.id == id);
    if (foundIndex == -1) return;

    final updatedList = [...state];
    final currentItem = updatedList[foundIndex];
    updatedList[foundIndex] = Item(id: currentItem.id, name: name);
    state = updatedList;
  }
}
