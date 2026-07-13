import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Replaces the legacy `HeaderWorkout` (lib/view/header_workout.dart).
class WorkoutHeader extends StatelessWidget {
  const WorkoutHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Row(
      children: [
        if (context.canPop())
          PremiumIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => context.canPop() ? context.pop() : null,
          ),
        if (context.canPop()) const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: ext.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 10),
        PremiumIconButton(
          icon: Icons.search_rounded,
          onTap: () => context.push('/search'),
        ),
        const SizedBox(width: 10),
        PremiumIconButton(
          icon: Icons.notifications_none_rounded,
          onTap: () => context.push('/notifications'),
        ),
      ],
    );
  }
}
