import 'package:fitness_app/view/header_workout.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String title;
  const DetailsPage({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: HeaderWorkout(name: "Your Routine"),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 504,
                color: Color(0xffB3A0FF),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                         image,
                          width: 323,
                          height: 458,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => "",
                          child: Icon(Icons.star, color: Color(0xffE2F163)),
                        ),
                      ),
                      Container(
                        width: 157,
                        height: 157,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff896CFE),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 150,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  width: double.infinity,
                  //   height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE2F163),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 45,
                    ),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff212020),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          textAlign: TextAlign.center,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 36,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/time.png"),
                                  SizedBox(width: 5),
                                  Text(
                                    "15 Minutes",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff232323),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/calories.png"),
                                  SizedBox(width: 5),
                                  Text(
                                    "4 Rep",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff232323),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/run.png"),
                                  SizedBox(width: 5),
                                  Text(
                                    "Advance",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff232323),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
