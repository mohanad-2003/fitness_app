import 'package:get/get.dart';

class NutritionController extends GetxController {
  var selectCategories = 0.obs;

  final List<String> category = ["Meal Plans", "Meal ideas"];

  void changeCategories(int index) {
    selectCategories.value = index;
  }

  final List<Map<String, String>> recommendes = [
    {
      "image": "assets/fruit.png",
      "name": "fruit smoothie",
      "time": "12 Minutes",
      "calory": "120 Cal",
    },

    {
      "image": "assets/salad.png",
      "name": "Salads with quinoa",
      "time": "12 Minutes",
      "calory": "120 Cal",
    },
  ];
  final List<Map<String, String>> recipes = [
    {
      "image": "assets/del.png",
      "name": "Delights with\n Greek yogurt",
      "time": "6 Minutes",
      "calory": "200 Cal",
    },
    {
      "image": "assets/salmon.png",
      "name": "Baked salmon",
      "time": "30 Minutes",
      "calory": "350 Cal",
    },
  ];
}
