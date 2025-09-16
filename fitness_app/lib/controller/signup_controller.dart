import 'package:fitness_app/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // قائمة المستخدمين المسجلين
  RxList<SignupModel> signupModel = <SignupModel>[].obs;

  // المفتاح للتحقق من صحة النموذج
  final formKey = GlobalKey<FormState>();

  // المحركات للتحكم في الحقول
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // التحقق من صحة النموذج
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // التحقق من الاسم الكامل
  String? validateFullName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "Full name is required";
    }
    return null;
  }

  // التحقق من البريد الإلكتروني
  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  // التحقق من كلمة المرور
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  // التحقق من تأكيد كلمة المرور
  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm password is required";
    }
    if (confirmPassword != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  // إضافة مستخدم جديد
  void addUser() {
    if (!validateForm()) return;

    SignupModel user = SignupModel(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    signupModel.add(user);

    // تفريغ الحقول
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // تنظيف المحركات عند تدمير الكنترولر
  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
