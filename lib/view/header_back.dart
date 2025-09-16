import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),

      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_left_outlined,
              color: Color(0xffE2F163),
              size: 30,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "Back",
            style: TextStyle(
              color: Color(0xffE2F163),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
