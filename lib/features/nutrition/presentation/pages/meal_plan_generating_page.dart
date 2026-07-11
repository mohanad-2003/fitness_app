import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
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
    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WorkoutHeader(title: 'Meals Plans'),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: AppColors.seedViolet, width: 7),
                      ),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.seedViolet,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Creating a plan for you',
                    style: TextStyle(color: AppColors.seedLime, fontSize: 18),
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
