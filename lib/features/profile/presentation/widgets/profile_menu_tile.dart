import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extension.dart';

/// Premium glass-row menu item used throughout the Profile screen —
/// replaces the plain [ListTile]-based `_ProfileTile` (flat violet circle,
/// no card surface) with the same glass-card + gradient-icon language used
/// across Workout/Nutrition/Community.
class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final theme = Theme.of(context);
    final accent = iconColor ?? theme.colorScheme.secondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: ext.glassFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ext.glassBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.14),
              ),
              child: Center(child: Icon(icon, color: accent, size: 22)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ext.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: ext.textMuted,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
