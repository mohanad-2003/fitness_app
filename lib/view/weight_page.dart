import 'package:fitness_app/controller/weight_controller.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:fitness_app/view/height_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightPage extends StatelessWidget {
  WeightPage({super.key});
  final WeightController weightController = Get.put(WeightController());
  final PageController pageController = PageController(
    viewportFraction: 0.2,
    initialPage: 70,
  );
  final minWeight = 40;
  final maxWeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBack(),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      "What Is Your Weight?",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE2F163),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "kG",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 30,
                                  color: Colors.black,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "LB",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // الأرقام فوق الشريط البنفسجي
                    // PageView.builder(
                    //   itemBuilder: (context, index) {
                    //     var weight = minWeight + index;
                    //     return Obx(() {
                    //       return Center(
                    //         child: Text(
                    //           "$weight",
                    //           style: TextStyle(
                    //             color:
                    //                 weight ==
                    //                         weightController
                    //                             .selectedWeight
                    //                             .value
                    //                     ? Colors.black
                    //                     : Colors.white,
                    //             fontSize:
                    //                 weight ==
                    //                         weightController
                    //                             .selectedWeight
                    //                             .value
                    //                     ? 20
                    //                     : 18,
                    //           ),
                    //         ),
                    //       );
                    //     });
                    //   },
                    //   controller: pageController,
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: maxWeight - minWeight + 1,
                    //   onPageChanged: (index) {
                    //     weightController.setWeight(minWeight + index);
                    //   },
                    // ),
                    // SizedBox(height: 20),
                    // // الشريط البنفسجي مع الأعمدة
                    // Container(
                    //   width: double.infinity,
                    //   color: Color(0xffB3A0FF),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(20),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: List.generate(
                    //        20, // الأعمدة
                    //         (index) => Container(
                    //           height: 20,
                    //           width: 2,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.arrow_drop_up_outlined,
                      size: 60,
                      color: Color(0xffE2F163),
                    ),
                    SizedBox(height: 10),

                    Text(
                      "75 Kg",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // زر Continue
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("Selected Weight", "You selected: 75 Kg");
                        Get.to(HeightPage());
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
      ),
    );
  }
}
