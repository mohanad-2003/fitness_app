import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/nutrition_models.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../providers/meal_idea_controller.dart';
import '../widgets/meal_idea_section_view.dart';

class MealIdeaPage extends ConsumerWidget {
  const MealIdeaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(mealIdeaCategoryControllerProvider);
    final section = ref.watch(mealIdeaSectionProvider(category));
    final favorites = ref.watch(mealIdeaFavoritesProvider.notifier);
    final favSet = ref.watch(mealIdeaFavoritesProvider);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WorkoutHeader(title: 'Meal Idea'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final cat in MealCategory.values)
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap:
                                () => ref
                                    .read(
                                      mealIdeaCategoryControllerProvider
                                          .notifier,
                                    )
                                    .select(cat),
                            child: Container(
                              height: 32,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    cat == category
                                        ? AppColors.seedLime
                                        : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  _label(cat),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        cat == category
                                            ? const Color(0xff232323)
                                            : AppColors.seedViolet,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            MealIdeaSectionView(
              section: section,
              isFavorite: (key) => key != null && favSet.contains(key),
              onToggleFavorite: favorites.toggle,
              onOpenDetail:
                  (meal, tag) =>
                      context.push(AppRoutes.mealDetail, extra: meal),
            ),
          ],
        ),
      ),
    );
  }

  String _label(MealCategory category) => switch (category) {
    MealCategory.breakfast => 'Breakfast',
    MealCategory.lunch => 'Lunch',
    MealCategory.dinner => 'Dinner',
  };
}
