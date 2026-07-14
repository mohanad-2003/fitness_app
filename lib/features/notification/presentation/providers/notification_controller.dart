import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/notification_models.dart';

part 'notification_controller.g.dart';

/// Synthetic filter on top of [NotificationCategory]: "All" and "Unread"
/// aren't real categories, they're views over the same list.
enum NotificationFilter {
  all,
  unread,
  workout,
  challenge,
  achievement,
  nutrition,
  reminder,
  community;

  NotificationCategory? get category => switch (this) {
    NotificationFilter.all || NotificationFilter.unread => null,
    NotificationFilter.workout => NotificationCategory.workout,
    NotificationFilter.challenge => NotificationCategory.challenge,
    NotificationFilter.achievement => NotificationCategory.achievement,
    NotificationFilter.nutrition => NotificationCategory.nutrition,
    NotificationFilter.reminder => NotificationCategory.reminder,
    NotificationFilter.community => NotificationCategory.community,
  };
}

@riverpod
class NotificationFilterController extends _$NotificationFilterController {
  @override
  NotificationFilter build() => NotificationFilter.all;

  void select(NotificationFilter filter) => state = filter;
}

DateTime _hoursAgo(int hours) =>
    DateTime.now().subtract(Duration(hours: hours));
DateTime _daysAgo(int days) => DateTime.now().subtract(Duration(days: days));

@riverpod
class NotificationListController extends _$NotificationListController {
  @override
  List<NotificationItem> build() => [
    NotificationItem(
      id: 'n1',
      category: NotificationCategory.workout,
      title: 'Workout Reminder',
      body: "You have today's Full Body workout waiting.",
      timestamp: _hoursAgo(1),
      actionLabel: 'Start',
    ),
    NotificationItem(
      id: 'n2',
      category: NotificationCategory.reminder,
      title: 'Hydration Reminder',
      body: 'Drink a glass of water to stay hydrated.',
      timestamp: _hoursAgo(3),
    ),
    NotificationItem(
      id: 'n3',
      category: NotificationCategory.achievement,
      title: 'Daily Goal',
      body: "Congratulations! You reached today's calorie goal.",
      timestamp: _hoursAgo(5),
      isRead: true,
    ),
    NotificationItem(
      id: 'n4',
      category: NotificationCategory.nutrition,
      title: 'Nutrition',
      body: 'Your meal plan for dinner is ready.',
      timestamp: _hoursAgo(8),
      actionLabel: 'View',
    ),
    NotificationItem(
      id: 'n5',
      category: NotificationCategory.achievement,
      title: 'Achievement Unlocked',
      body: 'You earned the Consistency Badge.',
      timestamp: _daysAgo(1),
    ),
    NotificationItem(
      id: 'n6',
      category: NotificationCategory.challenge,
      title: 'Weekly Challenge',
      body: "Complete one more workout to finish this week's challenge.",
      timestamp: _daysAgo(1),
      isRead: true,
      actionLabel: 'View',
    ),
    NotificationItem(
      id: 'n7',
      category: NotificationCategory.reminder,
      title: 'Recovery',
      body: 'Today is your recovery day.',
      timestamp: _daysAgo(1),
      isRead: true,
    ),
    NotificationItem(
      id: 'n8',
      category: NotificationCategory.achievement,
      title: 'Progress',
      body: 'Your weekly performance increased by 12%.',
      timestamp: _daysAgo(4),
    ),
    NotificationItem(
      id: 'n9',
      category: NotificationCategory.community,
      title: 'Community',
      body: 'Sarah liked your workout.',
      timestamp: _daysAgo(4),
      isRead: true,
    ),
    NotificationItem(
      id: 'n10',
      category: NotificationCategory.workout,
      title: 'Workout Reminder',
      body: 'Your Leg Day session starts in 30 minutes.',
      timestamp: _daysAgo(12),
      isRead: true,
    ),
  ];

  void markAsRead(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(isRead: true) else item,
    ];
  }

  void markAllAsRead() {
    state = [for (final item in state) item.copyWith(isRead: true)];
  }

  void delete(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}

/// Same-day-of-year check without pulling in a date package — used to
/// group notifications into Today / Yesterday / Earlier This Week / Older.
bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

enum NotificationDayGroup { today, yesterday, earlierThisWeek, older }

@riverpod
Map<NotificationDayGroup, List<NotificationItem>> groupedNotifications(
  Ref ref,
) {
  final filter = ref.watch(notificationFilterControllerProvider);
  final all = ref.watch(notificationListControllerProvider);

  final filtered =
      all.where((item) {
        if (filter == NotificationFilter.unread) return !item.isRead;
        final category = filter.category;
        return category == null || item.category == category;
      }).toList()..sort((a, b) => b.timestamp.compareTo(a.timestamp));

  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));
  final weekAgo = now.subtract(const Duration(days: 7));

  final grouped = <NotificationDayGroup, List<NotificationItem>>{};
  for (final item in filtered) {
    final group =
        _isSameDay(item.timestamp, now)
            ? NotificationDayGroup.today
            : _isSameDay(item.timestamp, yesterday)
            ? NotificationDayGroup.yesterday
            : item.timestamp.isAfter(weekAgo)
            ? NotificationDayGroup.earlierThisWeek
            : NotificationDayGroup.older;
    grouped.putIfAbsent(group, () => []).add(item);
  }
  return grouped;
}

@riverpod
int unreadNotificationCount(Ref ref) =>
    ref
        .watch(notificationListControllerProvider)
        .where((item) => !item.isRead)
        .length;
