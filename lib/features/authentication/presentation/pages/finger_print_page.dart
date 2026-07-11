import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_header.dart';

class FingerPrintPage extends StatelessWidget {
  const FingerPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
          child: Column(
            children: [
              const AuthHeader(title: 'Biometric Access'),
              const SizedBox(height: 28),
              Text(
                'Unlock your plan faster.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  height: 1.04,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Add fingerprint access for a secure, frictionless start before every workout.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.72),
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 34),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 34),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.seedLime.withValues(alpha: 0.20),
                      AppColors.aquaBlue.withValues(alpha: 0.16),
                      Colors.white.withValues(alpha: 0.06),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.seedLime.withValues(alpha: 0.08),
                      ),
                    ),
                    Image.asset(
                      'assets/finger.png',
                      width: 168,
                      height: 218,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                label: 'Enable Fingerprint',
                icon: Icons.fingerprint_rounded,
                onPressed: () => context.go(AppRoutes.setup),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () => context.go(AppRoutes.setup),
                child: Text(
                  'Skip for now',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
