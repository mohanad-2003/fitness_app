import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutRoundController extends GetxController {
  final List<Map<String, dynamic>> rounds = [
    {
      "name": "Dumbbell Rows",
      "time": "00:30",
      "speed": "repetition 3x",
      "color": const Color(0xffB3A0FF),
    },
    {
      "name": "Russian Twists",
      "time": "00:15",
      "speed": "repetition 2x",
      "color": const Color(0xffE2F163),
    },
    {
      "name": "Squats",
      "time": "00:30",
      "speed": "repetition 3x",
      "color": const Color(0xffE2F163),
    },
    {
      "name": "Tabata Intervals",
      "time": "00:10",
      "speed": "repetition 2x",
      "color": const Color(0xffB3A0FF),
    },
    {
      "name": "Bicycle Crunches",
      "time": "00:10",
      "speed": "repetition 4x",
      "color": const Color(0xffB3A0FF),
    },
  ];
}
