import 'package:fitness_app/view/bottom_page.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillProfile extends StatelessWidget {
  const FillProfile({super.key});

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
                      "Fill Your Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 143,
                      color: Color(0xffB3A0FF),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  "assets/profile.png",
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 27,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE2F163),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.edit, size: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildForm("Full name", "Madison Smith"),
                        SizedBox(height: 15),
                        _buildForm("Nickname", "Madison "),
                        SizedBox(height: 15),
                        _buildForm("Email", "madisons@example.com"),
                        SizedBox(height: 15),
                        _buildForm("Mobile Number", "+123 567 89000"),
                      ],
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Get.to(BottomPage()),
                      child: Container(
                        width: 172,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F163),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Start",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40), // Added space at the bottom
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

Widget _buildForm(String text, String data) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20), // Balanced padding
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Color(0xff896CFE),
            fontSize: 16, // Adjusted font size for labels
          ),
        ),
        SizedBox(height: 10), // Reduced space between label and input
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: data,
            hintStyle: TextStyle(fontSize: 18), // Adjusted hint font size
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    ),
  );
}
