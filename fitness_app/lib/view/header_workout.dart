import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:fitness_app/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWorkout extends StatelessWidget {
  String name;
  HeaderWorkout({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_left_outlined,
            size: 30,
            color: Color(0xffE2F163),
          ),
        ),
        SizedBox(width: 5),
        Text(
          name,
          style: TextStyle(
            color: Color(0xff896CFE),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: Icon(Icons.search, color: Color(0xff896CFE), size: 20),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => Get.to(NotificationPage()),
          child: Icon(Icons.notifications, color: Color(0xff896CFE), size: 20),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => Get.to(ProfilePage()),
          child: Icon(Icons.person, color: Color(0xff896CFE), size: 20),
        ),
      ],
    );
  }
}
