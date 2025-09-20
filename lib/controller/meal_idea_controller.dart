
import 'package:get/get.dart';

class MealIdeaController extends GetxController {
  // التبويب الحالي
  var currentCategory = 0.obs;
  final List<String> category = ["Breakfast", "Lunch", "Dinner"];

  // حالات إظهار التفاصيل داخل الصفحة
  final showTopDetails = false.obs;            // تفاصيل الكارد البنفسجي
  final showRecommendedDetails = false.obs;    // تفاصيل عنصر من Recommended
  final selectedRecommendedIndex = 0.obs;      // اندكس العنصر المختار

  // ==== Breakfast ====
  final Map<String, dynamic> breakfastTop = {
    "image": "assets/sp.png",
    "name": "Spinach And Tomato Omelette",
    "time": "10 Minutes",
    "calory": "250 Cal",
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

  final List<Map<String, dynamic>> breakfastRecommended = [
    {
      "image": "assets/green.png",
      "name": "Green Celery Juice",
      "time": "7 Minutes",
      "calory": "120 Cal",
      "ingredients": [
        "4 celery stalks",
        "1 green apple (optional)",
        "1/2 lemon (optional)",
        "1/2 cup cold water",
      ],
    },
    {
      "image": "assets/fruit.png",
      "name": "Fruit Smoothie",
      "time": "10 Minutes",
      "calory": "250 Cal",
      "ingredients": [
        "1/2 cup plain Greek yogurt",
        "1/2 cup almond milk",
        "Mixed fruits (banana, berries)",
        "Honey (optional)",
      ],
    },
  ];

  final List<Map<String, dynamic>> breakfastRecipes = [
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

  // ==== Lunch ====
  final Map<String, dynamic> lunchTop = {
    "image": "assets/lunch.png",
    "name": "Salmon And Avocado Salad",
    "time": "15 Minutes",
    "calory": "300 Cal",
    "ingredients": [
      "Fresh salmon (baked or grilled)",
      "1 avocado, sliced",
      "Mixed greens",
      "Olive oil, lemon, salt & pepper",
    ],
    "preparation":
        "Combine mixed greens, avocado slices, and cooked salmon. Dress with olive oil and lemon, add salt & pepper.",
  };

  final List<Map<String, dynamic>> lunchRecommended = [
    {
      "image": "assets/qui.png",
      "name": "Quinoa salad",
      "time": "25 Minutes",
      "calory": "300 Cal",
      "ingredients": [
        "1 cup cooked quinoa",
        "Cherry tomatoes & cucumber",
        "Lemon juice & olive oil",
        "Salt & pepper",
      ],
    },
    {
      "image": "assets/burrito.png",
      "name": "Burrito with vegetables",
      "time": "20 Minutes",
      "calory": "250 Cal",
      "ingredients": [
        "Tortilla wrap",
        "Grilled vegetables",
        "Lettuce & tomato",
        "Light sauce",
      ],
    },
  ];

  final List<Map<String, dynamic>> lunchRecipes = [
    {
      "image": "assets/ter.png",
      "name": "Teriyaki chicken with brown rice",
      "time": "45 Minutes",
      "calory": "375 Cal",
    },
    {
      "image": "assets/baked.png",
      "name": "Baked salmon",
      "time": "30 Minutes",
      "calory": "350 Cal",
    },
  ];

  // ==== Dinner ====
  final Map<String, dynamic> dinnerTop = {
    "image": "assets/grilled.png", // تأكد من وجود الامتداد الفعلي للصورة
    "name": "Grilled Chicken Salad",
    "time": "20 Minutes",
    "calory": "240 Cal",
    "ingredients": [
      "Grilled chicken breast, sliced",
      "Spinach & lettuce",
      "Cherry tomatoes",
      "Light dressing",
    ],
    "preparation":
        "Slice the grilled chicken and mix with spinach, lettuce, and tomatoes. Add a light dressing and serve.",
  };

  final List<Map<String, dynamic>> dinnerRecommended = [
    {
      "image": "assets/chickp.png",
      "name": "Chickpea salad",
      "time": "20 Minutes",
      "calory": "300 Cal",
      "ingredients": [
        "1 cup cooked chickpeas",
        "Parsley & onion",
        "Olive oil & lemon",
        "Salt & cumin",
      ],
    },
    {
      "image": "assets/lentil.png",
      "name": "Lentil soup",
      "time": "30 Minutes",
      "calory": "200 Cal",
      "ingredients": [
        "1 cup red lentils",
        "Onion & carrot",
        "Cumin & salt",
        "Water or stock",
      ],
    },
  ];

  final List<Map<String, dynamic>> dinnerRecipes = [
    {
      "image": "assets/turkey.png",
      "name": "Turkey and Avocado Wrap",
      "time": "15 Minutes",
      "calory": "230 Cal",
    },
    {
      "image": "assets/chicken.png",
      "name": "Chicken Breast Stuffed with Spinach",
      "time": "30 Minutes",
      "calory": "250 Cal",
    },
  ];

  // اختيار تبويب
  void selectdCategory(int index) => currentCategory.value = index;

  // فتح/إغلاق التفاصيل
  void openTop() {
    showTopDetails.value = true;
    showRecommendedDetails.value = false;
  }

  void openRecommended(int i) {
    selectedRecommendedIndex.value = i;
    showRecommendedDetails.value = true;
    showTopDetails.value = false;
  }

  void closeDetails() {
    showTopDetails.value = false;
    showRecommendedDetails.value = false;
  }
}
