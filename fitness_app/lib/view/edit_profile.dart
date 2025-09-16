import 'package:fitness_app/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stylenormal = TextStyle(fontSize: 15, color: Colors.white);
    final styleWeight = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    double headerHeight = MediaQuery.of(context).size.height * 0.42;

    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildContainer(headerHeight),
                        SizedBox(height: 70),
                      ],
                    ),
                  ),
                  Positioned(
                    top: headerHeight - 40,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff896CFE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("75 Kg", style: styleWeight),
                              SizedBox(height: 5),
                              Text("Weight", style: stylenormal),
                            ],
                          ),

                          Container(width: 1, height: 40, color: Colors.white),
                          Column(
                            children: [
                              Text("28", style: styleWeight),
                              SizedBox(height: 5),
                              Text("Years Old", style: stylenormal),
                            ],
                          ),

                          Container(width: 1, height: 40, color: Colors.white),
                          Column(
                            children: [
                              Text("1.65 CM", style: styleWeight),
                              SizedBox(height: 5),
                              Text("Height", style: stylenormal),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildForm(),
              SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () => Get.to(ProfilePage()),
                  child: Container(
                    width: 142,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xffE2F163),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Update Profile",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Madison Smith",
                hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Email",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "madisons@example.com",
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Mobile Number",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "+123 567 89000",
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Date of birth",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "01 / 04 / 199X",
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Weight",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "75 Kg",
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Height",
              style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "1.65 CM",
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer(double headerHeight) {
    return Container(
      width: double.infinity,
      height: headerHeight,
      color: Color(0xffB3A0FF),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xffE2F163),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.png"),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 5,
                        child: Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE2F163),
                          ),
                          child: Center(child: Icon(Icons.edit)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Madison Smith",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "madisons@example.com",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Birthday: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: "April 1st",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
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
