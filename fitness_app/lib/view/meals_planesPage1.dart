import 'package:fitness_app/controller/meal_plane_controller.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/meal_plane_page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsPlanespage1 extends StatelessWidget {
  MealsPlanespage1({super.key});

  final MealPlaneController controller = Get.put(MealPlaneController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var titleSize = screenWidth * 0.056;
    var subTitleSize = screenHeight * 0.015;

    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWorkout(name: "Meal plane"),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Dietary Preferences",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Color(0xffE2F163),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "What are your dietary preferences?",
                  style: TextStyle(color: Colors.white, fontSize: subTitleSize),
                ),
                SizedBox(height: screenHeight * 0.03),

                // خيارات النظام الغذائي
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.016,
                    children:
                        controller.preferences.map((preference) {
                          bool isSelected =
                              controller.selectedPreference.value == preference;

                          return GestureDetector(
                            onTap:
                                () => controller.selectPreference(preference),
                            child: SizedBox(
                              width: (screenWidth / 1) - (screenWidth * 0.09),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Radio-style circle
                                  Container(
                                    width: screenWidth * 0.058,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(
                                          0xff5C4BFF,
                                        ), // Purple border
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenWidth * 0.03,
                                                height: screenHeight * 0.02,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffE2F163),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: screenWidth * 0.013),
                                  Text(
                                    preference,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.016,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: screenHeight * 0.07),
                Text(
                  "Allergies",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Color(0xffE2F163),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Do you have any food allergies we should know about?",
                  style: TextStyle(color: Colors.white, fontSize: subTitleSize),
                ),

                SizedBox(height: screenHeight * 0.02),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.017,
                    children:
                        controller.allergies.map((allergie) {
                          final isSelected =
                              controller.selectedAllergies.value == allergie;
                          return GestureDetector(
                            onTap: () => controller.changeAllergies(allergie),
                            child: SizedBox(
                              width: (screenWidth / 2) - (screenWidth * 0.07),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.058,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff896CFE),
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenWidth * 0.03,
                                                height: screenHeight * 0.02,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffE2F163),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: screenWidth * 0.013),
                                  Text(
                                    allergie,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.016,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: screenHeight * 0.07),
                Text(
                  "Meal Types",
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Color(0xffE2F163),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Which meals do you want to plan?",
                  style: TextStyle(fontSize: subTitleSize, color: Colors.white),
                ),
                SizedBox(height: screenHeight * 0.02),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.03,
                    runSpacing: screenHeight * 0.017,
                    children:
                        controller.mealTypes.map((mealType) {
                          final isSelected =
                              controller.selectedMealsType.value == mealType;
                          return GestureDetector(
                            onTap: () => controller.changeMealType(mealType),
                            child: SizedBox(
                              width: (screenWidth / 2) - (screenWidth * 0.07),
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth * 0.058,
                                    height: screenHeight * 0.025,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff896CFE),
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenWidth * 0.03,
                                                height: screenHeight * 0.02,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffE2F163),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: screenWidth * 0.013),
                                  Text(
                                    mealType,
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.016,
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
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        MealPlanePage2(),
                        duration: Duration(seconds: 2),
                        transition: Transition.fade,
                      );
                    },

                    child: Container(
                      width: screenHeight * 0.17,
                      height: screenHeight * 0.04,
                      decoration: BoxDecoration(
                        color: Color(0xffE2F163),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 17,
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
