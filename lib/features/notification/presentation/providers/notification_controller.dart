import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/notification_models.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationTabController extends _$NotificationTabController {
  @override
  NotificationSection build() => NotificationSection.reminders;

  void select(NotificationSection section) => state = section;
}

const _allNotifications = [
  NotificationItem(
    image: 'assets/star.png',
    title: 'New workout is Available',
    data: 'June 10 - 10:00 AM',
    section: NotificationSection.reminders,
    dayGroup: 'Today',
  ),
  NotificationItem(
    image: 'assets/idea_dark.png',
    title: "Don't forget to drink water",
    data: 'June 10 - 8:00 AM',
    section: NotificationSection.reminders,
    dayGroup: 'Today',
  ),
  NotificationItem(
    image: 'assets/upper_body.png',
    title: 'Upper Body Workout Completed!',
    data: 'June 09 - 6:00 PM',
    section: NotificationSection.reminders,
    dayGroup: 'Yesterday',
  ),
  NotificationItem(
    image: 'assets/idea_light.png',
    title: 'Remember Your Exercise Session',
    data: 'June 09 - 3:00 PM',
    section: NotificationSection.reminders,
    dayGroup: 'Yesterday',
  ),
  NotificationItem(
    image: 'assets/list.png',
    title: 'New Article & Tip Posted!',
    data: 'June 09 - 11:00 AM',
    section: NotificationSection.reminders,
    dayGroup: 'Yesterday',
  ),
  NotificationItem(
    image: 'assets/star.png',
    title: 'You Started A New Challenge!',
    data: 'May 29 - 9:00 AM',
    section: NotificationSection.reminders,
    dayGroup: 'May 29 - 20XX',
  ),
  NotificationItem(
    image: 'assets/star.png',
    title: 'New House Training Ideas!',
    data: 'May 29 - 8:20 AM',
    section: NotificationSection.reminders,
    dayGroup: 'May 29 - 20XX',
  ),
  NotificationItem(
    image: 'assets/star_dark.png',
    title: 'You Have A New Message!',
    data: 'June 10 - 2:00 PM',
    section: NotificationSection.system,
    dayGroup: 'Today',
  ),
  NotificationItem(
    image: 'assets/list_dark.png',
    title: 'Scheduled Maintenance.',
    data: 'June 10 - 8:00 AM',
    section: NotificationSection.system,
    dayGroup: 'Today',
  ),
  NotificationItem(
    image: 'assets/notification.png',
    title: "We've Detected A Login From A New Device",
    data: 'June 10 - 5:00 AM',
    section: NotificationSection.system,
    dayGroup: 'Today',
  ),
  NotificationItem(
    image: 'assets/list.png',
    title: "We've Updated Our Privacy Policy",
    data: 'June 09 - 1:00 PM',
    section: NotificationSection.system,
    dayGroup: 'Yesterday',
  ),
  NotificationItem(
    image: 'assets/star.png',
    title: 'You Have A New Message!',
    data: 'June 09 - 9:00 AM',
    section: NotificationSection.system,
    dayGroup: 'Yesterday',
  ),
  NotificationItem(
    image: 'assets/star.png',
    title: 'You Have A New Message!',
    data: 'May 29 - 10:00 AM',
    section: NotificationSection.system,
    dayGroup: 'May 29 - 20XX',
  ),
  NotificationItem(
    image: 'assets/list.png',
    title: "We've Made Changes To Our Terms Of Service",
    data: 'May 29 - 7:20 AM',
    section: NotificationSection.system,
    dayGroup: 'May 29 - 20XX',
  ),
];

@riverpod
Map<String, List<NotificationItem>> groupedNotifications(Ref ref) {
  final section = ref.watch(notificationTabControllerProvider);
  final filtered = _allNotifications.where((n) => n.section == section);
  final grouped = <String, List<NotificationItem>>{};
  for (final item in filtered) {
    grouped.putIfAbsent(item.dayGroup, () => []).add(item);
  }
  return grouped;
}
