enum NotificationSection { reminders, system }

class NotificationItem {
  const NotificationItem({
    required this.title,
    required this.image,
    required this.data,
    required this.section,
    required this.dayGroup,
  });

  final String title;
  final String image;
  final String data;
  final NotificationSection section;
  final String dayGroup;
}
