import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fitness_app/controller/meal_idea_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/common_mealidea_page.dart';
import 'package:fitness_app/view/common_details_header.dart';

class MealIdeaPage extends StatelessWidget {
  MealIdeaPage({super.key});

  final MealIdeaController mealIdeaController = Get.put(MealIdeaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان + التبويبات
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWorkout(name: "Meal Idea"),
                    SizedBox(height: 20.h),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          mealIdeaController.category.length,
                          (index) {
                            final isSelected =
                                mealIdeaController.currentCategory.value ==
                                index;
                            return Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20.r),
                                onTap: () {
                                  mealIdeaController.selectdCategory(index);
                                },
                                child: Container(
                                  height: 32.h,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color:
                                        isSelected
                                            ? const Color(0xffE2F163)
                                            : Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      mealIdeaController.category[index],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color:
                                            isSelected
                                                ? const Color(0xff232323)
                                                : const Color(0xff896CFE),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              // المحتوى أسفل التبويبات
              Obx(() {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: _buildBodyForCategory(mealIdeaController),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBodyForCategory(MealIdeaController c) {
    final currentIndex = c.currentCategory.value;

    // تفاصيل عنصر من Recommended
    if (c.showRecommendedDetails.value) {
      final i = c.selectedRecommendedIndex.value;
      Map<String, dynamic> m = {};

      if (currentIndex == 0) {
        m = c.breakfastRecommended[i];
      } else if (currentIndex == 1) {
        m = c.lunchRecommended[i];
      } else if (currentIndex == 2) {
        m = c.dinnerRecommended[i];
      }

      final ingredients = List<String>.from(m['ingredients'] ?? []);
      return _DetailsContainer(
        key: const ValueKey('rec_details'),
        onBack: c.closeDetails,
        child: CommonDetailsHeader(
          name: m['name'],
          time: m['time'],
          calory: m['calory'],
          image: m['image'],
          tagText: "Recommended",
          ingredients: ingredients,
        ),
      );
    }

    // تفاصيل الهيدر البنفسجي (Top)
    if (c.showTopDetails.value) {
      Map<String, dynamic> m = {};

      if (currentIndex == 0) {
        m = c.breakfastTop;
      } else if (currentIndex == 1) {
        m = c.lunchTop;
      } else if (currentIndex == 2) {
        m = c.dinnerTop;
      }

      final ingredients = List<String>.from(m['ingredients'] ?? []);
      return _DetailsContainer(
        key: const ValueKey('top_details'),
        onBack: c.closeDetails,
        child: CommonDetailsHeader(
          name: m['name'],
          time: m['time'],
          calory: m['calory'],
          image: m['image'],
          tagText: "Recipe Of The Day",
          ingredients: ingredients,
          preparation: m['preparation'],
        ),
      );
    }

    // الوضع العادي
    return _ListSection(key: const ValueKey('list'), controller: c);
  }
}

class _ListSection extends StatelessWidget {
  final MealIdeaController controller;
  const _ListSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // اختيار مصادر الداتا حسب التبويب
    late Map<String, dynamic> top;
    late List<Map<String, dynamic>> rec, recipes;

    if (controller.currentCategory.value == 0) {
      top = controller.breakfastTop;
      rec = controller.breakfastRecommended;
      recipes = controller.breakfastRecipes;
    } else if (controller.currentCategory.value == 1) {
      top = controller.lunchTop;
      rec = controller.lunchRecommended;
      recipes = controller.lunchRecipes;
    } else {
      top = controller.dinnerTop;
      rec = controller.dinnerRecommended;
      recipes = controller.dinnerRecipes;
    }

    // تحويل إلى موديلات الواجهة (لو كنت تستخدمها)
    final recommendedList =
        rec.map((m) {
          return RecommendedMealItem(
            image: m['image'],
            name: m['name'],
            time: m['time'],
            calory: m['calory'],
          );
        }).toList();

    final recipesList =
        recipes.map((m) {
          return RecipesMealItem(
            image: m['image'],
            name: m['name'],
            time: m['time'],
            calory: m['calory'],
          );
        }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        CommonMealIdeaPage(
          image: top['image'],
          name: top['name'],
          time: top['time'],
          calories: top['calory'],
          recommendedList: recommendedList,
          recipesList: recipesList,

          // يفتح تفاصيل الهيدر داخل الصفحة
          onHeaderDetails: controller.openTop,

          // تفاصيل عنصر من Recommended
          onRecommendedPlayTap: (i) => controller.openRecommended(i),

          // اختياري: نجوم المفضلة
          onHeaderStarTap: () {},
          onRecommendedStarTap: (i) {},
        ),
      ],
    );
  }
}

class _DetailsContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback onBack;
  const _DetailsContainer({
    super.key,
    required this.child,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Back
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              SizedBox(width: 8.w),
              Text(
                "Meal Ideas",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
