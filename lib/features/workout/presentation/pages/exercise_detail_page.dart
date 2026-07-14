import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
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
    final l10n = AppLocalizations.of(context);

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AspectRatio(
                aspectRatio: 0.9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Hero(
                        tag: data.heroImage,
                        child: Image.asset(data.heroImage, fit: BoxFit.cover),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.05),
                            Colors.black.withValues(alpha: 0.65),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _CircleIcon(
                        icon: Icons.star_rounded,
                        color: ext.accentGlow,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: ext.accentGradient,
                          boxShadow: [
                            BoxShadow(
                              color: ext.accentGlow.withValues(alpha: 0.45),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: ext.onAccent,
                          size: 40,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      right: 16,
                      child: Text(
                        data.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ext.textMuted,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ext.glassFill,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _InfoStat(
                            icon: Icons.fitness_center_rounded,
                            label: l10n.workoutMuscleGroupLabel,
                            value: data.muscleGroup,
                            ext: ext,
                          ),
                        ),
                        Expanded(
                          child: _InfoStat(
                            icon: Icons.trending_up_rounded,
                            label: l10n.workoutDifficultyLabel,
                            value: data.level,
                            ext: ext,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoStat(
                            icon: Icons.timer_outlined,
                            label: data.duration,
                            value: data.reps,
                            ext: ext,
                          ),
                        ),
                        Expanded(
                          child: _InfoStat(
                            icon: Icons.handyman_outlined,
                            label: l10n.workoutEquipmentLabel,
                            value: data.equipment,
                            ext: ext,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(
                label: l10n.workoutStartWorkout,
                icon: Icons.play_arrow_rounded,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.32),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 19),
    );
  }
}

class _InfoStat extends StatelessWidget {
  const _InfoStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.ext,
  });

  final IconData icon;
  final String label;
  final String value;
  final AppThemeExtension ext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: ext.accentGlow.withValues(alpha: 0.14),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: ext.accentGlow, size: 19),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ext.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 13.5,
                ),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: ext.textMuted, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
