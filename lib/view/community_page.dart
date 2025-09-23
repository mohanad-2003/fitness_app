import 'package:fitness_app/controller/comunity_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class CommunityPage extends StatelessWidget {
  ComunityController comunityController = Get.put(ComunityController());
  CommunityPage({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWorkout(name: "Community"),
                    SizedBox(height: 10.h),
                    Obx(() {
                      final current = comunityController.currentCategory.value;
                      return SizedBox(
                        height: 32.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,

                          itemBuilder: (context, index) {
                            final isSelected = current == index;
                            final item = comunityController.categories[index];

                            return GestureDetector(
                              onTap:
                                  () =>
                                      comunityController.selectCategory(index),
                              child: Container(
                                width: 160.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color:
                                      isSelected
                                          ? Color(0xffE2F163)
                                          : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    item,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isSelected
                                              ? Color(0xff232323)
                                              : Color(0xff896CFE),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (c, i) => SizedBox(width: 5.w),
                          itemCount: comunityController.categories.length,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                if (comunityController.currentCategory.value == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 347.h,
                        color: Color(0xffB3A0FF),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.asset(
                                  "assets/comm.png",
                                  width: 323.w,
                                  height: 310.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  width: double.infinity,
                                  //  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    ),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                      horizontal: 10.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Cycling Challenge",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffE2F163),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => "",
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/time.png",
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  "15 Minutes",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 20.w),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/calories.png",
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.w),
                                                Text(
                                                  "100 Kcal",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
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
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Forums",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Color(0xffE2F163),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: double.infinity,
                              height: 300.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color(0xff896CFE),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 20.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildForums(
                                      "Strength Training Techniques",
                                      " Discussion on training methods",
                                      "See All",
                                      "Today 17:05",
                                    ),
                                    SizedBox(height: 5.h),
                                    _buildForums(
                                      "Nutrition and Diet Strategies",
                                      "Meal planning, supplementation preferences",
                                      "See All",
                                      "Today 17:05",
                                    ),
                                    _buildForums(
                                      "Cardiovascular Fitness",
                                      "About different types of cardio workouts",
                                      "See All",
                                      "Today 17:05",
                                    ),
                                    _buildForums(
                                      "Strength Training Techniques",
                                      "Strategies for improving flexibility and joint mobility to prevent injuries",
                                      "See All",
                                      "Today 17:05",
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
                } else if (comunityController.currentCategory.value == 1) {
                  return SizedBox();
                } else {
                  return SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildForums(String title, String subtitl, String all, String date) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // العنوان + See All
      Row(
        children: [
          // العنوان يتمدّد ويقص لو طال
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            all,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      // السطر الثاني: subtitle + التاريخ
      Row(
        children: [
          // خلي السب تايتل يتمدّد ويقصّ
          Expanded(
            child: Text(
              subtitl,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13.sp, color: Colors.white),
              softWrap: false,
            ),
          ),
          SizedBox(width: 8.w),
          // التاريخ ثابت على اليمين
          Text(
            date,
            style: TextStyle(fontSize: 13.sp, color: Colors.white),
            softWrap: false,
          ),
        ],
      ),

      Divider(color: Colors.white),
    ],
  );
}
