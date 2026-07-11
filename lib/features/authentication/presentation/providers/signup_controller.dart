import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/validators.dart';
import '../../domain/auth_credentials.dart';

part 'signup_controller.g.dart';

@riverpod
class SignupController extends _$SignupController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  FutureOr<void> build() {
    ref.onDispose(() {
      fullNameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
    });
  }

  String? validateFullName(String? value) =>
      Validators.required(value, field: 'Full name');

  String? Function(String?) get validateConfirmPassword =>
      Validators.matches(passwordController);

  Future<SignupCredentials> submit() async {
    state = const AsyncLoading();
    final credentials = SignupCredentials(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = const AsyncData(null);
    return credentials;
  }
}
