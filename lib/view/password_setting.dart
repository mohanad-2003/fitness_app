import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Color(0xffE2F163),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Password Setting",
                      style: TextStyle(color: Color(0xff896CFE), fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Password",
                        style: TextStyle(
                          color: Color(0xff896CFE),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "*************",
                          hintStyle: TextStyle(
                            color: Color(0xff391713),
                            fontSize: 20,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Color(0xff896CFE),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "New password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff896CFE),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "*************",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xff391713),
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Color(0xff896CFE),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Confirm New password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff896CFE),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "*************",
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xff391713),
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: Color(0xff896CFE),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
