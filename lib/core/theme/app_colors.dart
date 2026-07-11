import 'package:flutter/material.dart';

/// Premium fitness palette used across the product surfaces.
abstract final class AppColors {
  static const Color seedInk = Color(0xFF080D12);
  static const Color seedLime = Color(0xFFBFFF3C);
  static const Color seedViolet = Color(0xFF6C5CE7);
  static const Color electricOrange = Color(0xFFFF7A1A);
  static const Color aquaBlue = Color(0xFF33D6FF);
  static const Color midnight = Color(0xFF0D141C);
  static const Color graphite = Color(0xFF141C24);
  static const Color glass = Color(0x1FFFFFFF);

  static const Color lightSurface = Color(0xFFF5F7EF);
  static const Color lightSurfaceVariant = Color(0xFFEAEFE1);
  static const Color lightOutline = Color(0xFFD3D9C7);

  // Dark surfaces deliberately avoid pure black per design-system requirements.
  static const Color darkSurface = Color(0xFF080D12);
  static const Color darkSurfaceVariant = Color(0xFF121A22);
  static const Color darkOutline = Color(0xFF2A3744);

  static const Color success = Color(0xFF4DFF8D);
  static const Color warning = Color(0xFFFFB84D);
  static const Color danger = Color(0xFFFF4D67);
}
