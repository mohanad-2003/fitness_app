import 'package:fitness_app/controller/weeky_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WeeklyChallenge extends StatelessWidget {
  WeekyController weekyController = Get.put(WeekyController());
  final String image;
  final String name;

  WeeklyChallenge({super.key, required this.image, required this.name});

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

              // الصورة الكبيرة
              GestureDetector(
                onTap: () {},
                child: Container(
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
                                          "5 Exercises",
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
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRound("Round 1", weekyController.roundweekly1),
                    SizedBox(height: 20.h),
                    _buildRound("Round 2", weekyController.roundweekly2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRound(String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Appcolor.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 250.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xff232323),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    item.time,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Appcolor.containerColor,
                    ),
                  ),
                  leading: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Appcolor.containerColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  trailing: Text(
                    item.type,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Appcolor.containerColor,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(height: 10.h),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
