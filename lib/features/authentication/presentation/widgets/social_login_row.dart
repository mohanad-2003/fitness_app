import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extension.dart';

/// Reused by login and signup — previously duplicated as private
/// `_SocialIcon` widgets in each file.
class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  static const _icons = [
    'assets/gmail.png',
    'assets/face.png',
    'assets/mark.png',
  ];

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final icon in _icons) ...[
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: ext.glassFill,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ext.glassBorder),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.20),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(child: Image.asset(icon, width: 21, height: 21)),
          ),
          if (icon != _icons.last) const SizedBox(width: 12),
        ],
      ],
    );
  }
}
