import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/forgot_password_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(forgotPasswordControllerProvider.notifier);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              AuthHeader(title: l10n.authForgotPasswordTitle),
              const SizedBox(height: 28),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: ext.accentGradient,
                  boxShadow: [
                    BoxShadow(
                      color: ext.accentGlow.withValues(alpha: 0.28),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.lock_reset_rounded,
                  color: ext.onAccent,
                  size: 44,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                l10n.authRecoveryHeadline,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: ext.textPrimary,
                  height: 1.04,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.authRecoveryBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: ext.textMuted,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ext.glassFill,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Form(
                  key: controller.formKey,
                  child: AppTextField(
                    controller: controller.emailController,
                    label: l10n.authEmail,
                    hint: l10n.authEmailHint,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email(l10n),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: l10n.actionContinue,
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  if (controller.validateForm()) {
                    context.push(AppRoutes.setPassword);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
