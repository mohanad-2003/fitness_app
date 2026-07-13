import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class FingerPrintPage extends StatelessWidget {
  const FingerPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              AuthHeader(title: l10n.authBiometricTitle),
              const SizedBox(height: 28),
              Text(
                l10n.authBiometricHeadline,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: ext.textPrimary,
                  height: 1.04,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.authBiometricBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: ext.textMuted,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 34),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 34),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.18),
                      theme.colorScheme.secondary.withValues(alpha: 0.14),
                      ext.glassFill,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.08,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/finger.png',
                      width: 168,
                      height: 218,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                label: l10n.authEnableFingerprint,
                icon: Icons.fingerprint_rounded,
                onPressed: () => context.go(AppRoutes.setup),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () => context.go(AppRoutes.setup),
                child: Text(
                  l10n.authSkipForNow,
                  style: TextStyle(
                    color: ext.textMuted,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
