// meal_idea_controller.dart
import 'package:get/get.dart';

class MealIdeaController extends GetxController {
  // التبويب الحالي
  var currentCategory = 0.obs;
  final List<String> category = ["Breakfast", "Lunch", "Dinner"];

  // حالات التفاصيل
  final showTopDetails = false.obs;          // تفاصيل Top
  final showRecommendedDetails = false.obs;  // تفاصيل Recommended
  final showRecipeDetails = false.obs;       // تفاصيل Recipes For You

  final selectedRecommendedIndex = 0.obs;    // اندكس الموصى بها
  final selectedRecipeIndex = 0.obs;         // اندكس الوصفات

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
      "ingredients": [
        "1 cup Greek yogurt",
        "Fresh fruits (berries, banana slices)",
        "2 tbsp granola (optional)",
        "1 tsp honey",
      ],
      "preparation":
          "Spoon yogurt into a bowl. Top with fruits and granola, then drizzle honey. Serve immediately.",
    },
    {
      "image": "assets/avocado.png",
      "name": "Avocado and Egg Toast",
      "time": "15 Minutes",
      "calory": "150 Cal",
      "ingredients": [
        "1 slice whole-grain bread",
        "1/2 ripe avocado, mashed",
        "1 boiled or poached egg",
        "Salt & pepper, chili flakes (optional)",
        "Squeeze of lemon (optional)",
      ],
      "preparation":
          "Toast the bread. Mash avocado with salt, pepper, and lemon. Spread on toast, top with sliced or poached egg, finish with chili flakes if desired.",
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
        "Combine mixed greens, avocado slices, and cooked salmon. Dress with olive oil and lemon, season with salt & pepper.",
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
        "Parsley",
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
        "Grilled mixed vegetables",
        "Lettuce & tomato",
        "Light yogurt or salsa sauce",
        "Salt & pepper",
      ],
    },
  ];

  final List<Map<String, dynamic>> lunchRecipes = [
    {
      "image": "assets/ter.png",
      "name": "Teriyaki chicken with brown rice",
      "time": "45 Minutes",
      "calory": "375 Cal",
      "ingredients": [
        "200 g chicken breast, sliced",
        "2 tbsp teriyaki sauce",
        "1 tsp soy sauce (optional)",
        "1 tsp sesame oil",
        "1 cup cooked brown rice",
        "Sliced spring onions & sesame seeds",
      ],
      "preparation":
          "Sauté chicken in sesame oil until cooked. Add teriyaki (and soy if using) and simmer 2–3 mins. Serve over brown rice and garnish with spring onions & sesame.",
    },
    {
      "image": "assets/baked.png",
      "name": "Baked salmon",
      "time": "30 Minutes",
      "calory": "350 Cal",
      "ingredients": [
        "1 salmon fillet (150–200 g)",
        "1 tbsp olive oil",
        "Lemon slices",
        "Salt, pepper, garlic powder",
        "Fresh dill (optional)",
      ],
      "preparation":
          "Preheat oven to 200°C. Place salmon on tray, drizzle olive oil, season, top with lemon. Bake 12–15 mins until flaky. Garnish with dill.",
    },
  ];

  // ==== Dinner ====
  final Map<String, dynamic> dinnerTop = {
    "image": "assets/gc.png",
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
      "image": "assets/ch.png",
      "name": "Chickpea salad",
      "time": "20 Minutes",
      "calory": "300 Cal",
      "ingredients": [
        "1 cup cooked chickpeas",
        "Chopped parsley & onion",
        "Olive oil & lemon",
        "Salt, cumin",
      ],
    },
    {
      "image": "assets/lentil.png",
      "name": "Lentil soup",
      "time": "30 Minutes",
      "calory": "200 Cal",
      "ingredients": [
        "1 cup red lentils, rinsed",
        "1 onion & 1 carrot, diced",
        "1 tsp cumin, salt",
        "4 cups water or stock",
      ],
    },
  ];

  final List<Map<String, dynamic>> dinnerRecipes = [
    {
      "image": "assets/turkey.png",
      "name": "Turkey and Avocado Wrap",
      "time": "15 Minutes",
      "calory": "230 Cal",
      "ingredients": [
        "Whole-wheat tortilla",
        "Sliced turkey breast",
        "1/2 avocado, sliced",
        "Lettuce, tomato",
        "Mustard or light yogurt sauce",
      ],
      "preparation":
          "Warm the tortilla briefly. Layer turkey, avocado, lettuce, and tomato. Drizzle sauce, roll tightly, slice in half, and serve.",
    },
    {
      "image": "assets/chicken.png",
      "name": "Chicken Breast Stuffed with Spinach",
      "time": "30 Minutes",
      "calory": "250 Cal",
      "ingredients": [
        "1 chicken breast (butterflied)",
        "1 cup fresh spinach",
        "2 tbsp low-fat cream cheese or ricotta",
        "1 tsp olive oil",
        "Salt, pepper, garlic powder",
      ],
      "preparation":
          "Preheat oven to 200°C. Sauté spinach briefly. Spread cheese inside butterflied chicken, add spinach, fold and secure. Season, sear 1–2 mins per side, then bake 12–15 mins until cooked through.",
    },
  ];

  // اختيار تبويب
  void selectdCategory(int index) {
    currentCategory.value = index;
    // إعادة ضبط التفاصيل عند التبديل
    showTopDetails.value = false;
    showRecommendedDetails.value = false;
    showRecipeDetails.value = false;
    selectedRecommendedIndex.value = 0;
    selectedRecipeIndex.value = 0;
  }

  // فتح/إغلاق التفاصيل
  void openTop() {
    showTopDetails.value = true;
    showRecommendedDetails.value = false;
    showRecipeDetails.value = false;
  }

  void openRecommended(int i) {
    selectedRecommendedIndex.value = i;
    showRecommendedDetails.value = true;
    showTopDetails.value = false;
    showRecipeDetails.value = false;
  }

  void openRecipe(int i) {
    selectedRecipeIndex.value = i;
    showRecipeDetails.value = true;
    showTopDetails.value = false;
    showRecommendedDetails.value = false;
  }

  void closeDetails() {
    showTopDetails.value = false;
    showRecommendedDetails.value = false;
    showRecipeDetails.value = false;
  }
}
