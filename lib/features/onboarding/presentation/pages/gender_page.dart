import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

class GenderPage extends ConsumerWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(onboardingProfileControllerProvider).gender;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);

    return WizardScaffold(
      title: 'What’s Your Gender',
      description:
          'Select your gender to personalize your fitness plan and track your progress more accurately.',
      body: Column(
        children: [
          _GenderOption(
            image: 'assets/male.png',
            label: 'Male',
            isSelected: selected == Gender.male,
            onTap: () => controller.selectGender(Gender.male),
          ),
          const SizedBox(height: 20),
          _GenderOption(
            image: 'assets/female.jpg',
            label: 'Female',
            isSelected: selected == Gender.female,
            onTap: () => controller.selectGender(Gender.female),
          ),
        ],
      ),
      button: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PrimaryButton(
          label: 'Continue',
          onPressed: () => context.push(AppRoutes.setupAge),
        ),
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 162,
            height: 162,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected
                      ? const Color(0xFFE2F163)
                      : const Color(0xFF232323),
              border: Border.all(color: Colors.white),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.greenAccent.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Center(child: Image.asset(image, width: 64, height: 67)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
