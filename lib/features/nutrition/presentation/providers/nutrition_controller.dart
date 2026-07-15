import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/nutrition_models.dart';

part 'nutrition_controller.g.dart';

enum NutritionTab { mealPlans, mealIdeas }

@riverpod
class NutritionTabController extends _$NutritionTabController {
  @override
  NutritionTab build() => NutritionTab.mealPlans;

  void select(NutritionTab tab) => state = tab;
}

@riverpod
List<MealItem> nutritionRecommended(Ref ref) => const [
  MealItem(
    image: 'assets/fruit.png',
    name: 'Fruit smoothie',
    subtitle: 'Berry blend with banana and oat milk.',
    time: '12 Minutes',
    calories: '120 Cal',
    protein: '4g',
    carbs: '22g',
    fat: '2g',
    rating: 4.7,
    difficulty: 'Easy',
  ),
  MealItem(
    image: 'assets/salad.png',
    name: 'Salads with quinoa',
    subtitle: 'Fresh greens, quinoa, and lemon dressing.',
    time: '12 Minutes',
    calories: '120 Cal',
    protein: '6g',
    carbs: '18g',
    fat: '4g',
    rating: 4.5,
    difficulty: 'Easy',
  ),
];

@riverpod
List<MealItem> nutritionRecipes(Ref ref) => const [
  MealItem(
    image: 'assets/del.png',
    name: 'Delights with\n Greek yogurt',
    time: '6 Minutes',
    calories: '200 Cal',
    protein: '14g',
    carbs: '24g',
    fat: '5g',
    rating: 4.8,
    difficulty: 'Easy',
  ),
  MealItem(
    image: 'assets/salmon.png',
    name: 'Baked salmon',
    time: '30 Minutes',
    calories: '350 Cal',
    protein: '32g',
    carbs: '6g',
    fat: '18g',
    rating: 4.9,
    difficulty: 'Medium',
  ),
];

@riverpod
DailyNutritionSummary dailyNutritionSummary(Ref ref) =>
    const DailyNutritionSummary(
      consumedCalories: 1450,
      goalCalories: 2200,
      proteinFraction: 0.62,
      carbsFraction: 0.48,
      fatFraction: 0.35,
      waterIntake: '5 / 8 cups',
    );
