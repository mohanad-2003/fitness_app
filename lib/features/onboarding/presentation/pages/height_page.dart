import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

class HeightPage extends ConsumerStatefulWidget {
  const HeightPage({super.key});

  @override
  ConsumerState<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends ConsumerState<HeightPage> {
  static const _minHeight = 140;
  static const _maxHeight = 210;
  late final _pageController = PageController(
    viewportFraction: 0.25,
    initialPage: 25,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ref.watch(onboardingProfileControllerProvider).heightCm;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);
    final screenHeight = MediaQuery.of(context).size.height;

    return WizardScaffold(
      title: 'What Is Your Height',
      description:
          'Enter your height to personalize your fitness plan and track your progress accurately.',
      body: Column(
        children: [
          Text(
            '$height cm',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.arrow_drop_up_outlined,
            size: 60,
            color: Color(0xFFE2F163),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: screenHeight * 0.3,
            width: 60,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: _maxHeight - _minHeight + 1,
              onPageChanged:
                  (index) => controller.setHeight(_minHeight + index),
              itemBuilder: (context, index) {
                final value = _minHeight + index;
                final isSelected = value == height;
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
          onPressed: () => context.push(AppRoutes.setupGoal),
        ),
      ),
    );
  }
}
