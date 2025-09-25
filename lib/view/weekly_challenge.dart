import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyChallenge extends StatelessWidget {
  final String image;
  final String name;

  const WeeklyChallenge({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: HeaderWorkout(name: "Weekly Challenge"),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                color: Color(0xffB3A0FF),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15.w,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image(
                            image: AssetImage("assets/comm.png"),
                            width: 310.w,
                            height: 165.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r),
                              ),
                              color: Colors.black.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 10.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xffE2F163),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage("assets/time.png"),
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "25 Minute",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Image.asset(
                                        "assets/calories.png",
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "750 Cal",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Image.asset(
                                        "assets/run.png",
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "5 Exercised",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
