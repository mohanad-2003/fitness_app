// meal_idea_page.dart
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

  final MealIdeaController c = Get.put(MealIdeaController());

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
                        children: List.generate(c.category.length, (index) {
                          final isSelected = c.currentCategory.value == index;
                          return Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20.r),
                              onTap: () {
                                c.selectdCategory(index);
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
                                    c.category[index],
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
                        }),
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
                  child: _buildBodyForCategory(c),
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
          isStarred: c.isRecommendedFav(c.currentCategory.value, i),
          onStarTap: () => c.toggleRecommendedFav(c.currentCategory.value, i),
        ),
      );
    }

    // تفاصيل عنصر من Recipes For You
    if (c.showRecipeDetails.value) {
      final i = c.selectedRecipeIndex.value;
      Map<String, dynamic> m = {};
      if (currentIndex == 0) {
        m = c.breakfastRecipes[i];
      } else if (currentIndex == 1) {
        m = c.lunchRecipes[i];
      } else if (currentIndex == 2) {
        m = c.dinnerRecipes[i];
      }
      final ingredients = List<String>.from(m['ingredients'] ?? []);
      return _DetailsContainer(
        key: const ValueKey('recipes_details'),
        onBack: c.closeDetails,
        child: CommonDetailsHeader(
          name: m['name'],
          time: m['time'],
          calory: m['calory'],
          image: m['image'],
          tagText: "Recipe",
          ingredients: ingredients,
          preparation: m['preparation'], // ✅ صار يعرض طريقة التحضير
          isStarred: c.isRecipeFav(c.currentCategory.value, i),
          onStarTap: () => c.toggleRecipeFav(c.currentCategory.value, i),
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
          isStarred: c.isTopFav(c.currentCategory.value, m['name']),
          onStarTap: () => c.toggleTopFav(c.currentCategory.value, m['name']),
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
    final Map<String, dynamic> top;
    final List<Map<String, dynamic>> rec, recipes;

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

    // تحويل إلى موديلات الواجهة
    final List<RecommendedMealItem> recommendedList = [
      for (var m in rec)
        RecommendedMealItem(
          image: m['image'],
          name: m['name'],
          time: m['time'],
          calory: m['calory'],
        ),
    ];

    final List<RecipesMealItem> recipesList = [
      for (var m in recipes)
        RecipesMealItem(
          image: m['image'],
          name: m['name'],
          time: m['time'],
          calory: m['calory'],
        ),
    ];

    final currentCat = controller.currentCategory.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),

        // ملاحظة مهمة:
        // لفّينا الودجت التالية بـ Obx حتى تُعاد بناء النجوم عند تغيّر favorites.
        // نقرأ length لضمان التبعية التفاعلية لهذا الـ Obx على RxSet.
        Obx(() {
          final _ =
              controller.favorites.length; // يضمن إعادة البناء عند أي تغيير

          return CommonMealIdeaPage(
            image: top['image'],
            name: top['name'],
            time: top['time'],
            calories: top['calory'],

            // القوائم
            recommendedList: recommendedList,
            recipesList: recipesList,

            // فتح التفاصيل (Top / Recommended / Recipes)
            onHeaderDetails: controller.openTop,
            onRecommendedPlayTap: (i) => controller.openRecommended(i),
            onRecipeTap: (i) => controller.openRecipe(i),

            // ==== حالة المفضّلة ====
            // فحص
            isHeaderFav: () => controller.isTopFav(currentCat, top['name']),
            isRecommendedFav: (i) => controller.isRecommendedFav(currentCat, i),
            isRecipeFav: (i) => controller.isRecipeFav(currentCat, i),

            // تبديل
            onHeaderStarTap:
                () => controller.toggleTopFav(currentCat, top['name']),
            onRecommendedStarTap:
                (i) => controller.toggleRecommendedFav(currentCat, i),
            onRecipeStarTap: (i) => controller.toggleRecipeFav(currentCat, i),
          );
        }),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: GestureDetector(
            onTap: onBack,
            child: const Icon(Icons.arrow_back, color: Colors.amber),
          ),
        ),
        child,
      ],
    );
  }
}
