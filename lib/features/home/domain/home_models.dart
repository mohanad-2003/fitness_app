/// Replaces the `List<Map<String, String>>` fields on the legacy
/// `Homecontroller` with typed, immutable value objects.
class HomeCategory {
  const HomeCategory({required this.image, required this.name});
  final String image;
  final String name;
}

class RecommendedWorkout {
  const RecommendedWorkout({
    required this.image,
    required this.title,
    required this.duration,
    required this.calories,
  });

  final String image;
  final String title;
  final String duration;
  final String calories;
}

class ArticleTip {
  const ArticleTip({required this.image, required this.description});
  final String image;
  final String description;
}
