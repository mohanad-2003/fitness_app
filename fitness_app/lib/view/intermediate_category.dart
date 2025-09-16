import 'package:fitness_app/view/header_workout.dart';
import 'package:fitness_app/view/kettlball.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntermediateCategory extends StatelessWidget {
  const IntermediateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: HeaderWorkout(name: "Intermediate"),
            ),
            _buildContainer(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Round 1",
                        style: TextStyle(
                          color: Color(0xffE2F163),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildRound(
                        "Kettlebell swing",
                        "00:30",
                        "repetition 3x",
                        Color(0xffE2F163),
                        () {
                          Get.to(
                            Kettlball(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 5),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      _buildRound(
                        "Shoulder Press",
                        "00:15",
                        "repetition 2x",
                        Color(0xffE2F163),
                        // () => Get.to(""),
                      ),
                      SizedBox(height: 10),
                      _buildRound(
                        "Hamstring Curls",
                        "00:30",
                        "repetition 3x",
                        Color(0xffB3A0FF),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Round 2",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffE2F163),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildRound(
                        "Bicep Curls",
                        "00:10",
                        "repetition 2x",
                        Color(0xffB3A0FF),
                        // () => Get.to(""),
                      ),
                      SizedBox(height: 10),
                      _buildRound(
                        "Barbell deadlift",
                        "00:10",
                        "repetition 4x",
                        Color(0xffB3A0FF),
                        // () => Get.to(""),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      width: double.infinity,
      height: 210,
      color: Color(0xffB3A0FF),
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/cardio.png",
                width: 320,
                height: 165,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 157,
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xffE2F163),
                ),
                child: Center(
                  child: Text(
                    "cardio fitness",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff212020),
                      fontWeight: FontWeight.bold,
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
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xff212020).withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/time.png",
                          color: Colors.white,
                          width: 14,
                          height: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "45 Minutes",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/calories.png",
                          color: Colors.white,
                          width: 14,
                          height: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "1450 Kcal",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/run.png",
                          color: Colors.white,
                          width: 14,
                          height: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Intermediate",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => "",
                      child: Icon(Icons.star, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRound(
  String name,
  var time,
  String speed,
  Color color, [
  VoidCallback? ontap,
]) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff232323),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        speed,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff896CFE),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset("assets/time.png", color: Color(0xffB3A0FF)),
                      SizedBox(width: 5),
                      Text(
                        time,
                        style: TextStyle(
                          color: Color(0xffB3A0FF),
                          fontSize: 12,
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
}
