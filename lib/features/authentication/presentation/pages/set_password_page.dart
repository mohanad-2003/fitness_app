import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/responsive/app_responsive.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/set_password_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_glass_card.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_section_hero.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/password_strength_meter.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/premium_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SetPasswordPage extends ConsumerWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(setPasswordControllerProvider.notifier);
    final l10n = AppLocalizations.of(context);
    final heroHeight = context.responsive(
      compact: 140.0,
      standard: 172.0,
      medium: 190.0,
      expanded: 214.0,
    );

    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  AuthHeader(title: l10n.authSetPasswordTitle),
                  const SizedBox(height: 12),
                  FadeSlideIn(
                    child: AuthSectionHero(
                      icon: Icons.verified_user_rounded,
                      colors: const [
                        AppColors.seedViolet,
                        AppColors.electricOrange,
                      ],
                      heroHeight: heroHeight,
                      title: l10n.authSetPasswordHeadline,
                      subtitle: l10n.authSetPasswordBody,
                    ),
                  ),
                  const SizedBox(height: 28),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 90),
                    child: AuthGlassCard(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            PremiumPasswordField(
                              controller: controller.passwordController,
                              label: l10n.authNewPassword,
                              hint: l10n.authNewPasswordHint,
                              textInputAction: TextInputAction.next,
                              validator: Validators.password(l10n),
                            ),
                            PasswordStrengthMeter(
                              controller: controller.passwordController,
                            ),
                            const SizedBox(height: 16),
                            PremiumPasswordField(
                              controller:
                                  controller.confirmPasswordController,
                              label: l10n.authConfirmPassword,
                              hint: l10n.authConfirmNewPasswordHint,
                              textInputAction: TextInputAction.done,
                              validator: Validators.matches(
                                l10n,
                                controller.passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 160),
                    child: PrimaryButton(
                      label: l10n.authResetPassword,
                      icon: Icons.check_rounded,
                      onPressed: () {
                        if (controller.validateForm()) {
                          context.push(AppRoutes.fingerprint);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
