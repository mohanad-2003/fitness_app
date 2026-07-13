import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';

/// Generic exercise video/detail screen — replaces the legacy squat_page,
/// kettlball, video_advance, details_page, and details_dumple_setup, which
/// were the same layout copy-pasted with different hardcoded strings.
class ExerciseDetailPage extends StatelessWidget {
  const ExerciseDetailPage({super.key, required this.data});

  final ExerciseDetailData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: WorkoutHeader(title: data.headerTitle),
            ),
            const SizedBox(height: 10),
            Container(
              height: 420,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ext.glassFill,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: ext.glassBorder),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        data.heroImage,
                        width: 323,
                        height: 380,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(Icons.star, color: ext.accentGlow),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: ext.accentGradient,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/play.png',
                          height: 60,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ext.glassFill,
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: ext.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: ext.textMuted),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 36,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ext.glassFill,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _stat('assets/time.png', data.duration, ext),
                            _stat('assets/calories.png', data.reps, ext),
                            _stat('assets/run.png', data.level, ext),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String icon, String label, AppThemeExtension ext) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(icon, width: 10, height: 11, color: ext.accentGlow),
        const SizedBox(width: 5),
        Text(label, style: TextStyle(color: ext.textPrimary, fontSize: 14)),
      ],
    );
  }
}
