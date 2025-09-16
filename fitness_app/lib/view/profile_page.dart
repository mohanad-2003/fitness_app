import 'package:fitness_app/view/bottom_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app/view/Setting_page.dart';
import 'package:fitness_app/view/edit_profile.dart';
import 'package:fitness_app/view/help_page.dart';
import 'package:fitness_app/controller/bottom-controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final styleBoldWhite = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
    final styleNormalWhite = TextStyle(color: Colors.white, fontSize: 15);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double headerHeight = screenHeight * 0.42;

    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: headerHeight,
                          color: Color(0xffB3A0FF),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.03,
                              horizontal: screenWidth * 0.07,
                            ),
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
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/profile.png",
                                        ),
                                        radius: 70,
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
                                      SizedBox(height: 4),
                                      Text(
                                        "madisons@example.com",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
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
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
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
                        ),
                        SizedBox(height: screenHeight * 0.1),
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
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff896CFE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("75 Kg", style: styleBoldWhite),
                              Text("Weight", style: styleNormalWhite),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          Column(
                            children: [
                              Text("28", style: styleBoldWhite),
                              Text("Years Old", style: styleNormalWhite),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          Column(
                            children: [
                              Text("1.65 CM", style: styleBoldWhite),
                              Text("Height", style: styleNormalWhite),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildListTile(
                Icons.person,
                "Profile",
                () => Get.to(EditProfilePage()),
              ),
              SizedBox(height: 10),
              _buildListTile(Icons.star, "Favorite", () {
                final bottomController = Get.find<BottomController>();
                bottomController.selectIndex(
                  2,
                ); // 2 هو مؤشر FavoritePage في الـ BottomNavigationBar
                Get.back(); // للعودة إلى BottomPage مع إظهار المفضلة
              }),

              SizedBox(height: 10),
              _buildListTile(Icons.lock_open_sharp, "Privacy Policy"),
              SizedBox(height: 10),
              _buildListTile(
                Icons.settings,
                "Setting",
                () => Get.to(SettingPage()),
              ),
              SizedBox(height: 10),
              _buildListTile(
                Icons.support_agent_rounded,
                "Help",
                () => Get.to(HelpPage()),
              ),
              SizedBox(height: 10),
              _buildListTile(Icons.logout, "Log out", () {
                _showLogoutConfirmation(context);
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // This function will show a bottom sheet confirmation before logging out
  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false, // Prevent closing by tapping outside
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 227,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xffB3A0FF),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Text(
                "Are you sure you want to\n log out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back(); // Close the bottom sheet when "Cancel" is tapped
                    },
                    child: Container(
                      width: 153.92,
                      height: 37,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Color(0xff896CFE),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(BottomPage());
                    },
                    child: Expanded(
                      child: Container(
                        width: 153.92,
                        height: 37,
                        decoration: BoxDecoration(
                          color: Color(0xffE2F163),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Yes, logout",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildListTile(IconData icon, String name, [VoidCallback? onTap]) {
  return ListTile(
    onTap: onTap,
    leading: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xff896CFE),
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, color: Colors.white, size: 30)),
    ),
    title: Text(name, style: TextStyle(fontSize: 20, color: Colors.white)),
    trailing: Icon(Icons.arrow_right, color: Color(0xffE2F163)),
  );
}
