import 'package:fitness_app/controller/mealBreakfastController.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/detailsMealPage.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/mealIdea_discover_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MealPlanbreakfast extends StatelessWidget {
  MealPlanbreakfast({super.key});

  final Mealbreakfastcontroller mealbreakfastcontroller = Get.put(
    Mealbreakfastcontroller(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.045.sw,
            vertical: 0.03.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWorkout(name: "Meal Plans"),
              SizedBox(height: 0.04.sh),

              Text(
                "Breakfast plan for you",
                style: TextStyle(
                  color: Appcolor.primaryText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),

              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xffffffff),
                ),
              ),
              SizedBox(height: 14.h),

              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: mealbreakfastcontroller.mealBreakfast.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final item = mealbreakfastcontroller.mealBreakfast[index];

                    return Obx(() {
                      final isSelected =
                          mealbreakfastcontroller.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () {
                          mealbreakfastcontroller.changeIndex(index);
                          Get.to(
                            Detailsmealpage(item: item),
                            duration: Duration(seconds: 2),
                            transition: Transition.fade,
                          );
                        },
                        child: Row(
                          children: [
                            // دائرة الاختيار
                            Container(
                              width: 28.r,
                              height: 28.r,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Appcolor.containerColor,
                                  width: 3.w,
                                ),
                              ),
                              child:
                                  isSelected
                                      ? Center(
                                        child: Container(
                                          width: 14.r,
                                          height: 14.r,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Appcolor.primaryText,
                                          ),
                                        ),
                                      )
                                      : null,
                            ),
                            SizedBox(width: 10.w),

                            // البطاقة
                            Expanded(
                              child: SizedBox(
                                height: 110.h, // ارتفاع البطاقة
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    children: [
                                      // الجزء النصي
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.h,
                                            horizontal: 16.w,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                item['name'],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Appcolor.primary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/time.png",
                                                    color: Appcolor.primary,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    item['time'],
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Appcolor.primary,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Image.asset(
                                                    "assets/calories.png",
                                                    color: Appcolor.primary,
                                                  ),
                                                  SizedBox(width: 2.w),
                                                  Text(
                                                    item['calory'],
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: Appcolor.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // الجزء الخاص بالصورة
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              item['image'],
                                              fit: BoxFit.cover,
                                              width: 0.30.sw,
                                              height: double.infinity,
                                            ),
                                            Positioned(
                                              right: 8.w,
                                              top: 8.h,
                                              child: GestureDetector(
                                                onTap:
                                                    () =>
                                                        mealbreakfastcontroller
                                                            .toggleFavorit(
                                                              index,
                                                            ),
                                                child: Obx(() {
                                                  // تحقق من حالة المفضلة
                                                  bool isFavorit =
                                                      mealbreakfastcontroller
                                                          .mealBreakfast[index]['isFavorit']
                                                          .value;
                                                  return Icon(
                                                    Icons.star,

                                                    color:
                                                        isFavorit
                                                            ? Color(0xffE2F163)
                                                            : Colors.white,
                                                    size: 24.sp,
                                                  );
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                ),
              ),

              SizedBox(height: 12.h),
              Center(
                child: GestureDetector(
                  onTap: () => Get.to(MealideaDiscoverPage()),
                  child: Container(
                    width: 0.45.sw,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Appcolor.primaryText,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "See Recipe",
                      style: TextStyle(
                        color: Appcolor.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
