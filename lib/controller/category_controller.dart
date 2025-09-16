import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectCategory = 0.obs;

  final List<String> categories = ["Workout Log", "Charts"];
  final List<String> categories2 = ["Workout", "Charts"];

  void changeCategory(int index) {
    selectCategory.value = index;
  }

  final List<Map<String, dynamic>> Activities = <Map<String, dynamic>>[
    {
      "image": "assets/active_upper.png",
      "name": "Upper Body Workout",
      "calory": "120 Kcal",
      "date": "June 09",
      "duration": "25 Mins",
    },
    {
      "image": "assets/active_upper.png",
      "name": "Pull out",
      "calory": "130 Kcal",
      "date": "April 15 - 4:00 pM",
      "duration": "30 Mins",
    },
  ];
}
