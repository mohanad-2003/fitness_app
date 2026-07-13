import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void build() {
    ref.onDispose(emailController.dispose);
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;
}
