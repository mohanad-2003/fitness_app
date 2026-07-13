import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.image,
    required this.kickerKey,
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
  });

  final String image;
  final String kickerKey;
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
}

const _slides = [
  _OnboardingSlide(
    image: 'assets/ob1.png',
    kickerKey: 'onboardingSlide1Kicker',
    titleKey: 'onboardingSlide1Title',
    descriptionKey: 'onboardingSlide1Description',
    icon: Icons.bolt_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob2.png',
    kickerKey: 'onboardingSlide2Kicker',
    titleKey: 'onboardingSlide2Title',
    descriptionKey: 'onboardingSlide2Description',
    icon: Icons.monitor_heart_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob3.png',
    kickerKey: 'onboardingSlide3Kicker',
    titleKey: 'onboardingSlide3Title',
    descriptionKey: 'onboardingSlide3Description',
    icon: Icons.fitness_center_rounded,
  ),
  _OnboardingSlide(
    image: 'assets/ob4.png',
    kickerKey: 'onboardingSlide4Kicker',
    titleKey: 'onboardingSlide4Title',
    descriptionKey: 'onboardingSlide4Description',
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
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final isLast = _currentIndex == _slides.length - 1;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
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
                          color: theme.colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: theme.colorScheme.outline.withValues(
                              alpha: 0.12,
                            ),
                          ),
                        ),
                        child: Text(
                          l10n.onboardingBrand,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _finish,
                        child: Text(
                          l10n.onboardingSkip,
                          style: TextStyle(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.78,
                            ),
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
                          margin: const EdgeInsetsDirectional.only(end: 8),
                          width: i == _currentIndex ? 34 : 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color:
                                i == _currentIndex
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.surfaceContainerHighest
                                        .withValues(alpha: 0.28),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: _goToNextSlide,
                        style: FilledButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
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
                        label: Text(
                          isLast
                              ? l10n.onboardingGetStarted
                              : l10n.onboardingNext,
                        ),
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
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final kicker = switch (slide.kickerKey) {
      'onboardingSlide1Kicker' => l10n.onboardingSlide1Kicker,
      'onboardingSlide2Kicker' => l10n.onboardingSlide2Kicker,
      'onboardingSlide3Kicker' => l10n.onboardingSlide3Kicker,
      'onboardingSlide4Kicker' => l10n.onboardingSlide4Kicker,
      _ => '',
    };
    final title = switch (slide.titleKey) {
      'onboardingSlide1Title' => l10n.onboardingSlide1Title,
      'onboardingSlide2Title' => l10n.onboardingSlide2Title,
      'onboardingSlide3Title' => l10n.onboardingSlide3Title,
      'onboardingSlide4Title' => l10n.onboardingSlide4Title,
      _ => '',
    };
    final description = switch (slide.descriptionKey) {
      'onboardingSlide1Description' => l10n.onboardingSlide1Description,
      'onboardingSlide2Description' => l10n.onboardingSlide2Description,
      'onboardingSlide3Description' => l10n.onboardingSlide3Description,
      'onboardingSlide4Description' => l10n.onboardingSlide4Description,
      _ => '',
    };

    return Stack(
      children: [
        Positioned.fill(child: Image.asset(slide.image, fit: BoxFit.cover)),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.surface.withValues(alpha: 0.40),
                  theme.colorScheme.surface.withValues(alpha: 0.56),
                  theme.colorScheme.surface.withValues(alpha: 0.98),
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
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.74,
              ),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.12),
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.34),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                        ),
                      ),
                      child: Icon(
                        slide.icon,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      kicker,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    height: 1.02,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.74),
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
