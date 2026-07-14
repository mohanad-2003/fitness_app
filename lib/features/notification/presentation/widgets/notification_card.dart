import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/pressable_scale.dart';
import '../../domain/notification_models.dart';
import 'notification_icon.dart';
import 'unread_indicator.dart';

/// Premium notification card: gradient category icon, title/body/time,
/// optional action button, colored unread side-stripe + glowing dot when
/// unread. Wrapped in [Dismissible] for swipe-to-delete (left) and
/// swipe-to-mark-read (right), and fades/slides in on first build.
class NotificationCard extends StatefulWidget {
  const NotificationCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onMarkRead,
    required this.onDelete,
    this.entranceDelay = Duration.zero,
  });

  final NotificationItem item;
  final VoidCallback onTap;
  final VoidCallback onMarkRead;
  final VoidCallback onDelete;
  final Duration entranceDelay;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 320),
  );
  late final Animation<double> _fade = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, 0.12),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.entranceDelay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final item = widget.item;
    final accent = item.category.gradient.first;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Dismissible(
          key: ValueKey(item.id),
          background: _SwipeBackground(
            alignment: AlignmentDirectional.centerStart,
            color: ext.success,
            icon: Icons.done_rounded,
          ),
          secondaryBackground: _SwipeBackground(
            alignment: AlignmentDirectional.centerEnd,
            color: ext.danger,
            icon: Icons.delete_rounded,
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              widget.onMarkRead();
              return false;
            }
            return true;
          },
          onDismissed: (_) => widget.onDelete(),
          child: PressableScale(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(AppRadius.card),
                child: Ink(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: item.isRead ? ext.glassFill : ext.cardColor,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(
                      color: item.isRead ? ext.glassBorder : accent.withValues(alpha: 0.4),
                    ),
                    boxShadow: item.isRead ? const [] : ext.cardShadow,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Colored unread side-stripe.
                      Container(
                        width: 3,
                        height: 46,
                        margin: const EdgeInsetsDirectional.only(end: 12),
                        decoration: BoxDecoration(
                          color: item.isRead ? Colors.transparent : accent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      NotificationIcon(category: item.category),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ext.textPrimary,
                                      fontSize: 14.5,
                                      fontWeight:
                                          item.isRead
                                              ? FontWeight.w600
                                              : FontWeight.w800,
                                    ),
                                  ),
                                ),
                                if (!item.isRead) ...[
                                  const SizedBox(width: 6),
                                  UnreadIndicator(color: accent),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.body,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ext.textMuted,
                                fontSize: 12.5,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  _relativeTime(
                                    item.timestamp,
                                    AppLocalizations.of(context),
                                  ),
                                  style: TextStyle(
                                    color: ext.textMuted,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (item.actionLabel != null) ...[
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: widget.onTap,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: accent.withValues(alpha: 0.14),
                                        borderRadius: BorderRadius.circular(
                                          AppRadius.pill,
                                        ),
                                      ),
                                      child: Text(
                                        item.actionLabel!,
                                        style: TextStyle(
                                          color: accent,
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _relativeTime(DateTime timestamp, AppLocalizations l10n) {
  final diff = DateTime.now().difference(timestamp);
  if (diff.inMinutes < 1) return l10n.notificationsTimeJustNow;
  if (diff.inHours < 1) return l10n.notificationsTimeMinutesAgo(diff.inMinutes);
  if (diff.inHours < 24) return l10n.notificationsTimeHoursAgo(diff.inHours);
  return l10n.notificationsTimeDaysAgo(diff.inDays);
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground({
    required this.alignment,
    required this.color,
    required this.icon,
  });

  final AlignmentGeometry alignment;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Icon(icon, color: color),
    );
  }
}
