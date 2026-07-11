import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/data/workout_category_data.dart';
import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/workout_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/training_hero_card.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutPage extends ConsumerWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final level = ref.watch(workoutTabProvider);
    final items = ref.watch(workoutListByLevelProvider(level));
    final (
      badge,
      headline,
      subHeadline,
      time,
      calories,
    ) = WorkoutCategoryData.heroCopy(level);

    return PremiumScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WorkoutHeader(title: 'Train'),
            const SizedBox(height: 8),
            Text(
              'Pick your level and move with purpose.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.62),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: WorkoutLevel.values.length,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final tabLevel = WorkoutLevel.values[index];
                  final isSelected = tabLevel == level;
                  return PremiumPill(
                    label: _label(tabLevel),
                    selected: isSelected,
                    onTap:
                        () => ref
                            .read(workoutTabProvider.notifier)
                            .select(tabLevel),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: _WorkoutActionButton(
                    icon: Icons.list_alt_rounded,
                    label: 'Your Routine',
                    onTap: () => context.push(AppRoutes.yourRoutine),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _WorkoutActionButton(
                    icon: Icons.add_circle_outline_rounded,
                    label: 'Create Routine',
                    onTap: () => context.push(AppRoutes.createRoutine),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            TrainingHeroCard(
              image: WorkoutCategoryData.heroImage(level),
              badgeLabel: 'training of the day',
              time: time,
              calories: calories,
              levelLabel: badge,
              height: 242,
              onTap:
                  () => context.push(
                    AppRoutes.workoutCategoryDetail,
                    extra: WorkoutCategoryData.forLevel(level),
                  ),
            ),
            const SizedBox(height: 16),
            PremiumSectionHeader(title: headline),
            const SizedBox(height: 5),
            Text(
              subHeadline,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.62),
              ),
            ),
            const SizedBox(height: 18),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder:
                  (context, index) => WorkoutListCard(
                    item: items[index],
                    onToggleFavorite:
                        () => ref
                            .read(workoutListByLevelProvider(level).notifier)
                            .toggleFavorite(index),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _label(WorkoutLevel level) => switch (level) {
    WorkoutLevel.beginner => 'Beginner',
    WorkoutLevel.intermediate => 'Intermediate',
    WorkoutLevel.advanced => 'Advanced',
  };
}

class _WorkoutActionButton extends StatelessWidget {
  const _WorkoutActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.seedLime),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
