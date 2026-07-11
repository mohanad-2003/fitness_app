import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/home/domain/home_models.dart';
import 'package:flutter/material.dart';

class HomeRecommendationCard extends StatelessWidget {
  const HomeRecommendationCard({super.key, required this.workout, this.onTap});

  final RecommendedWorkout workout;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.05),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    workout.image,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.star, color: AppColors.seedLime),
                ),
                Positioned(
                  bottom: -12,
                  right: 8,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppColors.seedViolet,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title,
                    style: const TextStyle(
                      color: AppColors.seedLime,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled_rounded,
                        color: AppColors.seedViolet,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        workout.duration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.local_fire_department,
                        color: AppColors.seedViolet,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        workout.calories,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
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
  }
}
