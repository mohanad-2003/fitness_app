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

class MealPlanPreferencesPage extends ConsumerWidget {
  const MealPlanPreferencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(mealPlanWizardControllerProvider);
    final controller = ref.read(mealPlanWizardControllerProvider.notifier);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutHeader(title: l10n.mealPlanTitle),
            const SizedBox(height: 30),
            _SectionTitle(l10n.mealPlanDietaryPreferences),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanDietaryPreferencesQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 20),
            OptionSelector(
              options: MealPlanWizardController.dietaryOptions,
              selected: prefs.dietaryPreference,
              onSelected: controller.selectDietaryPreference,
              itemWidthFraction: 1,
            ),
            const SizedBox(height: 40),
            _SectionTitle(l10n.mealPlanAllergies),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanAllergiesQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.allergyOptions,
              selected: prefs.allergy,
              onSelected: controller.selectAllergy,
            ),
            const SizedBox(height: 40),
            _SectionTitle(l10n.mealPlanMealTypes),
            const SizedBox(height: 12),
            Text(
              l10n.mealPlanMealTypesQuestion,
              style: TextStyle(color: ext.textPrimary),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.mealTypeOptions,
              selected: prefs.mealType,
              onSelected: controller.selectMealType,
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () => context.push(AppRoutes.mealPlanGoals),
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      l10n.actionContinue,
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.onPrimary,
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
