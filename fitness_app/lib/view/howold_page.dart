import 'package:fitness_app/controller/age_controllrt.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:fitness_app/view/weight_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HowoldPage extends StatelessWidget {
  HowoldPage({super.key});
  final AgeControllert controller = Get.put(AgeControllert());
  PageController pageController = PageController(
    viewportFraction: 0.2,
    initialPage: 18,
  );
  var minAge = 10;
  var maxAge = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderBack(),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    "How Old Are You?",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // ✅ العمر المختار بشكل كبير
                  Obx(() {
                    return Text(
                      "${controller.selectedAge.value}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Color(0xffE2F163),
                    size: 60,
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 100,
                    color: Color(0xffB3A0FF),
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView.builder(
                          itemBuilder: (context, index) {
                            var age = minAge + index;
                            return Obx(() {
                              return Center(
                                child: Text(
                                  "$age",
                                  style: TextStyle(
                                    fontSize:
                                        age == controller.selectedAge.value
                                            ? 40
                                            : 30,
                                    color:
                                        age == controller.selectedAge.value
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            });
                          },
                          controller: pageController,
                          itemCount: maxAge - minAge + 1,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            controller.setAge(minAge + index);
                          },
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width / 2 - 40,
                          top: 0,
                          bottom: 0,
                          child: Container(width: 2, color: Colors.white),
                        ),
                        Positioned(
                          right: MediaQuery.of(context).size.width / 2 - 40,
                          bottom: 0,
                          top: 0,
                          child: Container(width: 2, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // زر المتابعة
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Selected Age",
                        "You selected: ${controller.selectedAge.value}",
                      );
                      Get.to(WeightPage());
                    },
                    child: Container(
                      width: 178,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
      ),
    );
  }
}
