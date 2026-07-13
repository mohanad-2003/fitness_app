import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordSettingsPage extends StatelessWidget {
  const PasswordSettingsPage({super.key});

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
                    Icons.arrow_back_ios_new_sharp,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  l10n.passwordSettingsTitle,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              l10n.passwordCurrentPassword,
              style: TextStyle(color: theme.colorScheme.primary, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                l10n.passwordForgot,
                style: TextStyle(color: ext.textPrimary, fontSize: 15),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              l10n.passwordNew,
              style: TextStyle(fontSize: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: 20),
            Text(
              l10n.passwordConfirmNew,
              style: TextStyle(fontSize: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
