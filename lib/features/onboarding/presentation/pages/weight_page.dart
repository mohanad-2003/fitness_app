import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/onboarding_profile_controller.dart';
import '../widgets/wizard_scaffold.dart';

class WeightPage extends ConsumerStatefulWidget {
  const WeightPage({super.key});

  @override
  ConsumerState<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends ConsumerState<WeightPage> {
  static const _minWeight = 40;
  static const _maxWeight = 200;
  late final _pageController = PageController(
    viewportFraction: 0.2,
    initialPage: 35,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weight = ref.watch(onboardingProfileControllerProvider).weightKg;
    final controller = ref.read(onboardingProfileControllerProvider.notifier);

    return WizardScaffold(
      title: 'What Is Your Weight?',
      description:
          'Enter your weight to personalize your fitness plan and track your progress accurately.',
      body: Column(
        children: [
          Text(
            '$weight Kg',
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
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _maxWeight - _minWeight + 1,
              onPageChanged:
                  (index) => controller.setWeight(_minWeight + index),
              itemBuilder: (context, index) {
                final value = _minWeight + index;
                final isSelected = value == weight;
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
          onPressed: () => context.push(AppRoutes.setupHeight),
        ),
      ),
    );
  }
}
