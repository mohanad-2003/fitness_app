import 'package:flutter/material.dart';

import '../../../authentication/presentation/widgets/auth_background.dart';
import '../../../authentication/presentation/widgets/auth_header.dart';

/// Common layout for every profile-setup wizard step: gradient background,
/// back header, and a bottom-anchored continue button.
class WizardScaffold extends StatelessWidget {
  const WizardScaffold({
    super.key,
    required this.title,
    required this.description,
    required this.body,
    required this.button,
  });

  final String title;
  final String description;
  final Widget body;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Column(
          children: [
            const AuthHeader(),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            body,
            const SizedBox(height: 50),
            button,
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
