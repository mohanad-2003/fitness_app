import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../authentication/presentation/widgets/auth_background.dart';

class SetupIntroPage extends StatelessWidget {
  const SetupIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Column(
          children: [
            Image.asset(
              'assets/setup.png',
              width: double.infinity,
              height: 463,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              textAlign: TextAlign.center,
              "Consistency Is\n the Key To Progress.\nDon't Give Up!",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF6CF96C),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                'Start your fitness journey today!\nTrack your progress, stay consistent, and achieve your goals step by step.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                label: 'Next',
                onPressed: () => context.push(AppRoutes.setupGender),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
