import 'package:flutter/material.dart';

/// Elevation tokens expressed as soft, brand-consistent shadows instead of
/// Material's default drop shadow, so floating surfaces (nav bar, sheets,
/// cards) feel premium in both themes.
abstract final class AppShadows {
  static List<BoxShadow> floating(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];
    }
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.10),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ];
  }
}
