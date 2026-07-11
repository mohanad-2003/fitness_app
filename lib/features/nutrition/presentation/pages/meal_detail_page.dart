import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/nutrition_models.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../providers/meal_idea_controller.dart';
import '../widgets/meal_detail_header.dart';

/// Generic recipe/meal detail screen — replaces the legacy
/// detailsMealPage.dart and the three ad-hoc detail branches inline in
/// mealIdeaPage.dart (top/recommended/recipe), all of which rendered the
/// same ingredients+preparation layout.
class MealDetailPage extends ConsumerWidget {
  const MealDetailPage({
    super.key,
    required this.meal,
    this.headerTitle = 'Meal plan',
    this.tag = 'Recipe',
  });

  final MealDetail meal;
  final String headerTitle;
  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(mealIdeaFavoritesProvider.notifier);
    final isFavorite = ref
        .watch(mealIdeaFavoritesProvider)
        .contains(meal.favoriteKey);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: WorkoutHeader(title: headerTitle),
            ),
            MealDetailHeader(
              meal: meal,
              tagText: tag,
              isFavorite: meal.favoriteKey != null && isFavorite,
              onFavoriteTap:
                  meal.favoriteKey == null
                      ? null
                      : () => favorites.toggle(meal.favoriteKey),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
