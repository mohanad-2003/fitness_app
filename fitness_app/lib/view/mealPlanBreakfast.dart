import 'package:fitness_app/controller/mealBreakfastController.dart';
import 'package:fitness_app/view/appColor.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class MealPlanbreakfast extends StatelessWidget {
  Mealbreakfastcontroller mealbreakfastcontroller = Get.put(
    Mealbreakfastcontroller(),
  );
  MealPlanbreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.045,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWorkout(name: "Meal Plans"),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Breakfast plan for you",
                  style: TextStyle(
                    color: Appcolor.primaryText,
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                  style: TextStyle(
                    fontSize: screenHeight * 0.015,
                    color: Color(0Xffffffff),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Obx(() {
                  return Wrap(
                    spacing: screenWidth * 0.05,
                    runSpacing: screenHeight * 0.04,
                    direction: Axis.vertical,
                    children:
                        mealbreakfastcontroller.mealBreakfast.map((breakFast) {
                          final isSelected =
                              mealbreakfastcontroller.selectedIndex.value ==
                              breakFast;
                          return GestureDetector(
                            onTap:
                                () => mealbreakfastcontroller.changeIndex(
                                  breakFast.length,
                                ),
                            child: SizedBox(
                              width: screenWidth * 0.9,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: screenWidth * 0.04,
                                    height: screenWidth * 0.05,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Appcolor.containerColor,
                                        width: 3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child:
                                        isSelected
                                            ? Center(
                                              child: Container(
                                                width: screenWidth * 0.02,
                                                height: screenHeight * 0.016,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Appcolor.primaryText,
                                                ),
                                              ),
                                            )
                                            : null,
                                  ),
                                  SizedBox(width: screenWidth * 0.03),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: screenHeight * 0.04,
                                              horizontal: screenWidth * 0.05,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  breakFast['name'],
                                                  style: TextStyle(
                                                    color: Appcolor.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.007,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          "assets/time.png",
                                                          color:
                                                              Appcolor.primary,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenWidth *
                                                              0.005,
                                                        ),
                                                        Text(
                                                          breakFast['time'],
                                                          style: TextStyle(
                                                            fontSize:
                                                                screenHeight *
                                                                0.01,
                                                            color: Color(
                                                              0xff212020,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          "assets/calories.png",
                                                          color:
                                                              Appcolor.primary,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              screenWidth *
                                                              0.005,
                                                        ),
                                                        Text(
                                                          breakFast['calory'],
                                                          style: TextStyle(
                                                            fontSize:
                                                                screenHeight *
                                                                0.01,
                                                            color: Color(
                                                              0xff212020,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  breakFast['image'],
                                                  width: screenWidth * 0.25,
                                                  height: screenHeight * 0.13,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                right: 10,
                                                top: 10,
                                                child: GestureDetector(
                                                  onTap: () => "",
                                                  child: Icon(
                                                    Icons.star_purple500_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Container(
                    width: screenWidth * 0.35,
                    height: screenHeight * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Appcolor.primaryText,
                    ),
                    child: Center(
                      child: Text(
                        "See Recipe",
                        style: TextStyle(
                          color: Appcolor.primary,
                          fontSize: screenHeight * 0.016,
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
      ),
    );
  }
}
