import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/pressable_scale.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/onboarding_hero_art.dart';
import '../widgets/onboarding_page_indicator.dart';

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.icon,
    required this.colors,
    required this.kickerKey,
    required this.titleKey,
    required this.descriptionKey,
  });

  final IconData icon;
  final List<Color> colors;
  final String kickerKey;
  final String titleKey;
  final String descriptionKey;
}

const _slides = [
  _OnboardingSlide(
    icon: Icons.bolt_rounded,
    colors: [AppColors.seedLime, AppColors.aquaBlue],
    kickerKey: 'onboardingSlide1Kicker',
    titleKey: 'onboardingSlide1Title',
    descriptionKey: 'onboardingSlide1Description',
  ),
  _OnboardingSlide(
    icon: Icons.monitor_heart_rounded,
    colors: [AppColors.seedViolet, AppColors.aquaBlue],
    kickerKey: 'onboardingSlide2Kicker',
    titleKey: 'onboardingSlide2Title',
    descriptionKey: 'onboardingSlide2Description',
  ),
  _OnboardingSlide(
    icon: Icons.fitness_center_rounded,
    colors: [AppColors.electricOrange, AppColors.seedLime],
    kickerKey: 'onboardingSlide3Kicker',
    titleKey: 'onboardingSlide3Title',
    descriptionKey: 'onboardingSlide3Description',
  ),
  _OnboardingSlide(
    icon: Icons.emoji_events_rounded,
    colors: [AppColors.seedViolet, AppColors.electricOrange],
    kickerKey: 'onboardingSlide4Kicker',
    titleKey: 'onboardingSlide4Title',
    descriptionKey: 'onboardingSlide4Description',
  ),
];

class OnboardingCarouselPage extends StatefulWidget {
  const OnboardingCarouselPage({super.key});

  @override
  State<OnboardingCarouselPage> createState() =>
      _OnboardingCarouselPageState();
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
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final isLast = _currentIndex == _slides.length - 1;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: ext.backgroundGradient),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: _slides.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder:
                (context, index) => _SlidePage(
                  slide: _slides[index],
                  index: index,
                  controller: _controller,
                ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 26),
              child: Column(
                children: [
                  FadeSlideIn(
                    offset: const Offset(0, -0.3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: ext.glassFill,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: ext.glassBorder),
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
                        PressableScale(
                          child: TextButton(
                            onPressed: _finish,
                            style: TextButton.styleFrom(
                              backgroundColor: ext.glassFill,
                              foregroundColor: ext.textMuted,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              l10n.onboardingSkip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 120),
                    child: Row(
                      children: [
                        OnboardingPageIndicator(
                          count: _slides.length,
                          currentIndex: _currentIndex,
                        ),
                        const Spacer(),
                        _NextButton(
                          isLast: isLast,
                          label:
                              isLast
                                  ? l10n.onboardingGetStarted
                                  : l10n.onboardingNext,
                          onPressed: _goToNextSlide,
                        ),
                      ],
                    ),
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
  const _SlidePage({
    required this.slide,
    required this.index,
    required this.controller,
  });

  final _OnboardingSlide slide;
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        var t = 0.0;
        if (controller.hasClients && controller.position.haveDimensions) {
          final page = controller.page ?? index.toDouble();
          t = (page - index).clamp(-1.0, 1.0);
        }
        final fade = (1 - t.abs()).clamp(0.0, 1.0);
        return Opacity(
          opacity: fade,
          child: Transform.translate(offset: Offset(t * 44, 0), child: child),
        );
      },
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 96, 24, 150),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 6,
                    child: OnboardingHeroArt(
                      icon: slide.icon,
                      colors: slide.colors,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Expanded(flex: 5, child: _SlideTextCard(slide: slide)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SlideTextCard extends StatelessWidget {
  const _SlideTextCard({required this.slide});

  final _OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
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

    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: ext.glassFill,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: ext.glassBorder),
            boxShadow:
                theme.brightness == Brightness.dark
                    ? const []
                    : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 30,
                        offset: const Offset(0, 14),
                      ),
                    ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: slide.colors),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  kicker,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: ext.textPrimary,
                  height: 1.08,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: ext.textMuted,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    required this.isLast,
    required this.label,
    required this.onPressed,
  });

  final bool isLast;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return PressableScale(
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          decoration: BoxDecoration(
            gradient: ext.accentGradient,
            borderRadius: BorderRadius.circular(999),
            boxShadow: [
              BoxShadow(
                color: ext.accentGlow.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: ext.onAccent,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                isLast ? Icons.check_rounded : Icons.arrow_forward_rounded,
                color: ext.onAccent,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
