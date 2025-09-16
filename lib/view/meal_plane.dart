import 'package:fitness_app/view/meals_planesPage1.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealPlane extends StatelessWidget {
  const MealPlane({super.key});

  @override
  Widget build(BuildContext context) {
    // نجيب عرض وارتفاع الشاشة
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    // نحدد نسبة للـ Container البنفسجي
    var boxHeight = screenHeight * 0.19;

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Image.asset(
            "assets/meal.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // شفافية
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),

          // أيقونات الأعلى
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.05,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_left_rounded,
                      size: screenWidth * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(NotificationPage());
                    },
                    child: Icon(
                      Icons.notifications,
                      size: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfilePage());
                    },
                    child: Icon(
                      Icons.person,
                      size: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // المحتوى الوسطي
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الصندوق البنفسجي
                Container(
                  width: screenWidth * 2,
                  height: boxHeight,
                  color: Color(0xffB3A0FF),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.1,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/apple.png"),
                              width: screenWidth * 0.07,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Text(
                              "Meal Plans",
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          textAlign: TextAlign.center,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Color(0xff232323),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // زر
                InkWell(
                  onTap: () {
                    Get.to(
                      MealsPlanespage1(),
                      duration: Duration(seconds: 1),
                      transition: Transition.zoom,
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.55,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.38),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Text(
                        "Know Your Plan",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
