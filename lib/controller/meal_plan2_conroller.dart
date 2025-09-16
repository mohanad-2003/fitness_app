import 'package:get/get.dart';

class MealPlan2Conroller extends GetxController {
  var selectedMeal = "Not sure/Don't have agoal".obs;
  var selectedCook = "Less than 15 minutes".obs;
  var selectNumbde = "1".obs;

  void changeNumber(String index) {
    selectNumbde.value = index;
  }

  void changeMeal(String index) {
    selectedMeal.value = index;
  }

  void changeCook(String index) {
    selectedCook.value = index;
  }

  final List<String> CaloricGoal = [
    "Less than 1500 calories",
    "1500-2000 calories",
    "More than 2000 calories",
    "Not sure/Don't have agoal",
  ];
  final List<String> cookingTime = [
    "Less than 15 minutes",
    "15-30 minutes",
    "More than 30 minutes",
  ];
  final List<String> numberOfServing = ["1", "3-4", "2", "More than 4"];
}
