import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../authentication/presentation/widgets/auth_background.dart';
import '../../../authentication/presentation/widgets/auth_header.dart';

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Column(
          children: [
            const AuthHeader(),
            const SizedBox(height: 20),
            Text(
              l10n.onboardingFillProfileTitle,
              style: TextStyle(
                color: ext.textPrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.onboardingFillProfileBody,
                textAlign: TextAlign.center,
                style: TextStyle(color: ext.textMuted, fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            const _ProfilePicture(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  AppTextField(
                    label: l10n.authFullName,
                    hint: l10n.authFullNameHint,
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    label: l10n.onboardingNickname,
                    hint: l10n.onboardingNicknameHint,
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    label: l10n.authEmail,
                    hint: l10n.authEmailHint,
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    label: l10n.editProfileMobileNumber,
                    hint: l10n.onboardingMobileHint,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                label: l10n.onboardingStart,
                onPressed: () => context.go(AppRoutes.home),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return SizedBox(
      height: 140,
      width: 140,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                gradient: ext.accentGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.edit, size: 18, color: ext.onAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
