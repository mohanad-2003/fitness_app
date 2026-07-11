import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.image,
    required this.kicker,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String image;
  final String kicker;
  final String title;
  final String description;
  final IconData icon;
}

const _slides = [
  _OnboardingSlide(
    image: 'assets/ob1.png',
    kicker: 'START STRONG',
    title: 'Build a body that keeps up with your ambition.',
    description:
        'Personalized training flows help you start today and stay consistent tomorrow.',
    icon: Icons.bolt_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob2.png',
    kicker: 'TRACK EVERY REP',
    title: 'See your workouts, streaks, and progress in one place.',
    description:
        'Turn effort into insight with daily metrics and clear performance feedback.',
    icon: Icons.monitor_heart_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob3.png',
    kicker: 'TRAIN SMARTER',
    title: 'Find strength, cardio, yoga, and HIIT sessions fast.',
    description:
        'Choose the right intensity for your day and move with confidence.',
    icon: Icons.fitness_center_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob4.png',
    kicker: 'REACH GOALS',
    title: 'Healthy habits become your unfair advantage.',
    description:
        'Stay motivated with progress milestones, challenges, and routines built for real life.',
    icon: Icons.emoji_events_rounded,
  ),
];

class OnboardingCarouselPage extends StatefulWidget {
  const OnboardingCarouselPage({super.key});

  @override
  State<OnboardingCarouselPage> createState() => _OnboardingCarouselPageState();
}

class _OnboardingCarouselPageState extends State<OnboardingCarouselPage> {
  final _controller = PageController();
  int _currentIndex = 0;

  void _finish() => context.go(AppRoutes.login);

  void _goToNextSlide() {
    if (_currentIndex < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 520),
        curve: Curves.easeOutCubic,
      );
    } else {
      _finish();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _slides.length - 1;

    return Scaffold(
      backgroundColor: AppColors.seedInk,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _slides.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) => _SlidePage(slide: _slides[index]),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.12),
                          ),
                        ),
                        child: const Text(
                          'FITBODY',
                          style: TextStyle(
                            color: AppColors.seedLime,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _finish,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.78),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      for (var i = 0; i < _slides.length; i++)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 260),
                          curve: Curves.easeOutCubic,
                          margin: const EdgeInsets.only(right: 8),
                          width: i == _currentIndex ? 34 : 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color:
                                i == _currentIndex
                                    ? AppColors.seedLime
                                    : Colors.white.withValues(alpha: 0.28),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: _goToNextSlide,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.seedLime,
                          foregroundColor: AppColors.seedInk,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        icon: Icon(
                          isLast
                              ? Icons.check_rounded
                              : Icons.arrow_forward_rounded,
                        ),
                        label: Text(isLast ? 'Get Started' : 'Next'),
                      ),
                    ],
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

class _SlidePage extends StatelessWidget {
  const _SlidePage({required this.slide});

  final _OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(slide.image, fit: BoxFit.cover)),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.seedInk.withValues(alpha: 0.40),
                  AppColors.seedInk.withValues(alpha: 0.56),
                  AppColors.seedInk.withValues(alpha: 0.98),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: 112,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.graphite.withValues(alpha: 0.74),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.34),
                  blurRadius: 30,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.seedLime,
                            AppColors.electricOrange,
                          ],
                        ),
                      ),
                      child: Icon(slide.icon, color: AppColors.seedInk),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      slide.kicker,
                      style: const TextStyle(
                        color: AppColors.seedLime,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  slide.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    height: 1.02,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  slide.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.74),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
