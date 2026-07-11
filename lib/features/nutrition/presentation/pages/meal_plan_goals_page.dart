import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
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

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WorkoutHeader(title: 'Meal Plans'),
            const SizedBox(height: 30),
            const Text(
              'Caloric Goal',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.seedLime,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'What is your daily caloric intake goal?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.caloricGoalOptions,
              selected: prefs.caloricGoal,
              onSelected: controller.selectCaloricGoal,
              itemWidthFraction: 1,
            ),
            const SizedBox(height: 40),
            const Text(
              'Cooking Time Preference',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.seedLime,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'How much time are you willing to spend cooking each meal?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            OptionSelector(
              options: MealPlanWizardController.cookingTimeOptions,
              selected: prefs.cookingTime,
              onSelected: controller.selectCookingTime,
            ),
            const SizedBox(height: 40),
            const Text(
              'Number of Servings',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.seedLime,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'How many servings do you need per meal?',
              style: TextStyle(color: Colors.white),
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
                    color: AppColors.seedLime,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Create',
                      style: TextStyle(fontSize: 18, color: Color(0xff232323)),
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
