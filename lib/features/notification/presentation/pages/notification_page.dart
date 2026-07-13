import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/notification_models.dart';
import '../providers/notification_controller.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(notificationTabControllerProvider);
    final grouped = ref.watch(groupedNotificationsProvider);

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.canPop() ? context.pop() : null,
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppColors.seedLime,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Notifications',
                style: TextStyle(
                  color: AppColors.seedViolet,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => context.push(AppRoutes.search),
                icon: const Icon(
                  Icons.search,
                  color: AppColors.seedViolet,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () => context.push(AppRoutes.profile),
                icon: const Icon(
                  Icons.person,
                  color: AppColors.seedViolet,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              _Tab(
                label: 'Reminders',
                section: NotificationSection.reminders,
                selected: section,
              ),
              const SizedBox(width: 10),
              _Tab(
                label: 'System',
                section: NotificationSection.system,
                selected: section,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child:
                grouped.isEmpty
                    ? const Center(
                      child: Text(
                        'No notifications yet.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                    : ListView.separated(
                      shrinkWrap: true,
                      itemCount: grouped.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final entry = grouped.entries.elementAt(index);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                color: AppColors.seedLime,
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
                              itemBuilder:
                                  (context, i) =>
                                      _NotificationTile(item: entry.value[i]),
                            ),
                          ],
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}

class _Tab extends ConsumerWidget {
  const _Tab({
    required this.label,
    required this.section,
    required this.selected,
  });
  final String label;
  final NotificationSection section;
  final NotificationSection selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = section == selected;
    return Expanded(
      child: GestureDetector(
        onTap:
            () => ref
                .read(notificationTabControllerProvider.notifier)
                .select(section),
        child: Container(
          height: 29,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                isSelected
                    ? AppColors.seedLime
                    : Colors.white.withValues(alpha: 0.08),
            border:
                isSelected
                    ? null
                    : Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.seedInk : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item});
  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: _circleColor(item.image),
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.data,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
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

  Color _circleColor(String imagePath) {
    if (imagePath.contains('upper_body') ||
        imagePath.contains('idea_dark') ||
        imagePath.contains('list_dark') ||
        imagePath.contains('star_dark')) {
      return AppColors.seedLime;
    }
    return AppColors.seedViolet;
  }
}
