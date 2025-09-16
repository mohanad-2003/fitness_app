import 'package:fitness_app/controller/set_password_controller.dart';
import 'package:fitness_app/view/finger_print_page.dart';
import 'package:fitness_app/view/headerApge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final SetPasswordController controller = Get.put(SetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "Set Password"),
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore\n magna aliqua. ",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 20),

                    // ✅ Form مربوط بالكنترولر
                    Container(
                      width: double.infinity,
                      color: const Color(0xffB3A0FF),
                      child: Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(fontSize: 17),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: controller.passwordController,
                                validator: controller.validatePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "*************",
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Confirm Password",
                                style: TextStyle(fontSize: 17),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller:
                                    controller.confirmPasswordController,
                                validator: controller.validateConfirmPassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "*************",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ✅ زر Reset Password مع التحقق
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (controller.validateForm()) {
                            Get.to(() => FingerPrintPage());
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
                              "Reset Password",
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
            ],
          ),
        ),
      ),
    );
  }
}
