import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/signup_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_divider_label.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_glass_card.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_section_hero.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_switch_link.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/password_strength_meter.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/premium_text_field.dart';
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
                  children: [
                    FadeSlideIn(
                      child: AuthSectionHero(
                        icon: Icons.rocket_launch_rounded,
                        colors: const [
                          AppColors.electricOrange,
                          AppColors.seedLime,
                        ],
                        kicker: l10n.authNewSeason,
                        title: l10n.authSignupHeroTitle,
                        subtitle: l10n.authSignupHeroBody,
                      ),
                    ),
                    const SizedBox(height: 26),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 90),
                      child: AuthGlassCard(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              PremiumTextField(
                                controller: controller.fullNameController,
                                label: l10n.authFullName,
                                hint: l10n.authFullNameHint,
                                prefixIcon: Icons.person_outline_rounded,
                                textInputAction: TextInputAction.next,
                                validator: Validators.requiredField(
                                  l10n,
                                  message: l10n.validationFullNameRequired,
                                ),
                              ),
                              const SizedBox(height: 16),
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
                                hint: l10n.authPasswordCreateHint,
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
                                hint: l10n.authConfirmPasswordHint,
                                textInputAction: TextInputAction.done,
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
                    ),
                    const SizedBox(height: 24),
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 160),
                      child: Column(
                        children: [
                          AuthDividerLabel(label: l10n.authOrSignUpWith),
                          const SizedBox(height: 18),
                          const SocialLoginRow(),
                          const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
    );
  }
}
