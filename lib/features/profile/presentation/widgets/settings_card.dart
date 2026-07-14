import 'package:fitness_app/core/theme/app_spacing.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';

import 'settings_toggle_row.dart';

/// Glass card that groups a list of rows (e.g. [SettingsToggleRow]s or
/// radio/option tiles) with a hairline divider between each — the shared
/// wrapper behind Settings' theme/language cards and every toggle group in
/// Notification Settings / Manage Data.
class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
  });

  final List<Widget> children;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i != 0) Divider(color: ext.glassBorder, height: 1),
            children[i],
          ],
        ],
      ),
    );
  }
}
