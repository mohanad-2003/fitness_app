import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  ScrollController scrollController = ScrollController();
  final categories = [
    {"image": "assets/workout.png", "name": "Workout"},
    {"image": "assets/progress.png", "name": "Progress\nTracking"},
    {"image": "assets/nutrition.png", "name": "Nutrition"},
    {"image": "assets/community2.png", "name": "Community"},
  ];
  final recommendations = [
    {
      "image": "assets/squat.png",
      "nameVideo": "squat Exercise",
      "time_train": "12 Minutes",
      "Kcal": "120 Kcal",
    },
    {
      "image": "assets/fullbody.png",
      "nameVideo": "Full Body stretching",
      "time_train": "10 Minutes",
      "Kcal": "100 Kcal",
    },
  ];
  final articlesAndTips = [
    {"image": "assets/article1.png", "description": "Supplement Guide..."},
    {
      "image": "assets/article2.png",
      "description": "15 Quick & Effective\n Daily Routines...",
    },
  ];
}
