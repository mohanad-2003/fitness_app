/// Centralized 4pt spacing scale. Never hardcode raw padding/margin numbers.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

/// Centralized corner-radius scale.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;

  /// Standard radius for every large content card (featured cards, glass
  /// cards, list items) — one value across all tabs per the design system.
  static const double card = 20;
  static const double xl = 24;
  static const double pill = 999;
}
