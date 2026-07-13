/// Replaces the `Map<String, dynamic>` meal entries used throughout the
/// legacy nutrition/meal-idea controllers.
class MealItem {
  const MealItem({
    required this.image,
    required this.name,
    required this.time,
    required this.calories,
    this.subtitle = '',
  });

  final String image;
  final String name;
  final String time;
  final String calories;

  /// Short one-line description shown under the name on grid cards, so no
  /// card ever renders as a bare photo without context.
  final String subtitle;
}

class MealDetail {
  const MealDetail({
    required this.image,
    required this.name,
    required this.time,
    required this.calories,
    this.ingredients = const [],
    this.preparation = const [],
    this.favoriteKey,
  });

  final String image;
  final String name;
  final String time;
  final String calories;
  final List<String> ingredients;
  final List<String> preparation;

  /// Identity used to look up/toggle favorite state; null when the detail
  /// page is opened for a screen that doesn't track favorites.
  final String? favoriteKey;
}

enum MealCategory { breakfast, lunch, dinner }

class MealIdeaSection {
  const MealIdeaSection({
    required this.top,
    required this.recommended,
    required this.recipes,
  });

  final MealDetail top;
  final List<MealDetail> recommended;
  final List<MealDetail> recipes;
}

class BreakfastOption {
  const BreakfastOption({
    required this.name,
    required this.time,
    required this.calories,
    required this.image,
    required this.ingredients,
    required this.preparation,
    this.isFavorite = false,
  });

  final String name;
  final String time;
  final String calories;
  final String image;
  final List<String> ingredients;
  final List<String> preparation;
  final bool isFavorite;

  BreakfastOption copyWith({bool? isFavorite}) => BreakfastOption(
    name: name,
    time: time,
    calories: calories,
    image: image,
    ingredients: ingredients,
    preparation: preparation,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  MealDetail toDetail() => MealDetail(
    image: image,
    name: name,
    time: time,
    calories: calories,
    ingredients: ingredients,
    preparation: preparation,
  );
}
