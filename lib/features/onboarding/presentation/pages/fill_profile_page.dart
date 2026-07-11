import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../authentication/presentation/widgets/auth_background.dart';
import '../../../authentication/presentation/widgets/auth_header.dart';

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Column(
          children: [
            const AuthHeader(),
            const SizedBox(height: 20),
            const Text(
              'Fill Your Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Complete your profile information to personalize your experience.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            const _ProfilePicture(),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  AppTextField(label: 'Full Name', hint: 'Madison Smith'),
                  SizedBox(height: 15),
                  AppTextField(label: 'Nickname', hint: 'Madison'),
                  SizedBox(height: 15),
                  AppTextField(label: 'Email', hint: 'madisons@example.com'),
                  SizedBox(height: 15),
                  AppTextField(label: 'Mobile Number', hint: '+123 567 89000'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PrimaryButton(
                label: 'Start',
                onPressed: () => context.go(AppRoutes.home),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 140,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFFE2F163),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.edit, size: 18, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
