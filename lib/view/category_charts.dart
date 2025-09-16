import 'package:fitness_app/controller/category_controller.dart';
import 'package:fitness_app/view/bar.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/workout_logs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCharts extends StatelessWidget {
  CategoryCharts({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWorkout(name: "Progress Tracking"),
                const SizedBox(height: 20),

                // شريط الفئات
                Obx(() {
                  return Row(
                    children: List.generate(
                      categoryController.categories2.length,
                      (index) {
                        final isSelected =
                            categoryController.selectCategory.value == index;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                // قبل الانتقال خلي الـ index يساوي 0 (Workout Logs)
                                categoryController.changeCategory(0);
                                Get.to(
                                  () => WorkoutLogs(),
                                  transition: Transition.size,
                                  duration: Duration(seconds: 4),
                                );
                              } else if (index == 1) {
                                categoryController.changeCategory(index);
                              }
                            },

                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    isSelected
                                        ? const Color(0xffE2F163)
                                        : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  categoryController.categories2[index],
                                  style: TextStyle(
                                    color:
                                        isSelected
                                            ? const Color(0xff232323)
                                            : const Color(0xff896CFE),
                                    fontSize: 14,
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

                const SizedBox(height: 20),

                // شاشة التقدم
                Obx(() {
                  if (categoryController.selectCategory.value == 1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My Progress",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffE2F163),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "January 12th",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffE2F163),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ======= الكونتينر المعدّل كما في الصورة =======
                        Container(
                          width: double.infinity,
                          height: 285,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Steps",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xffE2F163),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "170",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffE2F163),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "165",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffE2F163),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "155",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffE2F163),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "150",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xffE2F163),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 208,
                                        height: 147,

                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // عدّل القيم لرفع/خفض الجزء الأصفر
                                            Bar(fillFraction: 0.60),
                                            Bar(fillFraction: 0.80),
                                            Bar(fillFraction: 0.40),
                                            Bar(fillFraction: 0.40),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(width: 12),

                                // الأعمدة الأربعة
                                const SizedBox(height: 10),
                                const Divider(color: Colors.white),

                                // أسماء الشهور
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Text(
                                        "Jan",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffE2F163),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Feb",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffE2F163),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Mar",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffE2F163),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Apr",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xffE2F163),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildDetails("Thu", "14", '3,679', "1hr40m"),
                        SizedBox(height: 10),
                        _buildDetails("Wen", "20", '5,789', "1hr20m"),
                        SizedBox(height: 10),
                        _buildDetails("Sat", "22", '1,859', "1hr10m"),
                        // ======= نهاية الكونتينر =======
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
      ),
    );
  }
}

Container _buildDetails(String day, String numDay, String steps, String hours) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff896CFE),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: TextStyle(fontSize: 13, color: Colors.white)),
              SizedBox(height: 5),
              Text(
                numDay,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Container(
            width: 1,
            height: 40, // ارتفاع الخط
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Steps",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                steps,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Duations",
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset("assets/time.png", color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    hours,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
