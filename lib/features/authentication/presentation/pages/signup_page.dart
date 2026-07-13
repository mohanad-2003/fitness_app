import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/signup_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_divider_label.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_password_field.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_switch_link.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/social_login_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(signupControllerProvider.notifier);
    final isSubmitting = ref.watch(signupControllerProvider).isLoading;
    final l10n = AppLocalizations.of(context);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              AuthHeader(title: l10n.authSignupTitle),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _MiniHero(),
                    const SizedBox(height: 22),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ext.glassFill,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: ext.glassBorder),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              controller: controller.fullNameController,
                              label: l10n.authFullName,
                              hint: l10n.authFullNameHint,
                              prefixIcon: Icons.person_outline_rounded,
                              validator: Validators.requiredField(
                                l10n,
                                message: l10n.validationFullNameRequired,
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: controller.emailController,
                              label: l10n.authEmail,
                              hint: l10n.authEmailHint,
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validators.email(l10n),
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordField(
                              controller: controller.passwordController,
                              label: l10n.authPassword,
                              hint: l10n.authPasswordCreateHint,
                              validator: Validators.password(l10n),
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordField(
                              controller: controller.confirmPasswordController,
                              label: l10n.authConfirmPassword,
                              hint: l10n.authConfirmPasswordHint,
                              validator: Validators.matches(
                                l10n,
                                controller.passwordController,
                              ),
                            ),
                            const SizedBox(height: 22),
                            PrimaryButton(
                              label: l10n.authStartTraining,
                              icon: Icons.bolt_rounded,
                              isLoading: isSubmitting,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await controller.submit();
                                  if (context.mounted) {
                                    context.go(AppRoutes.setup);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    AuthDividerLabel(label: l10n.authOrSignUpWith),
                    const SizedBox(height: 16),
                    const SocialLoginRow(),
                    const SizedBox(height: 22),
                    AuthSwitchLink(
                      text: l10n.authHaveAccount,
                      action: l10n.authLogIn,
                      onTap: () => context.push(AppRoutes.login),
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

class _MiniHero extends StatelessWidget {
  const _MiniHero();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
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
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.authNewSeason,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.authSignupHeroTitle,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: ext.textPrimary,
                    height: 1.08,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.authSignupHeroBody,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ext.textMuted,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/kett.png',
              width: 94,
              height: 128,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
