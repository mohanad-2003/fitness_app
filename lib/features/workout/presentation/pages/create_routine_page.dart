import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/presentation/providers/create_routine_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateRoutinePage extends ConsumerWidget {
  const CreateRoutinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(createRoutineControllerProvider);
    final controller = ref.read(createRoutineControllerProvider.notifier);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WorkoutHeader(title: 'Create your routine'),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final item = exercises[index];
                return Container(
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
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
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
                                Icons.star_rate_rounded,
                                color:
                                    item.isFavorite
                                        ? AppColors.seedLime
                                        : Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -15,
                            right: 10,
                            child: GestureDetector(
                              onTap: () => controller.toggleAdded(index),
                              child: Container(
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      item.isAdded
                                          ? AppColors.seedLime
                                          : AppColors.seedViolet,
                                ),
                                child: Center(
                                  child:
                                      item.isAdded
                                          ? Image.asset('assets/check.png')
                                          : const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                color: AppColors.seedLime,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color: Colors.white60,
                                        fontSize: 12,
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
                                        color: Colors.white60,
                                        fontSize: 12,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
