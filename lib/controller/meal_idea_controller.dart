// meal_idea_controller.dart
import 'package:get/get.dart';

class MealIdeaController extends GetxController {
  var currentCategory = 0.obs;
  final List<String> category = ["Breakfast", "Lunch", "Dinner"];

  // تفاصيل الكارت البنفسجي (جاهزة)
  final showTopDetails = false.obs;

  // ✅ تفاصيل الـ Recommended
  final showRecommendedDetails = false.obs;
  final selectedRecommendedIndex = 0.obs;

  void selectdCategory(int index) => currentCategory.value = index;

  final Map<String, dynamic> topRecipe = {
    "image": "assets/sp.png",
    "name": "Spinach And Tomato Omelette",
    "time": "12 Minutes",
    "calory": "120 Cal",
    "ingredients": [
      "2-3 eggs",
      "A handful of fresh spinach",
      "1 small tomato",
      "Salt and pepper to taste",
      "Olive oil or butter",
    ],
    "preparation":
        "Whisk the eggs with salt and pepper. Sauté spinach lightly in olive oil, add sliced tomato, then pour the eggs and cook until set. Fold and serve hot.",
  };

  final List<Map<String, dynamic>> recommended = [
    {
      "image": "assets/fruit.png",
      "name": "Fruit Smoothie",
      "time": "12 Minutes",
      "calory": "120 Cal",
      "ingredients": [
        "1/2 cup plain Greek yogurt",
        "1/2 cup almond milk or your favorite milk",
        "Honey or maple syrup (optional, to sweeten to taste)",
      ],
    },
    {
      "image": "assets/green.png",
      "name": "Green Celery Juice",
      "time": "12 Minutes",
      "calory": "120 Cal",
      "ingredients": [
        "4 celery stalks",
        "1 green apple (optional)",
        "1/2 lemon (optional)",
        "1/2 cup cold water",
      ],
    },
  ];

  final List<Map<String, dynamic>> recipes = [
    {
      "image": "assets/delights.png",
      "name": "Delights with Greek yogurt",
      "time": "6 Minutes",
      "calory": "200 Cal",
    },
    {
      "image": "assets/avocado.png",
      "name": "Avocado and Egg Toast",
      "time": "15 Minutes",
      "calory": "150 Cal",
    },
  ];
}

