import 'package:get/state_manager.dart';

class ComunityController extends GetxController {
  var currentCategory = 0.obs;
  final List<String> categories = ["Discussion Forum", "Challenges"];

  void selectCategory(int index) {
    currentCategory.value = index;
  }

  final List<Map<String, String>> challenges = [
    {
      "image": "assets/cyc.png",
      "name": "Cycling Challenge",
      "details":
          "Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.",
    },
    {
      "image": "assets/power.png",
      "name": "Power Squat",
      "details":
          "Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.",
    },
    {
      "image": "assets/leg_press.png",
      "name": "Press Leg Ultimate",
      "details":
          "Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.",
    },
    {
      "image": "assets/cycling.png",
      "name": "Cycling",
      "details":
          "Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.",
    },
  ];
  final List<Map<String, String>> forums = [
    {
      "title": "Strength Training Techniques",
      "subtitle": " Discussion on training methods",
      "all": "See All",
      "date": "Today 17:05",
    },
    {
      "title": "Nutrition and Diet Strategies",
      "subtitle": " Discussion on training methods",
      "all": "See All",
      "date": "Today 17:05",
    },
    {
      "title": "Cardiovascular Fitness",
      "subtitle": " Discussion on training methods",
      "all": "See All",
      "date": "Today 17:05",
    },
    {
      "title": "Strength Training Techniques",
      "subtitle": " Discussion on training methods",
      "all": "See All",
      "date": "Today 17:05",
    },
  ];
 
}
