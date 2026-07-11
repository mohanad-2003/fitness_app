import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Section heading with an optional trailing action (e.g. "See all").
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.onActionTap,
    this.actionLabel,
  });

  final String title;
  final VoidCallback? onActionTap;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          if (onActionTap != null)
            TextButton(onPressed: onActionTap, child: Text(actionLabel ?? '')),
        ],
      ),
    );
  }
}
