// onboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardPage extends StatelessWidget {
  final String image;
  final String icon;
  final String title;

  const OnboardPage({
    super.key,
    required this.image,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity.w,
          height: double.infinity.h,
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.3)),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity.w,
                color: const Color(0xffB3A0FF),
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icon, height: 43.h, width: 38.w),
                      SizedBox(height: 10.h),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
