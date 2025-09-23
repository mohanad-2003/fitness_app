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
}
