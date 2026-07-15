import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/fade_slide_in.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/forgot_password_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_glass_card.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_section_hero.dart';
import '../widgets/premium_text_field.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(forgotPasswordControllerProvider.notifier);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              AuthHeader(title: l10n.authForgotPasswordTitle),
              const SizedBox(height: 12),
              FadeSlideIn(
                child: AuthSectionHero(
                  icon: Icons.lock_reset_rounded,
                  colors: const [AppColors.seedViolet, AppColors.aquaBlue],
                  title: l10n.authRecoveryHeadline,
                  subtitle: l10n.authRecoveryBody,
                ),
              ),
              const SizedBox(height: 28),
              FadeSlideIn(
                delay: const Duration(milliseconds: 90),
                child: AuthGlassCard(
                  child: Form(
                    key: controller.formKey,
                    child: PremiumTextField(
                      controller: controller.emailController,
                      label: l10n.authEmail,
                      hint: l10n.authEmailHint,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: Validators.email(l10n),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeSlideIn(
                delay: const Duration(milliseconds: 160),
                child: PrimaryButton(
                  label: l10n.actionContinue,
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () {
                    if (controller.validateForm()) {
                      context.push(AppRoutes.setPassword);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
