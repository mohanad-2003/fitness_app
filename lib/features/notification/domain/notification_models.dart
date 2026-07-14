import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// The seven filterable notification categories (plus the synthetic "all"
/// / "unread" chips handled separately in the UI). Each has one canonical
/// accent gradient used by [NotificationIcon].
enum NotificationCategory {
  workout,
  challenge,
  achievement,
  nutrition,
  reminder,
  community;

  IconData get icon => switch (this) {
    NotificationCategory.workout => Icons.fitness_center_rounded,
    NotificationCategory.challenge => Icons.emoji_events_rounded,
    NotificationCategory.achievement => Icons.military_tech_rounded,
    NotificationCategory.nutrition => Icons.restaurant_rounded,
    NotificationCategory.reminder => Icons.notifications_active_rounded,
    NotificationCategory.community => Icons.favorite_rounded,
  };

  List<Color> get gradient => switch (this) {
    NotificationCategory.workout => const [
      AppColors.electricOrange,
      Color(0xFFFFB020),
    ],
    NotificationCategory.challenge => const [
      AppColors.seedViolet,
      AppColors.aquaBlue,
    ],
    NotificationCategory.achievement => const [
      AppColors.warning,
      AppColors.electricOrange,
    ],
    NotificationCategory.nutrition => const [
      AppColors.success,
      Color(0xFF1FB6A8),
    ],
    NotificationCategory.reminder => const [
      AppColors.aquaBlue,
      AppColors.seedViolet,
    ],
    NotificationCategory.community => const [
      AppColors.communityPink,
      AppColors.seedViolet,
    ],
  };
}

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    this.actionLabel,
  });

  final String id;
  final NotificationCategory category;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;
  final String? actionLabel;

  NotificationItem copyWith({bool? isRead}) => NotificationItem(
    id: id,
    category: category,
    title: title,
    body: body,
    timestamp: timestamp,
    isRead: isRead ?? this.isRead,
    actionLabel: actionLabel,
  );
}
