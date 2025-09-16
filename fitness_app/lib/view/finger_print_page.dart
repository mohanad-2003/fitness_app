import 'package:fitness_app/view/headerApge.dart';
import 'package:fitness_app/view/setup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FingerPrintPage extends StatelessWidget {
  const FingerPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: "Set Your Fingerprint"),
              SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore et\n dolore. ",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Color(0xffB3A0FF),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/finger.png",
                            width: 182.1,
                            height: 235.07,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      children: [
                        _buildButton("Skip"),
                        SizedBox(height: 20),
                        _buildButton("Continue"),
                      ],
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

  Widget _buildButton(String text) {
    return GestureDetector(
      onTap: () => Get.to(Setup()),
      child: Container(
        width: 178,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
