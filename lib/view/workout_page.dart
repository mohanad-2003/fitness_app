import 'package:fitness_app/controller/work_out_controller.dart';
import 'package:fitness_app/view/advance_category.dart';
import 'package:fitness_app/view/functional_page.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/intermediate_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutPage extends StatelessWidget {
  final WorkOutController workOutController = Get.put(WorkOutController());
  final ScrollController scrollController = ScrollController();

  WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212020),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header and Categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWorkout(name: "Workout"),
                  const SizedBox(height: 10),
                  _buildCategory(workOutController.workoutList),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ✅ محتوى Beginner فقط
            Obx(() {
              if (workOutController.currentIndex.value == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContainer(
                      "assets/woman.png",
                      "functional training",
                      "45 Minutes",
                      "1450 Kcal",
                      "5 exercises",
                      onTap:
                          () => Get.to(
                            FunctionalPage(),
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 500),
                          ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's Go Beginner",
                            style: TextStyle(
                              color: Color(0xffE2F163),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Explore Different Workout Styles",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else if (workOutController.currentIndex.value == 1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContainer(
                      "assets/cardio.png",
                      "cardio fitness",
                      "45 Minutes",
                      "120 Kcal",
                      "5 exercises",
                      onTap:
                          () => Get.to(
                            IntermediateCategory(),
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 500),
                          ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Keep raising your level",
                            style: TextStyle(
                              color: Color(0xffE2F163),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Explore Intermediate Workouts",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else if (workOutController.currentIndex.value == 2) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContainer(
                      "assets/advance.png",
                      "Upper Body Strength",
                      "60 Minutes",
                      "120 Kcal",
                      "5 exercises",
                      onTap: () {
                        Get.to(
                          AdvanceCategory(),
                          transition: Transition.zoom,
                          duration: Duration(seconds: 2),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Unlock Your Potential",
                            style: TextStyle(
                              color: Color(0xffE2F163),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Explore Advanced Fitness Routines",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),

            // ✅ التمارين أو رسالة لا يوجد شيء
            Expanded(
              child: Obx(() {
                if (workOutController.currentIndex.value == 0) {
                  return _buildWorkoutCategory(
                    scrollController,
                    workOutController.beginner,
                  );
                } else if (workOutController.currentIndex.value == 1) {
                  return _buildWorkoutCategory(
                    scrollController,
                    workOutController.intermediate,
                  );
                } else if (workOutController.currentIndex.value == 2) {
                  return _buildWorkoutCategory(
                    scrollController,
                    workOutController.advance,
                  );
                } else {
                  return Text("don't anything");
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // الكاتيجوري
  Widget _buildCategory(List<Map<String, dynamic>> workoutList) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var workout = workoutList[index];
          return GestureDetector(
            onTap: () {
              workOutController.SelectedIndex(index);
            },
            child: Obx(() {
              bool isSelected = workOutController.currentIndex.value == index;
              return Container(
                width: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? const Color(0xffE2F163) : Colors.white,
                ),
                child: Center(
                  child: Text(
                    workout['name'],
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          isSelected
                              ? const Color(0xff232323)
                              : const Color(0xff896CFE),
                    ),
                  ),
                ),
              );
            }),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: workoutList.length,
      ),
    );
  }

  GestureDetector _buildContainer(
    String image,
    String title,
    String time,
    String calory,
    String exercises, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 242,
        color: const Color(0xffB3A0FF),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Stack(
              children: [
                Image.asset(image, width: 323, height: 198, fit: BoxFit.cover),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 134,
                    height: 21,
                    decoration: const BoxDecoration(
                      color: Color(0xffE2F163),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "training of the day",
                        style: TextStyle(
                          color: Color(0xff212020),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: const Color(0xff212020).withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Color(0xffE2F163),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.star, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset(
                                "assets/time.png",
                                width: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                time,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                "assets/calories.png",
                                width: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                calory,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                "assets/run.png",
                                width: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                exercises,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
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

  // قائمة التمارين
  Widget _buildWorkoutCategory(
    ScrollController scroll,
    List<RxMap<String, dynamic>> items,
  ) {
    return ListView.separated(
      controller: scroll,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        final RxMap<String, dynamic> item = items[index]; // ✅ RxMap
        return Obx(
          () => Container(
            width: double.infinity,
            height: 117,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'] ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff212020),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          if (item.containsKey('time')) ...[
                            Image.asset("assets/time.png"),
                            const SizedBox(width: 5),
                            Text(
                              item['time'] ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 15),
                          ],
                          if (item.containsKey('calory')) ...[
                            Image.asset("assets/calories.png"),
                            const SizedBox(width: 5),
                            Text(
                              item['calory'] ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 5),
                      if (item.containsKey('exercises')) ...[
                        Row(
                          children: [
                            Image.asset("assets/run.png"),
                            const SizedBox(width: 5),
                            Text(
                              item['exercises'] ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item['image'] ?? "",
                        width: 153,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                Container(color: Colors.grey[300]),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap:
                            () => workOutController.toggleFavorite(
                              item,
                            ), // ✅ بدون خطأ
                        child: Icon(
                          item['isfavorit'] == true
                              ? Icons.star_rate_rounded
                              : Icons.star_rate_rounded,
                          color:
                              item['isfavorit'] == true
                                  ? Colors.yellow
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: items.length,
    );
  }
}
