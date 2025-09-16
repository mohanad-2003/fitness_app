import 'package:fitness_app/controller/meal_idea_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDetailsRecommend extends StatelessWidget {
  const ShowDetailsRecommend({super.key, required this.controller});
  final MealIdeaController controller;

  @override
  Widget build(BuildContext context) {
    final r = controller.recommended[controller.selectedRecommendedIndex.value];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap:
                        () => controller.showRecommendedDetails.value = false,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Meal Ideas",
                    style: TextStyle(
                      color: Appcolor.primaryText,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                r['name'] ?? '',
                style: TextStyle(
                  color: Appcolor.primaryText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16.sp,
                    color: const Color(0xff896CFE),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    r['time'] ?? '',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                  SizedBox(width: 20.w),
                  Icon(
                    Icons.local_fire_department,
                    size: 16.sp,
                    color: const Color(0xff896CFE),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    r['calory'] ?? '',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),

        // صورة + زر التشغيل
        Container(
          width: double.infinity,
          color: const Color(0xffB3A0FF),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image.asset(r['image'] ?? '', fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.star,
                            color: Color(0xffE2F163),
                          ),
                        ),
                      ),
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff896CFE),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow_sharp,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Ingredients
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xffE2F163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              ...List<String>.from(r['ingredients'] ?? []).map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
