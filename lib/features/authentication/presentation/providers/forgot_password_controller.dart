import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/validators.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void build() {
    ref.onDispose(emailController.dispose);
  }

  String? validateEmail(String? value) => Validators.email(value);

  bool validateForm() => formKey.currentState?.validate() ?? false;
}
