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
                if (mealIdeaController.currentCategory.value == 0) {
                  final bool showTop = mealIdeaController.showTopDetails.value;
                  final bool showRec =
                      mealIdeaController.showRecommendedDetails.value;

                  if (showRec) {
                    return ShowDetailsRecommend(controller: mealIdeaController);
                  } else if (showTop) {
                    return TopRecipeDetails(controller: mealIdeaController);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                    );
                  }
                } else if (mealIdeaController.currentCategory.value == 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonMealIdeaPage(
                        image: "assets/lunch.png",
                        name: "Salmon And Avocado Salad",
                        calories: "300 Cal",
                        time: "15 Minutes",
                        recommendedList: [
                          RecommendedMealItem(
                            image: "assets/qui.png",
                            name: "Quinoa salad",
                            time: "25 Minutes",
                            calory: "300 Cal",
                          ),
                          RecommendedMealItem(
                            image: "assets/burrito.png",
                            name: "burrito with vegetables",
                            time: "20 Minutes",
                            calory: "250 Cal",
                          ),
                        ],

                        recipesList: [
                          RecipesMealItem(
                            name: "Teriyaki chicken with brown rice",
                            calory: "375 Cal",
                            image: "assets/ter.png",
                            time: "45 Minutes",
                          ),
                          RecipesMealItem(
                            name: "Baked salmon",
                            calory: "350 Cal",
                            image: "assets/baked.png",
                            time: "30 Minutes",
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (mealIdeaController.currentCategory.value == 2) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonMealIdeaPage(
                        image: "assets/grilled",
                        name: "Grilled Chicken Salad",
                        calories: "240 Cal",
                        time: "20 Minutes",
                        recommendedList: [
                          RecommendedMealItem(
                            image: "assets/chickp.png",
                            name: "Chickpea salad",
                            time: "20 Minutes",
                            calory: "300 Cal",
                          ),
                          RecommendedMealItem(
                            image: "assets/lentil.png",
                            name: "lentil soup",
                            time: "30 Minutes",
                            calory: "200 Cal",
                          ),
                        ],
                        recipesList: [
                          RecipesMealItem(
                            name: "Turkey and Avocado Wrap",
                            calory: "230 Cal",
                            image: "assets/turkey.png",
                            time: "15 Minutes",
                          ),
                          RecipesMealItem(
                            name: "Chicken Breast Stuffed with Spinach ",
                            calory: "250 Cal",
                            image: "assets/chicken.png",
                            time: "30 Minutes",
                          ),
                        ],
                      ),
                    ],
                  );
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
