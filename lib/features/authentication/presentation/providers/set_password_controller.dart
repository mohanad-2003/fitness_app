import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/validators.dart';

part 'set_password_controller.g.dart';

@riverpod
class SetPasswordController extends _$SetPasswordController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void build() {
    ref.onDispose(() {
      passwordController.dispose();
      confirmPasswordController.dispose();
    });
  }

  String? validatePassword(String? value) => Validators.password(value);

  String? Function(String?) get validateConfirmPassword =>
      Validators.matches(passwordController);

  bool validateForm() => formKey.currentState?.validate() ?? false;
}
