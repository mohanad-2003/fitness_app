import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Shared dark gradient backdrop for the auth/onboarding flow. Previously
/// this exact `BoxDecoration` was copy-pasted into 12+ legacy screens
/// (login, signup, setup, gender, age, height, weight, goal, physical,
/// fill-profile, forgot-password, set-password).
class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.child,
    this.scrollable = true,
  });

  final Widget child;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(child: child);
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.seedInk),
      child: Stack(
        children: [
          Positioned(
            top: -120,
            right: -90,
            child: _GlowOrb(
              size: 260,
              color: AppColors.seedLime,
              opacity: 0.24,
            ),
          ),
          Positioned(
            bottom: -90,
            left: -110,
            child: _GlowOrb(
              size: 280,
              color: AppColors.electricOrange,
              opacity: 0.18,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.midnight,
                    AppColors.seedInk,
                    AppColors.graphite.withValues(alpha: 0.96),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: scrollable ? SingleChildScrollView(child: content) : content,
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({
    required this.size,
    required this.color,
    required this.opacity,
  });

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: opacity),
            color.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
