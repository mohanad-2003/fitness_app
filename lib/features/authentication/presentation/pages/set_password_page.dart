import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/set_password_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SetPasswordPage extends ConsumerWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(setPasswordControllerProvider.notifier);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              AuthHeader(title: l10n.authSetPasswordTitle),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.verified_user_rounded,
                      color: theme.colorScheme.primary,
                      size: 52,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.authSetPasswordHeadline,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: ext.textPrimary,
                        height: 1.04,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.authSetPasswordBody,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ext.textMuted,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ext.glassFill,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: ext.glassBorder),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AuthPasswordField(
                        controller: controller.passwordController,
                        label: l10n.authNewPassword,
                        hint: l10n.authNewPasswordHint,
                        validator: Validators.password(l10n),
                      ),
                      const SizedBox(height: 16),
                      AuthPasswordField(
                        controller: controller.confirmPasswordController,
                        label: l10n.authConfirmPassword,
                        hint: l10n.authConfirmNewPasswordHint,
                        validator: Validators.matches(
                          l10n,
                          controller.passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: l10n.authResetPassword,
                icon: Icons.check_rounded,
                onPressed: () {
                  if (controller.validateForm()) {
                    context.push(AppRoutes.fingerprint);
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
