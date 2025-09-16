import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/mealPlanBreakfast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealplanePage3 extends StatelessWidget {
  const MealplanePage3({super.key});

  @override
  Widget build(BuildContext context) {
    Color titleColor = const Color(0xffE2F163);
    Color borderColor = const Color(0xff896CFE);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.058,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWorkout(name: "Meals Plans"),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(MealPlanbreakfast()),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: borderColor, width: 7),
                          ),
                          child: Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: borderColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Creating a plan for you",
                        style: TextStyle(
                          color: titleColor,
                          fontSize: screenHeight * 0.022,
                        ),
                      ),
                    ],
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
