import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/your_routine_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/routine_grid_card.dart';
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

    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutHeader(title: l10n.workoutYourRoutineTitle),
          const SizedBox(height: 8),
          Text(
            l10n.workoutRoundNumber(1),
            style: theme.textTheme.titleLarge?.copyWith(
              color: ext.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            l10n.workoutYourRoutineSubtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(color: ext.textMuted),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.88,
              ),
              itemCount: routine.length,
              itemBuilder: (context, index) {
                final item = routine[index];
                return RoutineGridCard(
                  image: item.image,
                  title: item.title,
                  time: item.time,
                  reps: item.rep,
                  isFavorite: item.isFavorite,
                  onFavoriteTap: () => controller.toggleFavorite(index),
                  actionIcon: Icons.play_arrow_rounded,
                  onActionTap:
                      () => context.push(
                        AppRoutes.exerciseDetail,
                        extra: ExerciseDetailData(
                          headerTitle: l10n.workoutYourRoutineTitle,
                          heroImage: item.image,
                          title: item.title,
                          duration: item.time,
                          reps: item.rep,
                        ),
                      ),
                  onTap:
                      () => context.push(
                        AppRoutes.exerciseDetail,
                        extra: ExerciseDetailData(
                          headerTitle: l10n.workoutYourRoutineTitle,
                          heroImage: item.image,
                          title: item.title,
                          duration: item.time,
                          reps: item.rep,
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
