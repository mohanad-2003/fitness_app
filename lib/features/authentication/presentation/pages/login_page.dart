import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/login_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_divider_label.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_glass_card.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_section_hero.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_switch_link.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/premium_text_field.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/social_login_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(loginControllerProvider.notifier);
    final isSubmitting = ref.watch(loginControllerProvider).isLoading;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              AuthHeader(title: l10n.authLoginTitle),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Column(
                  children: [
                    FadeSlideIn(
                      child: AuthSectionHero(
                        icon: Icons.bolt_rounded,
                        colors: const [AppColors.seedLime, AppColors.aquaBlue],
                        kicker: l10n.authTrainingMode,
                        title: l10n.authWelcomeBackTitle,
                        subtitle: l10n.authWelcomeBackBody,
                      ),
                    ),
                    const SizedBox(height: 26),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 90),
                      child: AuthGlassCard(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PremiumTextField(
                                controller: controller.emailController,
                                label: l10n.authEmail,
                                hint: l10n.authEmailHint,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: Validators.email(l10n),
                              ),
                              const SizedBox(height: 16),
                              PremiumPasswordField(
                                controller: controller.passwordController,
                                label: l10n.authPassword,
                                hint: l10n.authPasswordHint,
                                textInputAction: TextInputAction.done,
                                validator: Validators.password(l10n),
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                  onPressed:
                                      () => context.push(
                                        AppRoutes.forgotPassword,
                                      ),
                                  child: Text(l10n.authForgotPassword),
                                ),
                              ),
                              const SizedBox(height: 8),
                              PrimaryButton(
                                label: l10n.authLoginTitle,
                                icon: Icons.arrow_forward_rounded,
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
                    ),
                    const SizedBox(height: 24),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 160),
                      child: Column(
                        children: [
                          AuthDividerLabel(label: l10n.authOrContinueWith),
                          const SizedBox(height: 18),
                          const SocialLoginRow(),
                          const SizedBox(height: 24),
                          AuthSwitchLink(
                            text: l10n.authNoAccount,
                            action: l10n.authCreateAccount,
                            onTap: () => context.push(AppRoutes.signup),
                          ),
                        ],
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
