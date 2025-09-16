import 'package:fitness_app/controller/category_controller.dart';
import 'package:fitness_app/view/category_charts.dart';
import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutLogs extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  WorkoutLogs({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.17;
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: HeaderWorkout(name: "Progress Tracking"),
              ),
              SizedBox(height: 10),
              _buildContainer(containerHeight),
              SizedBox(height: 20),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    categoryController.categories.length,
                    (index) {
                      final isSelected =
                          categoryController.selectCategory.value == index;

                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            // Workout Logs
                            categoryController.changeCategory(index);
                          } else if (index == 1) {
                            // قبل الانتقال خلي الـ index يساوي 1 (Charts)
                            categoryController.changeCategory(1);
                            Get.to(
                              () => CategoryCharts(),
                              transition: Transition.size,
                              duration: Duration(seconds: 4),
                            );
                          }
                        },

                        child: Container(
                          width: 151,
                          height: 31,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                isSelected
                                    ? const Color(0xffE2F163)
                                    : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              categoryController.categories[index],
                              style: TextStyle(
                                color:
                                    isSelected
                                        ? const Color(0xff232323)
                                        : const Color(0xff896CFE),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),

              SizedBox(height: 10),
              Obx(() {
                if (categoryController.selectCategory.value == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        _buildCategory("Choose Date"),
                        SizedBox(height: 20),
                        _buildActivity(),
                      ],
                    ),
                  );
                } else if (categoryController.selectCategory.value == 1) {
                  return SizedBox();
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

  // تعديل _buildCategory مع خط فوق النص، النص، خط تحت، ثم أيام الأسبوع
  Widget _buildCategory(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // خط فوق النص
        Divider(color: Colors.white, thickness: 1),
        const SizedBox(height: 5),

        // النص في الوسط
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xffE2F163),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Month",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => "",
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Color(0xffB3A0FF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),

        // خط تحت النص
        Divider(color: Colors.white, thickness: 1),
        const SizedBox(height: 12),

        // صف أيام الأسبوع أفقي
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildWeekDay("MON"),
            _buildWeekDay("TUE"),
            _buildWeekDay("WED"),
            _buildWeekDay("THU"),
            _buildWeekDay("FRI"),
            _buildWeekDay("SAT"),
            _buildWeekDay("SUN"),
          ],
        ),
        const SizedBox(height: 12),

        // كونتينر واحد يحتوي كل أيام الشهر
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Wrap(
            spacing: 20,
            runSpacing: 8,
            children: List.generate(31, (index) {
              final day = (index + 1).toString();
              bool isBlack = (index + 1) % 7 == 0 || (index + 1) >= 29;

              // تحقق إذا كان هذا اليوم هو رقم 9 لتغيير اللون والخلفية
              bool isSelectedDay = index == 8;

              return Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelectedDay ? Color(0xffE2F163) : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color:
                          isSelectedDay
                              ? Color(0xff232323)
                              : isBlack
                              ? Color(0xff232323)
                              : Color(0xff896CFE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDay(String day) {
    return Container(
      width: 40,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff896CFE),
      ),
      child: Center(
        child: Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget infoItem(String value, String label) {
    return IntrinsicHeight(
      // يجعل ارتفاع Row يعتمد على أعلى عنصر داخله
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, // يملأ ارتفاع Row
        children: [
          Container(
            width: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffE2F163),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildContainer(double height) {
    return Container(
      width: double.infinity,
      height: height,
      color: const Color(0xffB3A0FF),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Madison",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset("assets/fe.png"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Text(
                      "Age :",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "26",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    infoItem("75 Kg", "Weight"),
                    const SizedBox(width: 30),
                    infoItem("1.65 CM", "Height"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundImage: const AssetImage("assets/profile.png"),
              radius: height / 2.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Activites",
          style: TextStyle(fontSize: 20, color: Color(0xffE2F163)),
        ),
        SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true, // مهم ليأخذ حجم المحتوى فقط
          physics:
              NeverScrollableScrollPhysics(), // يمنع التمرير الداخلي للقائمة
          itemBuilder: (context, index) {
            final item = categoryController.Activities[index];
            return GestureDetector(
              onTap: () => "",
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xff896CFE),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            item['image'],
                            width: 25,
                            height: 27,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/calories.png"),
                                  color: Color(0xff896CFE),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  item['calory'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff212020),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff232323),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item['date'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffB3A0FF),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff896CFE),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/time.png",
                                  color: Color(0xff896CFE),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  item['duration'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff896CFE),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: categoryController.Activities.length,
        ),
      ],
    );
  }
}
