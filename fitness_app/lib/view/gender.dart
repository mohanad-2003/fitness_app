import 'package:fitness_app/controller/gender_controller.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:fitness_app/view/howold_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gender extends StatelessWidget {
  Gender({super.key});

  final GenderController controller = Get.put(GenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBack(),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "What’s Your Gender",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: const Color(0xffB3A0FF),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ♂️ Male
                    Obx(() {
                      bool isSelected = controller.isSelected("male");
                      return GestureDetector(
                        onTap: () => controller.selectGender("male"),
                        child: Container(
                          width: 162.95,
                          height: 162.95,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            color:
                                isSelected
                                    ? Color(0xffE2F163)
                                    : Color(0xff232323),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/male.png",
                              width: 64,
                              height: 67,
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    const Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ♀️ Female
                    Obx(() {
                      bool isSelected = controller.isSelected("female");
                      return GestureDetector(
                        onTap: () => controller.selectGender("female"),
                        child: Container(
                          width: 162,
                          height: 162,
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? const Color(0xffE2F163)
                                    : Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/female.png",
                              width: 45,
                              height: 81,
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 10),
                    const Text(
                      'Female',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // زر Continue
                    GestureDetector(
                      onTap: () {
                        Get.to(HowoldPage());
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
