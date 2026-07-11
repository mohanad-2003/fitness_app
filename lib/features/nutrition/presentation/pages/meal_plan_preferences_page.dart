import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
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

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WorkoutHeader(title: 'Meal plane'),
            const SizedBox(height: 30),
            _SectionTitle('Dietary Preferences'),
            const SizedBox(height: 12),
            const Text(
              'What are your dietary preferences?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            OptionSelector(
              options: MealPlanWizardController.dietaryOptions,
              selected: prefs.dietaryPreference,
              onSelected: controller.selectDietaryPreference,
              itemWidthFraction: 1,
            ),
            const SizedBox(height: 40),
            _SectionTitle('Allergies'),
            const SizedBox(height: 12),
            const Text(
              'Do you have any food allergies we should know about?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.allergyOptions,
              selected: prefs.allergy,
              onSelected: controller.selectAllergy,
            ),
            const SizedBox(height: 40),
            _SectionTitle('Meal Types'),
            const SizedBox(height: 12),
            const Text(
              'Which meals do you want to plan?',
              style: TextStyle(color: Colors.white),
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
                    color: AppColors.seedLime,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 17, color: Color(0xff232323)),
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
      style: const TextStyle(
        fontSize: 22,
        color: AppColors.seedLime,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
