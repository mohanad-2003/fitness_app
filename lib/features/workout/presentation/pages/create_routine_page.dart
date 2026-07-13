import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/presentation/providers/create_routine_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/routine_grid_card.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateRoutinePage extends ConsumerWidget {
  const CreateRoutinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(createRoutineControllerProvider);
    final controller = ref.read(createRoutineControllerProvider.notifier);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutHeader(title: l10n.workoutCreateRoutineTitle),
          const SizedBox(height: 8),
          Text(
            l10n.workoutCreateRoutineSubtitle,
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
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final item = exercises[index];
                return RoutineGridCard(
                  image: item.image,
                  title: item.name,
                  time: item.time,
                  reps: item.rep,
                  isFavorite: item.isFavorite,
                  onFavoriteTap: () => controller.toggleFavorite(index),
                  actionIcon:
                      item.isAdded ? Icons.check_rounded : Icons.add_rounded,
                  actionColor:
                      item.isAdded
                          ? ext.accentGlow
                          : theme.colorScheme.secondary,
                  onActionTap: () => controller.toggleAdded(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
