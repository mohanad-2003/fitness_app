import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordSettingsPage extends StatelessWidget {
  const PasswordSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.canPop() ? context.pop() : null,
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: AppColors.seedLime,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Password Setting',
                  style: TextStyle(color: AppColors.seedViolet, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Current Password',
              style: TextStyle(color: AppColors.seedViolet, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'New password',
              style: TextStyle(fontSize: 20, color: AppColors.seedViolet),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: 20),
            const Text(
              'Confirm New password',
              style: TextStyle(fontSize: 20, color: AppColors.seedViolet),
            ),
            const SizedBox(height: 10),
            const AppTextField(
              hint: '*************',
              obscureText: true,
              prefixIcon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
