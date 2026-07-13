import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/popular_exercises_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutRecommendedPage extends ConsumerWidget {
  const WorkoutRecommendedPage({super.key, this.featured});

  final ExerciseDetailData? featured;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popular = ref.watch(popularExercisesProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final featuredData =
        featured ??
        ExerciseDetailData(
          headerTitle: l10n.workoutRecommendationsTitle,
          heroImage: 'assets/dum.png',
          title: 'dumbbell step up',
          duration: '12 Minute',
          reps: '120 Kcal',
        );

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WorkoutHeader(title: l10n.workoutRecommendationsTitle),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: GestureDetector(
                onTap:
                    () => context.push(
                      AppRoutes.exerciseDetail,
                      extra: featuredData,
                    ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        featuredData.heroImage,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: ext.accentGlow,
                        ),
                        child: Text(
                          featuredData.title,
                          style: TextStyle(
                            fontSize: 12,
                            color: ext.onAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.3),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/time.png', color: Colors.white),
                            const SizedBox(width: 5),
                            Text(
                              featuredData.duration,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Image.asset(
                              'assets/calories.png',
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              featuredData.reps,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.star, color: ext.accentGlow),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.workoutMostPopular,
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: popular.length,
                    itemBuilder: (context, index) {
                      final item = popular[index];
                      return GestureDetector(
                        onTap:
                            () => context.push(
                              AppRoutes.exerciseDetail,
                              extra: ExerciseDetailData(
                                headerTitle: l10n.workoutRecommendationsTitle,
                                heroImage: item.image,
                                title: item.name,
                                duration: item.time,
                                reps: item.calories,
                              ),
                            ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ext.glassFill,
                            border: Border.all(color: ext.glassBorder),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      item.image,
                                      width: double.infinity,
                                      height: 92,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -10,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 12.5,
                                      backgroundColor: theme.colorScheme.secondary,
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/time.png',
                                          color: theme.colorScheme.secondary,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          item.time,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
