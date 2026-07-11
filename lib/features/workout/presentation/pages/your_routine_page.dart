import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/your_routine_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class YourRoutinePage extends ConsumerWidget {
  const YourRoutinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routine = ref.watch(yourRoutineControllerProvider);
    final controller = ref.read(yourRoutineControllerProvider.notifier);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WorkoutHeader(title: 'Your Routine'),
          const SizedBox(height: 20),
          Text(
            'Round 1',
            style: TextStyle(fontSize: 20, color: AppColors.seedLime),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: routine.length,
              itemBuilder: (context, index) {
                final item = routine[index];
                return GestureDetector(
                  onTap:
                      () => context.push(
                        AppRoutes.exerciseDetail,
                        extra: ExerciseDetailData(
                          headerTitle: 'Your Routine',
                          heroImage: item.image,
                          title: item.title,
                          duration: item.time,
                          reps: item.rep,
                        ),
                      ),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(20),
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
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                item.image,
                                width: double.infinity,
                                height: 92,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () => controller.toggleFavorite(index),
                                child: Icon(
                                  Icons.star_outlined,
                                  color:
                                      item.isFavorite
                                          ? AppColors.seedLime
                                          : Colors.white,
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: -10,
                              right: 5,
                              child: CircleAvatar(
                                radius: 11.5,
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
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  color: AppColors.seedLime,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/time.png',
                                        color: AppColors.seedViolet,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        item.time,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/calories.png',
                                        color: AppColors.seedViolet,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        item.rep,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
          ),
        ],
      ),
    );
  }
}
