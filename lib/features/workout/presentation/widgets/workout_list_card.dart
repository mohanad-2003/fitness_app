import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/icon_stat.dart';
import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:flutter/material.dart';

class WorkoutListCard extends StatelessWidget {
  const WorkoutListCard({
    super.key,
    required this.item,
    required this.onToggleFavorite,
  });

  final WorkoutListItem item;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if (item.time != null)
                        IconStat(
                          icon: 'assets/time.png',
                          label: item.time!,
                          color: Colors.white.withValues(alpha: 0.74),
                        ),
                      const SizedBox(width: 10),
                      if (item.calories != null)
                        IconStat(
                          icon: 'assets/calories.png',
                          label: item.calories!,
                          color: Colors.white.withValues(alpha: 0.74),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (item.exercises != null)
                    IconStat(
                      icon: 'assets/run.png',
                      label: item.exercises!,
                      color: Colors.white.withValues(alpha: 0.74),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: onToggleFavorite,
                    child: Icon(
                      Icons.star_rate_rounded,
                      color:
                          item.isFavorite ? AppColors.seedLime : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
