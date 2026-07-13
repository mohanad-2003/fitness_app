import 'dart:async';

import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _fadeIn;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();

    _logoScale = Tween<double>(
      begin: 0.86,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) context.go(AppRoutes.welcome);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/ob1.png',
              fit: BoxFit.cover,
              color: theme.colorScheme.scrim.withValues(alpha: 0.34),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.surface.withValues(alpha: 0.96),
                    theme.colorScheme.surface.withValues(alpha: 0.74),
                    theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.92,
                    ),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -90,
            child: _SplashGlow(color: theme.colorScheme.primary, size: 260),
          ),
          Positioned(
            bottom: 90,
            left: -140,
            child: _SplashGlow(color: theme.colorScheme.secondary, size: 320),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeIn.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Transform.scale(
                          scale: _logoScale.value,
                          alignment: AlignmentDirectional.centerStart,
                          child: Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest
                                  .withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(34),
                              border: Border.all(
                                color: theme.colorScheme.outline.withValues(
                                  alpha: 0.12,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(
                                    alpha: 0.20,
                                  ),
                                  blurRadius: 40,
                                  offset: const Offset(0, 18),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Image.asset('assets/FB.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: l10n.splashBrandFit,
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(text: l10n.splashBrandBody),
                            ],
                          ),
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontSize: 58,
                            height: 0.94,
                            letterSpacing: -2,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.splashTagline,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.78,
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            _MetricPill(
                              label: '12K+',
                              value: l10n.splashMetricWorkouts,
                            ),
                            const SizedBox(width: 10),
                            _MetricPill(
                              label: 'Pro',
                              value: l10n.splashMetricPlans,
                            ),
                          ],
                        ),
                        const SizedBox(height: 42),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            minHeight: 5,
                            value: _controller.value,
                            backgroundColor: theme
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.10),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.10,
        ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.12),
        ),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.70),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashGlow extends StatelessWidget {
  const _SplashGlow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: 0.28), color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}
