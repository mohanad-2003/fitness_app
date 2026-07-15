import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/fade_slide_in.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_section_hero.dart';

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
              const SizedBox(height: 12),
              FadeSlideIn(
                child: AuthSectionHero(
                  icon: Icons.fingerprint_rounded,
                  colors: const [AppColors.aquaBlue, AppColors.seedViolet],
                  heroHeight: 220,
                  title: l10n.authBiometricHeadline,
                  subtitle: l10n.authBiometricBody,
                ),
              ),
              const SizedBox(height: 40),
              FadeSlideIn(
                delay: const Duration(milliseconds: 140),
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
