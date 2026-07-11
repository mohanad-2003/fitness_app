import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/widgets/round_item_tile.dart';
import 'package:fitness_app/features/workout/presentation/widgets/training_hero_card.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Generic workout-category screen — replaces the legacy AdvanceCategory,
/// IntermediateCategory, and FunctionalPage, which shared this exact
/// layout (hero card + round groups) and only differed by data.
class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({super.key, required this.data});

  final CategoryDetailData data;

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: WorkoutHeader(title: data.headerTitle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TrainingHeroCard(
              image: data.heroImage,
              badgeLabel: data.heroLabel,
              time: data.time,
              calories: data.calories,
              levelLabel: data.levelLabel,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final group in data.rounds) ...[
                    Text(
                      group.title,
                      style: TextStyle(
                        color: AppColors.seedLime,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (final item in group.items) ...[
                      RoundItemTile(
                        item: item,
                        onTap:
                            item.exerciseDetail == null
                                ? null
                                : () => context.push(
                                  AppRoutes.exerciseDetail,
                                  extra: item.exerciseDetail,
                                ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
