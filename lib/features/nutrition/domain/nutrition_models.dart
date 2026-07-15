/// Replaces the `Map<String, dynamic>` meal entries used throughout the
/// legacy nutrition/meal-idea controllers.
class MealItem {
  const MealItem({
    required this.image,
    required this.name,
    required this.time,
    required this.calories,
    this.subtitle = '',
    this.protein,
    this.carbs,
    this.fat,
    this.rating,
    this.difficulty,
  });

  final String image;
  final String name;
  final String time;
  final String calories;

  /// Short one-line description shown under the name on grid cards, so no
  /// card ever renders as a bare photo without context.
  final String subtitle;

  /// Optional macro/quality metadata for the premium recipe card. Null when
  /// not supplied by a given mock source — cards render gracefully without
  /// these chips rather than showing fabricated numbers.
  final String? protein;
  final String? carbs;
  final String? fat;
  final double? rating;
  final String? difficulty;
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
    this.protein,
    this.carbs,
    this.fat,
    this.rating,
    this.difficulty,
    this.servings,
    this.tips = const [],
    this.benefits = const [],
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

  /// Optional recipe-detail metadata — same "render only if present"
  /// contract as [MealItem].
  final String? protein;
  final String? carbs;
  final String? fat;
  final double? rating;
  final String? difficulty;
  final String? servings;
  final List<String> tips;
  final List<String> benefits;
}

enum MealCategory { breakfast, lunch, dinner }

/// At-a-glance daily nutrition snapshot shown at the top of the Nutrition
/// home tab — static/mock, matching the same demo-data pattern already used
/// by [nutritionRecommended]/[nutritionRecipes] (no real food-logging
/// feature exists in the app yet).
class DailyNutritionSummary {
  const DailyNutritionSummary({
    required this.consumedCalories,
    required this.goalCalories,
    required this.proteinFraction,
    required this.carbsFraction,
    required this.fatFraction,
    required this.waterIntake,
  });

  final int consumedCalories;
  final int goalCalories;

  /// 0..1 progress toward the daily goal for each macro.
  final double proteinFraction;
  final double carbsFraction;
  final double fatFraction;

  /// Pre-formatted display string (e.g. "5 / 8 cups"), matching the rest of
  /// the domain layer's convention of storing ready-to-render text rather
  /// than raw numbers + ICU placeholders.
  final String waterIntake;
}

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
