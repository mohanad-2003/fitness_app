import 'package:fitness_app/controller/meal_plan2_conroller.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/mealPlanePage3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MealPlanePage2 extends StatelessWidget {
  MealPlan2Conroller mealPlan2Conroller = Get.put(MealPlan2Conroller());
  MealPlanePage2({super.key});

  @override
  Widget build(BuildContext context) {
    Color titleColor = Color(0xffE2F163);
    Color borderColor = Color(0xff896CFE);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var titleSize = screenWidth * 0.056;
    var subTitleSize = screenHeight * 0.013;
    var sizedBoxHeight = screenHeight * 0.04;
    var sizeBoxWidth = screenWidth * 0.015;

    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.058,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWorkout(name: "Meal Palns"),
                SizedBox(height: sizedBoxHeight),
                Text(
                  "Caloric Goal",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "What is your daily caloric intake goal?",
                  style: TextStyle(fontSize: subTitleSize, color: Colors.white),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.016,
                    children:
                        mealPlan2Conroller.CaloricGoal.map((caloric) {
                          final isSelected =
                              mealPlan2Conroller.selectedMeal.value == caloric;
                          return GestureDetector(
                            onTap: () => mealPlan2Conroller.changeMeal(caloric),
                            child: SizedBox(
                              width: (screenWidth / 1) - (screenWidth * 0.07),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.058,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: borderColor),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenHeight * 0.02,
                                                height: screenHeight * 0.014,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: titleColor,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: sizeBoxWidth),
                                  Text(
                                    caloric,
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.012,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: sizedBoxHeight),
                Text(
                  "Cooking Time Preference",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "How much time are you willing to spend cooking each meal?",
                  style: TextStyle(fontSize: subTitleSize, color: Colors.white),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.016,
                    children:
                        mealPlan2Conroller.cookingTime.map((cook) {
                          final isSelected =
                              mealPlan2Conroller.selectedCook.value == cook;

                          return GestureDetector(
                            onTap: () => mealPlan2Conroller.changeCook(cook),
                            child: SizedBox(
                              width: (screenWidth / 2) - (screenWidth * 0.07),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.056,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: borderColor),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenHeight * 0.02,
                                                height: screenHeight * 0.014,
                                                decoration: BoxDecoration(
                                                  color: titleColor,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: sizeBoxWidth),
                                  Text(
                                    cook,
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.012,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: sizedBoxHeight),
                Text(
                  "Number of Servings",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "How many servings do you need per meal?",
                  style: TextStyle(fontSize: subTitleSize, color: Colors.white),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.016,
                    children:
                        mealPlan2Conroller.numberOfServing.map((numOfServing) {
                          final isSelected =
                              mealPlan2Conroller.selectNumbde.value ==
                              numOfServing;
                          return GestureDetector(
                            onTap:
                                () => mealPlan2Conroller.changeNumber(
                                  numOfServing,
                                ),
                            child: SizedBox(
                              width: (screenWidth / 2) - (screenWidth * 0.08),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.056,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: borderColor),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenHeight * 0.02,
                                                height: screenHeight * 0.014,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: titleColor,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: sizeBoxWidth),
                                  Text(
                                    numOfServing,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.012,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: screenHeight * 0.06),
                Center(
                  child: GestureDetector(
                    onTap:
                        () => Get.to(
                          MealplanePage3(),
                          duration: Duration(seconds: 2),
                          transition: Transition.circularReveal,
                        ),
                    child: Container(
                      width: screenHeight * 0.17,
                      height: screenHeight * 0.04,
                      decoration: BoxDecoration(
                        color: titleColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontSize: screenHeight * 0.023,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
