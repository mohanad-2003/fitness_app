import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.canPop() ? context.pop() : null,
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: AppColors.seedLime,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Setting',
                  style: TextStyle(color: AppColors.seedViolet, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _SettingsTile(
              icon: Icons.notifications,
              label: 'Notification Setting',
              onTap: () => context.push(AppRoutes.notificationSettings),
            ),
            const SizedBox(height: 10),
            _SettingsTile(
              icon: Icons.key,
              label: 'Password Setting',
              onTap: () => context.push(AppRoutes.passwordSettings),
            ),
            const SizedBox(height: 10),
            const _SettingsTile(icon: Icons.person, label: 'Delete Account'),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.seedViolet,
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      trailing: const Icon(
        Icons.arrow_drop_down_rounded,
        color: AppColors.seedLime,
        size: 30,
      ),
    );
  }
}
