import 'package:fitness_app/view/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:3),
     () => Get.to(SplashScreen2()));

    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/FB.png", height: 62, width: 135),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Color(0xffE2F163), fontSize: 40),
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
    );
  }
}
