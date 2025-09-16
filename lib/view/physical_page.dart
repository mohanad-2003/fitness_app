import 'package:fitness_app/view/fill_profile.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PhysicalPage extends StatefulWidget {
  const PhysicalPage({super.key});

  @override
  _PhysicalPageState createState() => _PhysicalPageState();
}

class _PhysicalPageState extends State<PhysicalPage> {
  // Variables to hold selected button states
  int selectedIndex = -1;

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
                      "Physical Activity Level",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 40),
                    // Centering the Physical containers
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPhysical("Beginner", 0xffFFFFFF, 0xff896CFE, 0),
                          SizedBox(height: 20),
                          _buildPhysical(
                            "Intermediate",
                            0xffFFFFFF,
                            0xff896CFE,
                            1,
                          ),
                          SizedBox(height: 20),
                          _buildPhysical("Advance", 0xffFFFFFF, 0xff896CFE, 2),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Get.to(FillProfile());
                      },
                      child: Container(
                        width: 178,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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

  Widget _buildPhysical(String physic, int color, int text, int index) {
    // Determine if the button is selected
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index; // Update the selected index
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Color(0xffE2F163)
                    : Color(color), // Change color if selected
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              physic,
              style: TextStyle(
                color:
                    isSelected
                        ? Colors.black
                        : Color(
                          text,
                        ), // Change text color to black when selected
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
