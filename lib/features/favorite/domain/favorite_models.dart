enum FavoriteType { video, article }

class FavoriteItem {
  const FavoriteItem({
    required this.image,
    required this.title,
    required this.type,
    this.duration,
    this.calories,
    this.exercises,
    this.text,
  });

  final String image;
  final String title;
  final FavoriteType type;
  final String? duration;
  final String? calories;
  final String? exercises;
  final String? text;
}
