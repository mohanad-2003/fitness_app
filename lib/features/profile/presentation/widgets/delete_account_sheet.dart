import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Confirmation sheet for the destructive "delete account" action, shared by
/// [PrivacyPage] and [SettingsPage] so the two entry points don't diverge.
Future<void> showDeleteAccountSheet(BuildContext context) {
  final ext = Theme.of(context).extension<AppThemeExtension>()!;
  final l10n = AppLocalizations.of(context);

  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    context: context,
    builder: (context) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: ext.cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(color: ext.glassBorder),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: ext.glassBorder,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ext.danger.withValues(alpha: 0.14),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: ext.danger,
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.privacyDeleteConfirmTitle,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: ext.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.privacyDeleteConfirmBody,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: ext.textMuted),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 130,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ext.glassFill,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ext.glassBorder),
                      ),
                      child: Center(
                        child: Text(
                          l10n.actionCancel,
                          style: TextStyle(
                            color: ext.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.login);
                    },
                    child: Container(
                      width: 130,
                      height: 44,
                      decoration: BoxDecoration(
                        color: ext.danger,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          l10n.privacyDelete,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
