import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/icon_stat.dart';
import 'package:flutter/material.dart';

/// The hero image card (top-right label badge, bottom translucent stats
/// bar, star icon) duplicated across WorkoutPage, AdvanceCategory,
/// IntermediateCategory, and FunctionalPage with only the data changing.
class TrainingHeroCard extends StatelessWidget {
  const TrainingHeroCard({
    super.key,
    required this.image,
    required this.badgeLabel,
    required this.time,
    required this.calories,
    required this.levelLabel,
    this.height = 220,
    this.onTap,
  });

  final String image;
  final String badgeLabel;
  final String time;
  final String calories;
  final String levelLabel;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.24),
              blurRadius: 26,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                color: Colors.black.withValues(alpha: 0.12),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.seedInk.withValues(alpha: 0.92),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.seedLime, AppColors.electricOrange],
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Center(
                  child: Text(
                    badgeLabel,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: AppColors.seedInk,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(14),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconStat(icon: 'assets/time.png', label: time),
                    IconStat(icon: 'assets/calories.png', label: calories),
                    IconStat(icon: 'assets/run.png', label: levelLabel),
                    const Icon(Icons.star, color: Colors.white, size: 22),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
