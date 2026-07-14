import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extension.dart';
import '../../domain/notification_models.dart';
import 'notification_card.dart';

/// A day-group section (Today / Yesterday / Earlier This Week / Older):
/// a modern section title followed by its notification cards, staggered
/// in with a small per-card entrance delay.
class NotificationSection extends StatelessWidget {
  const NotificationSection({
    super.key,
    required this.title,
    required this.items,
    required this.onTap,
    required this.onMarkRead,
    required this.onDelete,
    this.baseDelayMs = 0,
  });

  final String title;
  final List<NotificationItem> items;
  final ValueChanged<NotificationItem> onTap;
  final ValueChanged<NotificationItem> onMarkRead;
  final ValueChanged<NotificationItem> onDelete;
  final int baseDelayMs;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              color: ext.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
        ),
        for (var i = 0; i < items.length; i++) ...[
          NotificationCard(
            item: items[i],
            entranceDelay: Duration(milliseconds: baseDelayMs + i * 45),
            onTap: () => onTap(items[i]),
            onMarkRead: () => onMarkRead(items[i]),
            onDelete: () => onDelete(items[i]),
          ),
          if (i != items.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}
