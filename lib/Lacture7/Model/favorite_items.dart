class favoriteItem {
  final String name;
  final int id;
  final bool isFavorite;
  favoriteItem({
    required this.name,
    required this.id,
    required this.isFavorite,
  });

  favoriteItem copyWith({String? name, int? id, bool? isFavorited}) {
    return favoriteItem(
      name: name ?? this.name,
      id: id ?? this.id,
      isFavorite: isFavorited ?? this.isFavorite,
    );
  }
}
