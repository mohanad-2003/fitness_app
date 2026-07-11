import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

class AgePage extends ConsumerStatefulWidget {
  const AgePage({super.key});

  @override
  ConsumerState<AgePage> createState() => _AgePageState();
}

class _AgePageState extends ConsumerState<AgePage> {
  static const _minAge = 10;
  static const _maxAge = 40;
  late final _pageController = PageController(
    viewportFraction: 0.2,
    initialPage: 18,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final age = ref.watch(onboardingProfileControllerProvider).age;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);

    return WizardScaffold(
      title: 'How Old Are You?',
      description:
          'Select your age to personalize your fitness plan and track your progress.',
      body: Column(
        children: [
          Text(
            '$age',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Icon(Icons.arrow_drop_up, color: Color(0xFFE2F163), size: 60),
          const SizedBox(height: 20),
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _maxAge - _minAge + 1,
              onPageChanged: (index) => controller.setAge(_minAge + index),
              itemBuilder: (context, index) {
                final value = _minAge + index;
                final isSelected = value == age;
                return Center(
                  child: Text(
                    '$value',
                    style: TextStyle(
                      fontSize: isSelected ? 40 : 30,
                      color: isSelected ? Colors.white : Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      button: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PrimaryButton(
          label: 'Continue',
          onPressed: () => context.push(AppRoutes.setupWeight),
        ),
      ),
    );
  }
}
