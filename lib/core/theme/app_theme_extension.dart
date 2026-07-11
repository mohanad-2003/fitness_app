import 'package:flutter/material.dart';

/// Custom design tokens not covered by [ThemeData] directly (card styling,
/// gradients, semantic status colors). Access via `Theme.of(context).extension<AppThemeExtension>()`.
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.cardColor,
    required this.cardBorderColor,
    required this.cardShadow,
    required this.accentGradient,
    required this.success,
    required this.warning,
    required this.danger,
  });

  final Color cardColor;
  final Color cardBorderColor;
  final List<BoxShadow> cardShadow;
  final Gradient accentGradient;
  final Color success;
  final Color warning;
  final Color danger;

  @override
  AppThemeExtension copyWith({
    Color? cardColor,
    Color? cardBorderColor,
    List<BoxShadow>? cardShadow,
    Gradient? accentGradient,
    Color? success,
    Color? warning,
    Color? danger,
  }) {
    return AppThemeExtension(
      cardColor: cardColor ?? this.cardColor,
      cardBorderColor: cardBorderColor ?? this.cardBorderColor,
      cardShadow: cardShadow ?? this.cardShadow,
      accentGradient: accentGradient ?? this.accentGradient,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      cardBorderColor: Color.lerp(cardBorderColor, other.cardBorderColor, t)!,
      cardShadow: t < 0.5 ? cardShadow : other.cardShadow,
      accentGradient: Gradient.lerp(accentGradient, other.accentGradient, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
