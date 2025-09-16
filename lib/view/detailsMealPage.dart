import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/mealIdea_discover_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Detailsmealpage extends StatelessWidget {
  final Map<String, dynamic> item;
  const Detailsmealpage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final List ingredients = (item['ingredients'] ?? []) as List;
    final List preparation = (item['preparation'] ?? []) as List;

    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.045.sw,
                  vertical: 0.03.sh,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWorkout(name: "Meal plan"),
                    SizedBox(height: 0.04.sh),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item['name'] ?? '',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Appcolor.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.02.sh),
                    Row(
                      children: [
                        Image.asset(
                          "assets/time.png",
                          color: Appcolor.containerColor,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          item['time'] ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(
                          "assets/calories.png",
                          color: Appcolor.containerColor,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          item['calory'] ?? '',
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

              // Image banner
              Container(
                width: double.infinity,
                color: const Color(0xffB3A0FF),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 40.w,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item['image'] ?? '',
                      width: 323,
                      height: 198,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Ingredients
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.045.sw,
                  vertical: 0.03.sh,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Appcolor.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (ingredients.isEmpty)
                      Text(
                        "No ingredients provided.",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      )
                    else
                      ...List.generate(ingredients.length, (i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            "• ${ingredients[i]}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),

                    SizedBox(height: 20.h),

                    // Preparation
                    Text(
                      "Preparation",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Appcolor.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (preparation.isEmpty)
                      Text(
                        "No preparation steps provided.",
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      )
                    else
                      ...List.generate(preparation.length, (i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            "${i + 1}. ${preparation[i]}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: GestureDetector(
                  onTap: () => Get.to(MealideaDiscoverPage()),
                  child: Container(
                    width: 0.45.sw,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Appcolor.primaryText,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Save Recipe",
                      style: TextStyle(
                        color: Appcolor.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
