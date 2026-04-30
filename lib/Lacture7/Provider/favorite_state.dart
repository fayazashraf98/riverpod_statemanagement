import 'package:riverpod_statemanagement/Lacture7/Model/favorite_items.dart';

class FavoriteState {
  final List<favoriteItem> allItems;
  final List<favoriteItem> filteredItems;
  final String search;

  FavoriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavoriteState copyWith({
    List<favoriteItem>? allItems,
    List<favoriteItem>? filteredItems,
    String? search,
  }) {
    return FavoriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
