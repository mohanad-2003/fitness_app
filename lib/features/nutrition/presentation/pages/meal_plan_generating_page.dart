import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';

class MealPlanGeneratingPage extends StatefulWidget {
  const MealPlanGeneratingPage({super.key});

  @override
  State<MealPlanGeneratingPage> createState() => _MealPlanGeneratingPageState();
}

class _MealPlanGeneratingPageState extends State<MealPlanGeneratingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.go(AppRoutes.mealPlanBreakfast);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutHeader(title: l10n.nutritionTabMealPlans),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: theme.colorScheme.secondary, width: 7),
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l10n.mealPlanGeneratingTitle,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
