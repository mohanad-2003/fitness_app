import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:fitness_app/view/weekly_challenge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChallengePage extends StatelessWidget {
  final String image;
  final String name;
  final String details;
  const ChallengePage({
    super.key,
    required this.image,
    required this.name,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity.w,
            height: double.infinity.h,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity.w,
            height: double.infinity.h,
            color: Colors.black.withOpacity(0.3),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => "",
                    child: Icon(Icons.star, color: Colors.white, size: 20.sp),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => Get.to(NotificationPage()),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => Get.to(ProfilePage()),
                    child: Icon(Icons.person, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xffB3A0FF),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/work.png"),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            textAlign: TextAlign.center,
                            details,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff232323),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                GestureDetector(
                  onTap:
                      () => Get.to(WeeklyChallenge(image: image, name: name)),
                  child: Container(
                    width: 250.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        "Start Now",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ),
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
