import 'package:fitness_app/controller/forgot_password_controller.dart';
import 'package:fitness_app/view/Set_password.dart';
import 'package:fitness_app/view/headerApge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpasswordPage extends StatelessWidget {
  ForgotpasswordPage({super.key});

  // تسجيل الكنترولر
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "Forgotten Password"),
              const SizedBox(height: 40),

              // العنوان والنص التوضيحي
              Center(
                child: Column(
                  children: const [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore\n magna aliqua.",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // حقل البريد داخل خلفية بنفسجية
              Container(
                width: double.infinity,
                color: const Color(0xffB3A0FF),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter your Email",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.emailController,
                          validator: controller.validateEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "example@example.com",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // زر الاستمرار
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (controller.validateForm()) {
                      Get.to(() => SetPassword());
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
                        "Continue",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
