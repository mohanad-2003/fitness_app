import 'package:flutter/material.dart';

import '../../domain/notification_models.dart';

/// Gradient circular icon badge for a notification category — the color
/// identity of each notification type (orange for workouts, gold for
/// achievements, green for nutrition, blue for reminders, violet for
/// challenges, pink for community).
class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key, required this.category, this.size = 46});

  final NotificationCategory category;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: category.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: category.gradient.first.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(category.icon, color: Colors.white, size: size * 0.48),
    );
  }
}
