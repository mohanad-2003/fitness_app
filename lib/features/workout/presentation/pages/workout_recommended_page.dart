import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/popular_exercises_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const _defaultFeatured = ExerciseDetailData(
  headerTitle: 'Recommendations',
  heroImage: 'assets/dum.png',
  title: 'dumbbell step up',
  duration: '12 Minute',
  reps: '120 Kcal',
);

class WorkoutRecommendedPage extends ConsumerWidget {
  const WorkoutRecommendedPage({super.key, this.featured = _defaultFeatured});

  final ExerciseDetailData featured;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popular = ref.watch(popularExercisesProvider);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: WorkoutHeader(title: 'Recommendations'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: GestureDetector(
                onTap:
                    () =>
                        context.push(AppRoutes.exerciseDetail, extra: featured),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        featured.heroImage,
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
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: AppColors.seedLime,
                        ),
                        child: Text(
                          featured.title,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.seedInk,
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
                              featured.duration,
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
                              featured.reps,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.star, color: AppColors.seedLime),
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
                  const Text(
                    'Most Popular',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.seedLime,
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
                                headerTitle: 'Recommendations',
                                heroImage: item.image,
                                title: item.name,
                                duration: item.time,
                                reps: item.calories,
                              ),
                            ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withValues(alpha: 0.06),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.10),
                            ),
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
                                  const Positioned(
                                    bottom: -10,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 12.5,
                                      backgroundColor: AppColors.seedViolet,
                                      child: Icon(
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
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.seedLime,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/time.png',
                                          color: AppColors.seedViolet,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          item.time,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.seedLime,
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
