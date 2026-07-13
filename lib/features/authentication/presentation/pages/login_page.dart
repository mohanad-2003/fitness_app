import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/utils/validators.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/authentication/presentation/providers/login_controller.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_divider_label.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_header.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_password_field.dart';
import 'package:fitness_app/features/authentication/presentation/widgets/auth_switch_link.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AuthHero(
                      title: l10n.authWelcomeBackTitle,
                      subtitle: l10n.authWelcomeBackBody,
                      image: 'assets/boxing.png',
                      trainingModeLabel: l10n.authTrainingMode,
                    ),
                    const SizedBox(height: 22),
                    _GlassPanel(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              hint: l10n.authPasswordHint,
                              validator: Validators.password(l10n),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextButton(
                                onPressed:
                                    () =>
                                        context.push(AppRoutes.forgotPassword),
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
                    const SizedBox(height: 22),
                    AuthDividerLabel(label: l10n.authOrContinueWith),
                    const SizedBox(height: 16),
                    const SocialLoginRow(),
                    const SizedBox(height: 22),
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
      ),
    );
  }
}

/// Photo hero with a fixed dark scrim: the overlay content intentionally
/// keeps white/lime foregrounds because the scrim guarantees contrast in
/// both light and dark themes.
class _AuthHero extends StatelessWidget {
  const _AuthHero({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.trainingModeLabel,
  });

  final String title;
  final String subtitle;
  final String image;
  final String trainingModeLabel;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.32),
            BlendMode.darken,
          ),
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.seedInk.withValues(alpha: 0.88),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              trainingModeLabel,
              style: TextStyle(
                color: ext.accentGlow,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                height: 1.02,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.76),
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassPanel extends StatelessWidget {
  const _GlassPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: ext.glassBorder),
      ),
      child: child,
    );
  }
}
