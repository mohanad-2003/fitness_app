import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

const _goals = [
  'Lose Weight',
  'Gain Weight',
  'Muscle Mass Gain',
  'Shape Body',
  'Others',
];

class GoalPage extends ConsumerWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGoal = ref.watch(onboardingProfileControllerProvider).goal;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);

    return WizardScaffold(
      title: 'What Is Your Goal?',
      description:
          'Choose your fitness goal to personalize your workout and diet plan.',
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            for (final goal in _goals) ...[
              _GoalItem(
                goal: goal,
                isSelected: selectedGoal == goal,
                onTap: () => controller.selectGoal(goal),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
      button: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PrimaryButton(
          label: 'Continue',
          onPressed: () => context.push(AppRoutes.setupPhysical),
        ),
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  const _GoalItem({
    required this.goal,
    required this.isSelected,
    required this.onTap,
  });

  final String goal;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFFE2F163)
                  : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              goal,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.white,
                  width: 3,
                ),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.black, size: 20)
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
