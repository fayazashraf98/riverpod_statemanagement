import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_statemanagement/Lacture7/Model/favorite_items.dart';
import 'package:riverpod_statemanagement/Lacture7/Provider/favorite_state.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, FavoriteState>(
  (ref) {
    return FavoriteNotifier();
  },
);

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
    : super(FavoriteState(allItems: [], filteredItems: [], search: ''));

  void addItems() {
    List<favoriteItem> newItems = [
      favoriteItem(name: 'Apple', id: 1, isFavorite: false),
      favoriteItem(name: 'Banana', id: 2, isFavorite: false),
      favoriteItem(name: 'Orange', id: 3, isFavorite: false),
      favoriteItem(name: 'Grapes', id: 4, isFavorite: false),
      favoriteItem(name: 'Mango', id: 5, isFavorite: false),
    ];
    state = state.copyWith(
      allItems: newItems.toList(),
      filteredItems: newItems.toList(),
    );
  }

  void toggleFavorite(int id) {
    final updatedAllItems = state.allItems.map((item) {
      if (item.id == id) {
        return item.copyWith(isFavorited: !item.isFavorite);
      }
      return item;
    }).toList();

    state = state.copyWith(
      allItems: updatedAllItems,
      filteredItems: updatedAllItems
          .where((item) => item.name.contains(state.search))
          .toList(),
    );
  }

  void updateSearch(String query) {
    state = state.copyWith(
      search: query,
      filteredItems: state.allItems
          .where(
            (item) => item.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList(),
    );
  }
}
