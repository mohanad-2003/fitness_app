import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

const _levels = {
  ActivityLevel.beginner: 'Beginner',
  ActivityLevel.intermediate: 'Intermediate',
  ActivityLevel.advanced: 'Advance',
};

class PhysicalActivityPage extends ConsumerWidget {
  const PhysicalActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected =
        ref.watch(onboardingProfileControllerProvider).activityLevel;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);

    return WizardScaffold(
      title: 'Physical Activity Level',
      description:
          'Select your physical activity level to personalize your fitness plan.',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            for (final entry in _levels.entries) ...[
              _ActivityButton(
                label: entry.value,
                isSelected: selected == entry.key,
                onTap: () => controller.selectActivityLevel(entry.key),
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
          onPressed: () => context.push(AppRoutes.setupFillProfile),
        ),
      ),
    );
  }
}

class _ActivityButton extends StatelessWidget {
  const _ActivityButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFFE2F163)
                  : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
