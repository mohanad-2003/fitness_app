import 'package:flutter/widgets.dart';

/// Shared breakpoint thresholds (logical-pixel width), loosely aligned with
/// Material 3's window-size classes but tuned for phone-first fitness UI:
/// `compact` = small phones, `standard` = typical phones, `medium` = large
/// phones/foldables opened, `expanded` = tablets.
class AppBreakpoints {
  const AppBreakpoints._();

  static const double compact = 360;
  static const double medium = 600;
  static const double expanded = 840;
}

enum ScreenSize { compact, standard, medium, expanded }

ScreenSize screenSizeOf(double width) {
  if (width >= AppBreakpoints.expanded) return ScreenSize.expanded;
  if (width >= AppBreakpoints.medium) return ScreenSize.medium;
  if (width >= AppBreakpoints.compact) return ScreenSize.standard;
  return ScreenSize.compact;
}

/// Picks a value for [width], falling back to the next-smaller tier when a
/// larger tier isn't supplied. Use inside a [LayoutBuilder] when sizing
/// against a constrained ancestor rather than the full screen.
T responsiveValue<T>(
  double width, {
  required T compact,
  T? standard,
  T? medium,
  T? expanded,
}) {
  switch (screenSizeOf(width)) {
    case ScreenSize.expanded:
      return expanded ?? medium ?? standard ?? compact;
    case ScreenSize.medium:
      return medium ?? standard ?? compact;
    case ScreenSize.standard:
      return standard ?? compact;
    case ScreenSize.compact:
      return compact;
  }
}

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  ScreenSize get screenSize => screenSizeOf(screenWidth);

  /// Same tiered lookup as [responsiveValue], keyed off the full screen
  /// width via [MediaQuery].
  T responsive<T>({
    required T compact,
    T? standard,
    T? medium,
    T? expanded,
  }) => responsiveValue(
    screenWidth,
    compact: compact,
    standard: standard,
    medium: medium,
    expanded: expanded,
  );
}
