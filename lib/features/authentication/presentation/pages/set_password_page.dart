import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/set_password_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';

class SetPasswordPage extends ConsumerWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(setPasswordControllerProvider.notifier);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              const AuthHeader(title: 'Set Password'),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.seedLime.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.verified_user_rounded,
                      color: AppColors.seedLime,
                      size: 52,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Create your new training key.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: Colors.white, height: 1.04),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Use a strong password so your account, progress, and health data stay protected.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.72),
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
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AuthPasswordField(
                        controller: controller.passwordController,
                        label: 'New Password',
                        hint: 'Enter new password',
                        validator: controller.validatePassword,
                      ),
                      const SizedBox(height: 16),
                      AuthPasswordField(
                        controller: controller.confirmPasswordController,
                        label: 'Confirm Password',
                        hint: 'Re-enter new password',
                        validator: controller.validateConfirmPassword,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                label: 'Reset Password',
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
