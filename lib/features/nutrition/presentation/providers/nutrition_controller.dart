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
  ),
  MealItem(
    image: 'assets/salad.png',
    name: 'Salads with quinoa',
    subtitle: 'Fresh greens, quinoa, and lemon dressing.',
    time: '12 Minutes',
    calories: '120 Cal',
  ),
];

@riverpod
List<MealItem> nutritionRecipes(Ref ref) => const [
  MealItem(
    image: 'assets/del.png',
    name: 'Delights with\n Greek yogurt',
    time: '6 Minutes',
    calories: '200 Cal',
  ),
  MealItem(
    image: 'assets/salmon.png',
    name: 'Baked salmon',
    time: '30 Minutes',
    calories: '350 Cal',
  ),
];
