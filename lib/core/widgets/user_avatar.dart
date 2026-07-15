import 'package:flutter/material.dart';

import '../theme/app_theme_extension.dart';

/// Premium generated avatar — a gradient circle with a person glyph — used
/// everywhere the app needs to represent "a user" (profile, home greeting,
/// workout logs, community posts) without a real photo. Replaces the old
/// `assets/profile.png` stock photo, which was also semantically wrong
/// wherever it was reused across different unrelated people/posts.
class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.radius = 24,
    this.icon = Icons.person_rounded,
    this.borderColor,
    this.borderWidth = 0,
  });

  final double radius;
  final IconData icon;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: ext.accentGradient,
        border:
            borderWidth > 0
                ? Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: borderWidth,
                )
                : null,
      ),
      child: Icon(icon, color: ext.onAccent, size: radius),
    );
  }
}
