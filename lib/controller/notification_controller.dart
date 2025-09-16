import 'package:fitness_app/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  // الحالة الحالية للتبويب (Reminders أو System)
  var CurrentTep = "Reminders".obs;

  // دالة لتغيير التبويب عند الضغط
  void SelectedTap(String tap) {
    CurrentTep.value = tap;
  }
Map<String, List<NotificationModel>> get groupedNotifications {
  final filtered = notificationMoedel
      .where((n) => n.section == CurrentTep.value)
      .toList();

  final Map<String, List<NotificationModel>> grouped = {};
  for (var item in filtered) {
    grouped.putIfAbsent(item.dayGroub, () => []).add(item);
  }

  return grouped;
}

  // قائمة الإشعارات
  var notificationMoedel = <NotificationModel>[
    // --- Reminders ---
    NotificationModel(
      image: "assets/star.png",
      title: "New workout is Available",
      data: "June 10 - 10:00 AM",
      section: "Reminders",
      dayGroub: "Today",
    ),
    NotificationModel(
      image: "assets/idea_dark.png",
      title: "Don’t forget to drink water",
      data: "June 10 - 8:00 AM",
      section: "Reminders",
      dayGroub: "Today",
    ),
    NotificationModel(
      image: "assets/upper_body.png",
      title: "Upper Body Workout Completed!",
      data: "June 09 - 6:00 PM",
      section: "Reminders",
      dayGroub: "Yesterday",
    ),
    NotificationModel(
      title: "Remember Your Exercise Session",
      image: "assets/idea_light.png",
      data: "June 09 - 3:00 PM",
      section: "Reminders",
      dayGroub: "Yesterday",
    ),
    NotificationModel(
      title: "New Article & Tip Posted!",
      image: "assets/list.png",
      data: "June 09 - 11:00 AM",
      section: "Reminders",
      dayGroub: "Yesterday",
    ),
    NotificationModel(
      title: "You Started A New Challenge!",
      image: "assets/star.png",
      data: "May 29 - 9:00 AM",
      section: "Reminders",
      dayGroub: "May 29 - 20XX",
    ),
    NotificationModel(
      title: "New House Training Ideas!",
      image: "assets/star.png",
      data: "May 29 - 8:20 AM",
      section: "Reminders",
      dayGroub: "May 29 - 20XX",
    ),

    // --- System ---
    NotificationModel(
      title: "You Have A New Message!",
      image: "assets/star_dark.png",
      data: "June 10 - 2:00 PM",
      section: "System",
      dayGroub: "Today",
    ),
    NotificationModel(
      title: "Scheduled Maintenance.",
      image: "assets/list_dark.png",
      data: "June 10 - 8:00 AM",
      section: "System",
      dayGroub: "Today",
    ),
    NotificationModel(
      title: "We've Detected A Login From A New Device",
      image: "assets/notification.png",
      data: "June 10 - 5:00 AM",
      section: "System",
      dayGroub: "Today",
    ),
    NotificationModel(
      title: "We've Updated Our Privacy Policy",
      image: "assets/list.png",
      data: "June 09 - 1:00 PM",
      section: "System",
      dayGroub: "Yesterday",
    ),
    NotificationModel(
      title: "You Have A New Message!",
      image: "assets/star.png",
      data: "June 09 - 9:00 AM",
      section: "System",
      dayGroub: "Yesterday",
    ),
    NotificationModel(
      title: "You Have A New Message!",
      image: "assets/star.png",
      data: "May 29 - 10:00 AM",
      section: "System",
      dayGroub: "May 29 - 20XX",
    ),
    NotificationModel(
      title: "We've Made Changes To Our Terms Of Service",
      image: "assets/list.png",
      data: "May 29 - 7:20 AM",
      section: "System",
      dayGroub: "May 29 - 20XX",
    ),
  ].obs;
}
