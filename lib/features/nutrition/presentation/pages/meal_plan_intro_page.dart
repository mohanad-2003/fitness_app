import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/top_icon_actions.dart';

class MealPlanIntroPage extends StatelessWidget {
  const MealPlanIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final boxHeight = height * 0.19;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/meal.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.3),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.05,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.canPop() ? context.pop() : null,
                    child: Icon(
                      Icons.arrow_left_rounded,
                      size: width * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const TopIconActions(color: Colors.white),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 2,
                  height: boxHeight,
                  color: const Color(0xffB3A0FF),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                      horizontal: width * 0.1,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/apple.png',
                              width: width * 0.07,
                            ),
                            SizedBox(width: width * 0.03),
                            Text(
                              'Meal Plans',
                              style: TextStyle(
                                fontSize: width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        Text(
                          textAlign: TextAlign.center,
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: const Color(0xff232323),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () => context.push(AppRoutes.mealPlanPreferences),
                  child: Container(
                    width: width * 0.55,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.38),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Know Your Plan',
                        style: TextStyle(
                          fontSize: width * 0.05,
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
