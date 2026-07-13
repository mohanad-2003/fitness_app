import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  bool validateForm() => formKey.currentState?.validate() ?? false;
}
