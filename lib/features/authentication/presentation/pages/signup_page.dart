import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/signup_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/social_login_row.dart';

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

    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            children: [
              const AuthHeader(title: 'Create Account'),
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
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                        ),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              controller: controller.fullNameController,
                              label: 'Full Name',
                              hint: 'Madison Carter',
                              prefixIcon: Icons.person_outline_rounded,
                              validator: controller.validateFullName,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              controller: controller.emailController,
                              label: 'Email',
                              hint: 'you@example.com',
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: Validators.email,
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordField(
                              controller: controller.passwordController,
                              label: 'Password',
                              hint: 'Create a strong password',
                              validator: Validators.password,
                            ),
                            const SizedBox(height: 16),
                            AuthPasswordField(
                              controller: controller.confirmPasswordController,
                              label: 'Confirm Password',
                              hint: 'Re-enter your password',
                              validator: controller.validateConfirmPassword,
                            ),
                            const SizedBox(height: 22),
                            PrimaryButton(
                              label: 'Start Training',
                              icon: Icons.bolt_rounded,
                              isLoading: isSubmitting,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await controller.submit();
                                  if (context.mounted)
                                    context.go(AppRoutes.setup);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const _DividerLabel(label: 'or sign up with'),
                    const SizedBox(height: 16),
                    const SocialLoginRow(),
                    const SizedBox(height: 22),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.70),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () => context.push(AppRoutes.login),
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                color: AppColors.seedLime,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
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

class _MiniHero extends StatelessWidget {
  const _MiniHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            AppColors.seedLime.withValues(alpha: 0.24),
            AppColors.electricOrange.withValues(alpha: 0.18),
            Colors.white.withValues(alpha: 0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NEW SEASON',
                  style: TextStyle(
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's build your strongest routine.",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    height: 1.08,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create your profile and unlock plans shaped around your goals.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.72),
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

class _DividerLabel extends StatelessWidget {
  const _DividerLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.16))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.62)),
          ),
        ),
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.16))),
      ],
    );
  }
}
