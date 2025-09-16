import 'package:fitness_app/controller/login_controller.dart';
import 'package:fitness_app/view/forgotPassword_page.dart';
import 'package:fitness_app/view/headerApge.dart';
import 'package:fitness_app/view/setup.dart';
import 'package:fitness_app/view/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "Log In"),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              /// ✅ Form مع ربط الحقول بالكنترولر
              Form(
                key: controller.formKey,
                child: Container(
                  width: double.infinity,
                  color: const Color(0xffB3A0FF),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username or email",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.emailController,
                        validator: controller.validateEmail,
                        decoration: _inputDecoration("example@example.com"),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.passwordController,
                        validator: controller.validatePassword,
                        obscureText: true,
                        decoration: _inputDecoration("********"),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () => Get.to(ForgotpasswordPage()),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              /// ✅ زر Log In
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
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "or sign up with",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
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

              /// ✅ التنقل إلى Sign Up
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Color(0xffE2F163),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(SignupPage());
                              },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ ديكوريشن للحقل
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      ),
      fillColor: Colors.white,
      filled: true,
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black),
    );
  }

  // ✅ ويدجت السوشيال
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
}
