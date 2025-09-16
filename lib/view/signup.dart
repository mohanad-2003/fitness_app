import 'package:fitness_app/controller/signup_controller.dart';
import 'package:fitness_app/view/headerApge.dart';
import 'package:fitness_app/view/login_page.dart';
import 'package:fitness_app/view/setup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "Create Account"),
              const Center(
                child: Text(
                  "Let's Start!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// ✅ Form مرتبط بـ controller
              Form(
                key: controller.formKey,
                child: Container(
                  width: double.infinity,
                  color: const Color(0xffB3A0FF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _CustomFormField(
                        "Full name",
                        "Full Name",
                        fieldType: FieldType.fullName,
                      ),
                      SizedBox(height: 16),
                      _CustomFormField(
                        "Email",
                        "example@gmail.com",
                        fieldType: FieldType.email,
                      ),
                      SizedBox(height: 16),
                      _CustomFormField(
                        "Password",
                        "**************",
                        fieldType: FieldType.password,
                      ),
                      SizedBox(height: 16),
                      _CustomFormField(
                        "Confirm Password",
                        "**************",
                        fieldType: FieldType.confirmPassword,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "By continuing, you agree to",
                      style: TextStyle(color: Colors.white),
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Terms of Use ",
                            style: TextStyle(color: Color(0xffE2F163)),
                          ),
                          TextSpan(text: "and"),
                          TextSpan(
                            text: " Privacy Policy",
                            style: TextStyle(color: Color(0xffE2F163)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /// زر Sign Up المرتبط بالدالة
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (controller.validateForm()) {
                      controller.addUser();
                      Get.to(Setup());
                    }
                  },
                  child: Container(
                    width: 178,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "or sign up with",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocial("assets/gmail.png"),
                  const SizedBox(width: 10),
                  _buildSocial("assets/face.png"),
                  const SizedBox(width: 10),
                  _buildSocial("assets/mark.png"),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Log in",
                        style: const TextStyle(color: Color(0xffE2F163)),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(LoginPage());
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 👇 أيقونات التسجيل الاجتماعي
Widget _buildSocial(String image) {
  return Container(
    width: 34.1,
    height: 34.1,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(child: Image.asset(image)),
  );
}

// 👇 نوع الحقل لتحديد الكنترولر
enum FieldType { fullName, email, password, confirmPassword }

// 👇 ويدجت مخصص لحقل النموذج مع التحقق وربط الكنترولر
class _CustomFormField extends StatelessWidget {
  final String title;
  final String hint;
  final FieldType fieldType;

  const _CustomFormField(this.title, this.hint, {required this.fieldType});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find<SignupController>();

    TextEditingController textController;
    String? Function(String?)? validator;

    switch (fieldType) {
      case FieldType.fullName:
        textController = controller.fullNameController;
        validator = controller.validateFullName;
        break;
      case FieldType.email:
        textController = controller.emailController;
        validator = controller.validateEmail;
        break;
      case FieldType.password:
        textController = controller.passwordController;
        validator = controller.validatePassword;
        break;
      case FieldType.confirmPassword:
        textController = controller.confirmPasswordController;
        validator = controller.validateConfirmPassword;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 17, color: Colors.black)),
        const SizedBox(height: 8),
        TextFormField(
          controller: textController,
          obscureText:
              fieldType == FieldType.password ||
              fieldType == FieldType.confirmPassword,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff232323)),
          ),
        ),
      ],
    );
  }
}
