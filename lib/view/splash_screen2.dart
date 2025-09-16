import 'package:fitness_app/view/onboardingScreen.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Get.to(OnboardingScreen()));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/ob1.png",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black.withOpacity(0.4),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Color(0xffE2F163),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  "assets/FB.png",
                  height: 84,
                  width: 182,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(0xffE2F163), fontSize: 54),
                    children: [
                      TextSpan(
                        text: "FIT",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "BODY"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
