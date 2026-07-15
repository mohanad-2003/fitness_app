import 'package:flutter/material.dart';

/// Soft radial-gradient blur blob used as a premium ambient backdrop accent
/// on hero surfaces (splash, onboarding). Purely decorative.
class GlowOrb extends StatelessWidget {
  const GlowOrb({
    super.key,
    required this.color,
    required this.size,
    this.opacity = 0.30,
  });

  final Color color;
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
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
      ),
    );
  }
}
