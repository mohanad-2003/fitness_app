import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/glow_orb.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/onboarding_hero_art.dart';

/// Premium, fully-vector welcome screen — the bridge between the splash
/// screen and onboarding. No longer a photo of a person; the same abstract
/// gradient-medallion hero art used across splash/onboarding/auth so the
/// whole first-run experience reads as one design system.
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go(AppRoutes.onboarding);
    });
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

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: ext.backgroundGradient),
            ),
          ),
          Positioned(
            top: -90,
            right: -80,
            child: GlowOrb(
              color: ext.accentGlow,
              size: 280,
              opacity: theme.brightness == Brightness.dark ? 0.28 : 0.38,
            ),
          ),
          Positioned(
            bottom: -70,
            left: -100,
            child: GlowOrb(
              color: theme.colorScheme.secondary,
              size: 300,
              opacity: theme.brightness == Brightness.dark ? 0.22 : 0.3,
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: FadeTransition(
                    opacity: _fade,
                    child: SlideTransition(
                      position: _slide,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 190,
                            child: OnboardingHeroArt(
                              icon: Icons.auto_awesome_rounded,
                              colors: const [
                                AppColors.seedLime,
                                AppColors.electricOrange,
                              ],
                            ),
                          ),
                          const SizedBox(height: 22),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: l10n.splashBrandFit,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                                TextSpan(text: l10n.splashBrandBody),
                              ],
                            ),
                            style: theme.textTheme.displayLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontSize: 52,
                              fontWeight: FontWeight.w900,
                              height: 0.95,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            l10n.welcomeTagline,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: ext.textMuted,
                            ),
                          ),
                          const SizedBox(height: 26),
                          Row(
                            children: [
                              _WelcomeBadge(
                                icon: Icons.bolt_rounded,
                                label: l10n.welcomeBadgeEnergy,
                              ),
                              const SizedBox(width: 10),
                              _WelcomeBadge(
                                icon: Icons.show_chart_rounded,
                                label: l10n.welcomeBadgeProgress,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WelcomeBadge extends StatelessWidget {
  const _WelcomeBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 7),
          Text(label, style: TextStyle(color: ext.textPrimary)),
        ],
      ),
    );
  }
}
