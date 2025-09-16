import 'package:get/state_manager.dart';

class Mealbreakfastcontroller extends GetxController {
  final selectedIndex = (-1).obs;

  void changeIndex(int index) => selectedIndex.value = index;

  final List<Map<String, dynamic>> mealBreakfast = [
    {
      "name": "Delights with Greek yogurt",
      "time": "6 Minutes",
      "calory": "200 Cal",
      "image": "assets/delights.png",
    "isFavorit": true.obs,
      "ingredients": [
        "1 cup Greek yogurt",
        "Fresh berries (strawberries, blueberries, blackberries)",
        "Granola or nuts",
        "1 tsp honey",
      ],
      "preparation": [
        "Place one cup of Greek yogurt in a bowl.",
        "Add fresh berries on top.",
        "Sprinkle granola or nuts.",
        "Drizzle with honey and serve.",
      ],
    },
    {
      "name": "Spinach And tomato omelette",
      "time": "10 Minutes",
      "calory": "220 Cal",
      "image": "assets/spinach.png",
    "isFavorit": false.obs,
      "ingredients": [
        "2 eggs",
        "Chopped spinach",
        "Sliced tomatoes",
        "Salt and pepper",
        "1 tsp oil or butter",
      ],
      "preparation": [
        "Beat two eggs with salt and pepper.",
        "Heat oil or butter in a pan.",
        "Add spinach and tomatoes, sauté briefly.",
        "Pour in eggs and cook until set.",
        "Fold omelette and serve warm.",
      ],
    },
    {
      "name": "Avocado And egg toast",
      "time": "15 Minutes",
      "calory": "150 Cal",
      "image": "assets/avocado.png",
    "isFavorit": false.obs,
      "ingredients": [
        "1 slice wholemeal bread",
        "1 ripe avocado",
        "1 egg (poached or fried)",
        "Salt and pepper",
        "Fresh herbs (optional)",
      ],
      "preparation": [
        "Toast the bread slice.",
        "Mash avocado with salt and pepper and spread on toast.",
        "Top with a poached or fried egg.",
        "Garnish with fresh herbs and serve.",
      ],
    },
    {
      "name": "Protein shake with fruits",
      "time": "9 Minutes",
      "calory": "180 Cal",
      "image": "assets/protein.png",
      "isFavorit": false.obs,
      "ingredients": [
        "1 cup milk (or plant-based)",
        "1 banana",
        "Strawberries and mixed berries",
        "1 scoop protein powder",
      ],
      "preparation": [
        "Add milk to a blender.",
        "Add banana, strawberries, and berries.",
        "Add one scoop of protein powder.",
        "Blend until smooth and creamy, then serve.",
      ],
    },
  ];
  void toggleFavorit(int index) {
    mealBreakfast[index]['isFavorit'].value =
        !mealBreakfast[index]['isFavorit'].value;
  }
}
