import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';

class VideoAdvance extends StatelessWidget {
  const VideoAdvance({super.key});

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
              child: HeaderWorkout(name: "Advance"),
            ),
            SizedBox(height: 10),
            _buildVideo(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: _buildSquat(),
            ),
          ],
        ),
      ),
    );
  }
}

Container _buildVideo() {
  return Container(
    height: 504,
    width: double.infinity,
    color: const Color(0xffB3A0FF),
    child: Center(
      child: Stack(
        alignment: Alignment.center, // ⬅️ يجعل كل شيء يتمركز بشكل تلقائي
        children: [
          // 📸 الصورة بالخلف
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/incline.png",
              width: 323,
              height: 458,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                print("Star tapped");
              },
              child: const Icon(Icons.star, color: Color(0xffE2F163)),
            ),
          ),

          Container(
            width: 157,
            height: 157,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff896CFE),
            ),
            child: Center(
              child: Image.asset("assets/play.png", height: 80, width: 67),
            ),
          ),
        ],
      ),
    ),
  );
}

Container _buildSquat() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xffE2F163),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "Incline Bench Sit up",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff212020),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit. Sed cursus libero eget.",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(height: 10),
            Container(
              width: 291,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/time.png", width: 10, height: 11),
                      SizedBox(width: 5),
                      Text(
                        "30 seconds",
                        style: TextStyle(
                          color: Color(0xff232323),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/calories.png", width: 10, height: 11),
                      SizedBox(width: 5),
                      Text(
                        "3 Rep",
                        style: TextStyle(
                          color: Color(0xff232323),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/run.png", width: 10, height: 11),
                      SizedBox(width: 5),
                      Text(
                        "Advanced",
                        style: TextStyle(
                          color: Color(0xff232323),
                          fontSize: 14,
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
