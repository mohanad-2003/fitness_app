import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../providers/meal_plan_wizard_controller.dart';
import '../widgets/option_selector.dart';

class MealPlanGoalsPage extends ConsumerWidget {
  const MealPlanGoalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(mealPlanWizardControllerProvider);
    final controller = ref.read(mealPlanWizardControllerProvider.notifier);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutHeader(title: l10n.nutritionTabMealPlans),
            const SizedBox(height: 30),
            Text(
              l10n.mealPlanCaloricGoal,
              style: TextStyle(
                fontSize: 22,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanCaloricGoalQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.caloricGoalOptions,
              selected: prefs.caloricGoal,
              onSelected: controller.selectCaloricGoal,
              itemWidthFraction: 1,
            ),
            const SizedBox(height: 40),
            Text(
              l10n.mealPlanCookingTime,
              style: TextStyle(
                fontSize: 22,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanCookingTimeQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.cookingTimeOptions,
              selected: prefs.cookingTime,
              onSelected: controller.selectCookingTime,
            ),
            const SizedBox(height: 40),
            Text(
              l10n.mealPlanServings,
              style: TextStyle(
                fontSize: 22,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanServingsQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.servingOptions,
              selected: prefs.servings,
              onSelected: controller.selectServings,
            ),
            const SizedBox(height: 40),
            Center(
              child: GestureDetector(
                onTap: () => context.push(AppRoutes.mealPlanGenerating),
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      l10n.mealPlanCreate,
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
