import 'package:flutter/material.dart';

/// App-wide type scale, built on Flutter's platform-default Material
/// typography (Roboto/San Francisco/etc. depending on OS). Previously used
/// `google_fonts`' Space Grotesk, which fetches the font file from
/// fonts.gstatic.com the first time it's used — on a device with no/blocked
/// internet that throws at startup. The font was never bundled as a local
/// asset either, so there's no offline path with google_fonts short of
/// shipping the .ttf file, which isn't available in this environment.
/// Platform typography has no such dependency.
abstract final class AppTypography {
  /// Design-system type scale:
  /// - H1 (tab titles)        → headlineSmall: 28 / w800
  /// - H2 (section headers)   → titleLarge:    21 / w700
  /// - Body                   → bodyLarge 15 / bodyMedium 14
  /// - Caption (fine details) → labelSmall:    12
  static TextTheme textTheme(Color baseColor) {
    final base = Typography.material2021().black;
    return base
        .copyWith(
          displayLarge: base.displayLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -1.2,
          ),
          headlineLarge: base.headlineLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.4,
          ),
          headlineSmall: base.headlineSmall?.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
          titleLarge: base.titleLarge?.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          bodyLarge: base.bodyLarge?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: base.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          labelSmall: base.labelSmall?.copyWith(fontSize: 12),
        )
        .apply(bodyColor: baseColor, displayColor: baseColor);
  }
}
