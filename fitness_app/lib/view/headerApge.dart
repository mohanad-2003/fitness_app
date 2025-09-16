import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_left_rounded,
                size: 30,
                color: Color(0xffE2F163),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xffE2F163),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
