import 'package:fitness_app/controller/notification_controller.dart';
import 'package:fitness_app/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffE2F163),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                      color: Color(0xff896CFE),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _buildIcon(Icons.search),
                  const SizedBox(width: 5),
                  _buildIcon(Icons.notifications),
                  const SizedBox(width: 5),
                  _buildIcon(Icons.person),
                ],
              ),

              const SizedBox(height: 30),

              // Tabs
              Obx(() {
                return Row(
                  children: [
                    _buildTab("Reminders"),
                    const SizedBox(width: 10),
                    _buildTab("System"),
                  ],
                );
              }),

              const SizedBox(height: 20),

              // Notifications List
              Expanded(
                child: Obx(() {
                  final grouped = notificationController.groupedNotifications;

                  if (grouped.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notifications yet.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
                  }

                  return ListView.separated(
                    // physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: grouped.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final entry = grouped.entries.elementAt(index);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.key,
                            style: const TextStyle(
                              color: Color(0xffE2F163),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: entry.value.length,
                            separatorBuilder:
                                (context, i) => const SizedBox(height: 10),
                            itemBuilder: (context, i) {
                              final item = entry.value[i];
                              return _buildNotificationItem(item);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build tab (Reminders/System)
  Widget _buildTab(String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => notificationController.SelectedTap(label),
        child: Container(
          height: 29,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                notificationController.CurrentTep.value == label
                    ? const Color(0xffE2F163)
                    : Colors.white,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 17,
                color:
                    notificationController.CurrentTep.value == label
                        ? const Color(0xff232323)
                        : const Color(0xff896CFE),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Build each notification item
  Widget _buildNotificationItem(NotificationModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _getOuterCircleColor(item.image),
              shape: BoxShape.circle,
            ),
            child: Image.asset(item.image, height: 30, width: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.data,
                  style: const TextStyle(
                    color: Color(0xffB3A0FF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build top-right icons
  GestureDetector _buildIcon(IconData icon, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: const Color(0xff896CFE), size: 25),
    );
  }
}

/// Helper method to get circle color based on image name
Color _getOuterCircleColor(String imagePath) {
  if (imagePath.contains("upper_body") ||
      imagePath.contains("idea_dark") ||
      imagePath.contains("list_dark") ||
      imagePath.contains("star_dark")) {
    return const Color(0xffE2F163);
  } else {
    return const Color(0xffB3A0FF);
  }
}
