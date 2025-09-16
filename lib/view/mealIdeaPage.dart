import 'package:fitness_app/controller/meal_idea_controller.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/common_mealidea_page.dart';
import 'package:fitness_app/view/details_meal_idea.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/show_details_recommend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWorkout(name: "Meal Ideas"),
                    SizedBox(height: 20.h),
                    Obx(() {
                      return Row(
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
                                onTap:
                                    () => mealIdeaController.selectdCategory(
                                      index,
                                    ),
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
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              // ✅ AnimatedSwitcher لانتقال سلس بين القائمة والتفاصيل
              Obx(() {
                if (mealIdeaController.currentCategory.value != 0) {
                  return const SizedBox.shrink();
                }

                final bool showTop = mealIdeaController.showTopDetails.value;
                final bool showRec =
                    mealIdeaController.showRecommendedDetails.value;

                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  transitionBuilder: (child, animation) {
                    final slide = Tween<Offset>(
                      begin: const Offset(0, 0.06),
                      end: Offset.zero,
                    ).animate(animation);
                    return SlideTransition(
                      position: slide,
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child:
                      showRec
                          ? ShowDetailsRecommend(
                            key: const ValueKey('rec-details'),
                            controller: mealIdeaController,
                          )
                          : (showTop
                              ? TopRecipeDetails(
                                key: const ValueKey('top-details'),
                                controller: mealIdeaController,
                              )
                              : Column(
                                key: const ValueKey('list'),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //      _HeroTopCard(controller: mealIdeaController),
                                  SizedBox(height: 20.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonMealIdeaPage(
                                        image: "assets/sp.png",
                                        name: "Spinach And Tomato Omelette",
                                        time: "10 min",
                                        calories: "250 kcal",
                                        recommendedList: [
                                          RecommendedMealItem(
                                            image: "assets/green.png",
                                            name: "Green Celery Juice",
                                            time: "7 min",
                                            calory: "120 kcal",
                                          ),
                                          RecommendedMealItem(
                                            image: "assets/fruit.png",
                                            name: "Fruit Smoothie",
                                            time: "10 min",
                                            calory: "250 kcal",
                                          ),
                                        ],
                                        onHeaderStarTap: () {
                                          /* حط مفضلة */
                                        },
                                        onRecommendedPlayTap: (i) {
                                          /* شغّل فيديو الوصفة */
                                        },
                                        onRecommendedStarTap: (i) {
                                          /* مفضلة عنصر */
                                        },
                                        recipesList: [
                                          RecipesMealItem(
                                            name: "Delights with Greek yogurt",
                                            calory: "200 Cal",
                                            image: "assets/delights.png",
                                            time: "6 Minutes",
                                          ),
                                          RecipesMealItem(
                                            name: "Avocado and Egg Toast",
                                            calory: "150 Cal",
                                            image: "assets/avocado.png",
                                            time: "15 Minutes",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
