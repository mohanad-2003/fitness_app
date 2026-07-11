import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final Map<String, bool> _toggles = {
    'General Notification': false,
    'Sound': false,
    "Don't Disturb Mode": false,
    'Vibrate': false,
    'Lock Screen': false,
    'Reminders': false,
  };

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
                    Icons.arrow_back_ios_new,
                    color: AppColors.seedLime,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Notification Setting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            for (final entry in _toggles.entries) ...[
              Row(
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: entry.value,
                      onChanged:
                          (value) =>
                              setState(() => _toggles[entry.key] = value),
                      activeThumbColor: AppColors.seedLime,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xffB3A0FF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}
