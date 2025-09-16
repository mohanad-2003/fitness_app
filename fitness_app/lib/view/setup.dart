import 'package:fitness_app/view/gender.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/setup.png",
                width: double.infinity,
                height: 463,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Consistency Is\n the Key To progress.\nDon't Give Up!",
                      style: TextStyle(fontSize: 20, color: Color(0xffE2F163)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Color(0xffB3A0FF),
                      child: Padding(
                        padding: EdgeInsets.all(30),

                        child: Text(
                          textAlign: TextAlign.center,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.to(Gender()),
                      child: Container(
                        width: 178,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
