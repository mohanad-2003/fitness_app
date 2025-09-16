// file: preferences_controller.dart
import 'package:get/get.dart';

class MealPlaneController extends GetxController {
  var selectedPreference = "No preferences".obs;
  var selectedAllergies = "No allergies".obs;
  var selectedMealsType = "Breakfast".obs;

  final List<String> preferences = [
    "Vegetarian",
    "Vegan",
    "Gluten-Free",
    "Keto",
    "Paleo",
    "No preferences",
  ];
  final List<String> allergies = [
    "Nuts",
    "Eggs",
    "Dairy",
    "No allergies",
    "Shellfish",
  ];
  final List<String> mealTypes = ["Breakfast", "Dinner", "Lunch", "Snacks"];
  void changeMealType(String mealType) {
    selectedMealsType.value = mealType;
  }

  void changeAllergies(String allergies) {
    selectedAllergies.value = allergies;
  }

  void selectPreference(String preference) {
    selectedPreference.value = preference;
  }
}
