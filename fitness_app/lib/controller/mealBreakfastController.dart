import 'package:get/state_manager.dart';

class Mealbreakfastcontroller extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, dynamic>> mealBreakfast = [
    {
      "name": "Delights with\nGreek yogurt",
      "time": "6 Minutes",
      "calory": "200 Cal",
      "image": "assets/delights.png",
      "isFavorit": false,
    },
    {
      "name": "Spinach And\ntomato\nomelette",
      "time": "10 Minutes",
      "calory": "220 Cal",
      "image": "assets/spinach.png",
      "isFavorit": false,
    },
    {
      "name": "Avocado And\negg toast",
      "time": "15 Minutes",
      "calory": "150 Cal",
      "image": "assets/avocado.png",
      "isFavorit": false,
    },
    {
      "name": "Protein shake\nwith fruits",
      "time": "9 Minutes",
      "calory": "180 Cal",
      "image": "assets/protein.png",
      "isFavorit": false,
    },
  ];
}

