import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
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

  String _label(AppLocalizations l10n, String key) => switch (key) {
    'General Notification' => l10n.notificationToggleGeneral,
    'Sound' => l10n.notificationToggleSound,
    "Don't Disturb Mode" => l10n.notificationToggleDoNotDisturb,
    'Vibrate' => l10n.notificationToggleVibrate,
    'Lock Screen' => l10n.notificationToggleLockScreen,
    'Reminders' => l10n.notificationToggleReminders,
    _ => key,
  };

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
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
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  l10n.notificationSettingsTitle,
                  style: TextStyle(
                    color: ext.textPrimary,
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
                    _label(l10n, entry.key),
                    style: TextStyle(fontSize: 20, color: ext.textPrimary),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: entry.value,
                      onChanged:
                          (value) =>
                              setState(() => _toggles[entry.key] = value),
                      activeThumbColor: theme.colorScheme.primary,
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
