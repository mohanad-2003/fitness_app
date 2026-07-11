import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/auth_credentials.dart';

part 'login_controller.g.dart';

/// TextEditingControllers stay as plain fields (Riverpod doesn't manage
/// widget lifecycle objects) but submission is exposed through an
/// AsyncNotifier so the page can show a loading state consistently with
/// the rest of the app instead of a bespoke bool flag per screen.
@riverpod
class LoginController extends _$LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      emailController.dispose();
      passwordController.dispose();
    });
  }

  Future<LoginCredentials> submit() async {
    state = const AsyncLoading();
    final credentials = LoginCredentials(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    // No backend yet — this is where the auth repository call goes later.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = const AsyncData(null);
    return credentials;
  }
}
