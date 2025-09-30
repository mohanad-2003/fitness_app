import 'package:fitness_app/view/onboardingScreen.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Get.to(OnboardingScreen()));
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/ob1.png",
            width: double.infinity.w,
            height: double.infinity.h,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity.w,
            height: double.infinity.h,
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
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Image.asset(
                  "assets/FB.png",
                  height: 84.h,
                  width: 182.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Color(0xffE2F163), fontSize: 54.sp),
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
