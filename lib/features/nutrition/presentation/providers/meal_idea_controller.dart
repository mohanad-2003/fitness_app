import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/nutrition_models.dart';

part 'meal_idea_controller.g.dart';

@riverpod
class MealIdeaCategoryController extends _$MealIdeaCategoryController {
  @override
  MealCategory build() => MealCategory.breakfast;

  void select(MealCategory category) => state = category;
}

const _breakfast = MealIdeaSection(
  top: MealDetail(
    image: 'assets/sp.png',
    name: 'Spinach And Tomato Omelette',
    time: '10 Minutes',
    calories: '250 Cal',
    ingredients: [
      '2-3 eggs',
      'A handful of fresh spinach',
      '1 small tomato',
      'Salt and pepper to taste',
      'Olive oil or butter',
    ],
    preparation: [
      'Whisk the eggs with salt and pepper. Sauté spinach lightly in olive oil, add sliced tomato, then pour the eggs and cook until set. Fold and serve hot.',
    ],
    favoriteKey: 'top|breakfast',
  ),
  recommended: [
    MealDetail(
      image: 'assets/green.png',
      name: 'Green Celery Juice',
      time: '7 Minutes',
      calories: '120 Cal',
      ingredients: [
        '4 celery stalks',
        '1 green apple (optional)',
        '1/2 lemon (optional)',
        '1/2 cup cold water',
      ],
      favoriteKey: 'rec|breakfast|0',
    ),
    MealDetail(
      image: 'assets/fruit.png',
      name: 'Fruit Smoothie',
      time: '10 Minutes',
      calories: '250 Cal',
      ingredients: [
        '1/2 cup plain Greek yogurt',
        '1/2 cup almond milk',
        'Mixed fruits (banana, berries)',
        'Honey (optional)',
      ],
      favoriteKey: 'rec|breakfast|1',
    ),
  ],
  recipes: [
    MealDetail(
      image: 'assets/delights.png',
      name: 'Delights with Greek yogurt',
      time: '6 Minutes',
      calories: '200 Cal',
      ingredients: [
        '1 cup Greek yogurt',
        'Fresh fruits (berries, banana slices)',
        '2 tbsp granola (optional)',
        '1 tsp honey',
      ],
      preparation: [
        'Spoon yogurt into a bowl. Top with fruits and granola, then drizzle honey. Serve immediately.',
      ],
      favoriteKey: 'recipe|breakfast|0',
    ),
    MealDetail(
      image: 'assets/avocado.png',
      name: 'Avocado and Egg Toast',
      time: '15 Minutes',
      calories: '150 Cal',
      ingredients: [
        '1 slice whole-grain bread',
        '1/2 ripe avocado, mashed',
        '1 boiled or poached egg',
        'Salt & pepper, chili flakes (optional)',
        'Squeeze of lemon (optional)',
      ],
      preparation: [
        'Toast the bread. Mash avocado with salt, pepper, and lemon. Spread on toast, top with sliced or poached egg, finish with chili flakes if desired.',
      ],
      favoriteKey: 'recipe|breakfast|1',
    ),
  ],
);

const _lunch = MealIdeaSection(
  top: MealDetail(
    image: 'assets/lunch.png',
    name: 'Salmon And Avocado Salad',
    time: '15 Minutes',
    calories: '300 Cal',
    ingredients: [
      'Fresh salmon (baked or grilled)',
      '1 avocado, sliced',
      'Mixed greens',
      'Olive oil, lemon, salt & pepper',
    ],
    preparation: [
      'Combine mixed greens, avocado slices, and cooked salmon. Dress with olive oil and lemon, season with salt & pepper.',
    ],
    favoriteKey: 'top|lunch',
  ),
  recommended: [
    MealDetail(
      image: 'assets/qui.png',
      name: 'Quinoa salad',
      time: '25 Minutes',
      calories: '300 Cal',
      ingredients: [
        '1 cup cooked quinoa',
        'Cherry tomatoes & cucumber',
        'Parsley',
        'Lemon juice & olive oil',
        'Salt & pepper',
      ],
      favoriteKey: 'rec|lunch|0',
    ),
    MealDetail(
      image: 'assets/burrito.png',
      name: 'Burrito with vegetables',
      time: '20 Minutes',
      calories: '250 Cal',
      ingredients: [
        'Tortilla wrap',
        'Grilled mixed vegetables',
        'Lettuce & tomato',
        'Light yogurt or salsa sauce',
        'Salt & pepper',
      ],
      favoriteKey: 'rec|lunch|1',
    ),
  ],
  recipes: [
    MealDetail(
      image: 'assets/ter.png',
      name: 'Teriyaki chicken with brown rice',
      time: '45 Minutes',
      calories: '375 Cal',
      ingredients: [
        '200 g chicken breast, sliced',
        '2 tbsp teriyaki sauce',
        '1 tsp soy sauce (optional)',
        '1 tsp sesame oil',
        '1 cup cooked brown rice',
        'Sliced spring onions & sesame seeds',
      ],
      preparation: [
        'Sauté chicken in sesame oil until cooked. Add teriyaki (and soy if using) and simmer 2–3 mins. Serve over brown rice and garnish with spring onions & sesame.',
      ],
      favoriteKey: 'recipe|lunch|0',
    ),
    MealDetail(
      image: 'assets/baked.png',
      name: 'Baked salmon',
      time: '30 Minutes',
      calories: '350 Cal',
      ingredients: [
        '1 salmon fillet (150–200 g)',
        '1 tbsp olive oil',
        'Lemon slices',
        'Salt, pepper, garlic powder',
        'Fresh dill (optional)',
      ],
      preparation: [
        'Preheat oven to 200°C. Place salmon on tray, drizzle olive oil, season, top with lemon. Bake 12–15 mins until flaky. Garnish with dill.',
      ],
      favoriteKey: 'recipe|lunch|1',
    ),
  ],
);

const _dinner = MealIdeaSection(
  top: MealDetail(
    image: 'assets/gc.png',
    name: 'Grilled Chicken Salad',
    time: '20 Minutes',
    calories: '240 Cal',
    ingredients: [
      'Grilled chicken breast, sliced',
      'Spinach & lettuce',
      'Cherry tomatoes',
      'Light dressing',
    ],
    preparation: [
      'Slice the grilled chicken and mix with spinach, lettuce, and tomatoes. Add a light dressing and serve.',
    ],
    favoriteKey: 'top|dinner',
  ),
  recommended: [
    MealDetail(
      image: 'assets/ch.png',
      name: 'Chickpea salad',
      time: '20 Minutes',
      calories: '300 Cal',
      ingredients: [
        '1 cup cooked chickpeas',
        'Chopped parsley & onion',
        'Olive oil & lemon',
        'Salt, cumin',
      ],
      favoriteKey: 'rec|dinner|0',
    ),
    MealDetail(
      image: 'assets/lentil.png',
      name: 'Lentil soup',
      time: '30 Minutes',
      calories: '200 Cal',
      ingredients: [
        '1 cup red lentils, rinsed',
        '1 onion & 1 carrot, diced',
        '1 tsp cumin, salt',
        '4 cups water or stock',
      ],
      favoriteKey: 'rec|dinner|1',
    ),
  ],
  recipes: [
    MealDetail(
      image: 'assets/turkey.png',
      name: 'Turkey and Avocado Wrap',
      time: '15 Minutes',
      calories: '230 Cal',
      ingredients: [
        'Whole-wheat tortilla',
        'Sliced turkey breast',
        '1/2 avocado, sliced',
        'Lettuce, tomato',
        'Mustard or light yogurt sauce',
      ],
      preparation: [
        'Warm the tortilla briefly. Layer turkey, avocado, lettuce, and tomato. Drizzle sauce, roll tightly, slice in half, and serve.',
      ],
      favoriteKey: 'recipe|dinner|0',
    ),
    MealDetail(
      image: 'assets/chicken.png',
      name: 'Chicken Breast Stuffed with Spinach',
      time: '30 Minutes',
      calories: '250 Cal',
      ingredients: [
        '1 chicken breast (butterflied)',
        '1 cup fresh spinach',
        '2 tbsp low-fat cream cheese or ricotta',
        '1 tsp olive oil',
        'Salt, pepper, garlic powder',
      ],
      preparation: [
        'Preheat oven to 200°C. Sauté spinach briefly. Spread cheese inside butterflied chicken, add spinach, fold and secure. Season, sear 1–2 mins per side, then bake 12–15 mins until cooked through.',
      ],
      favoriteKey: 'recipe|dinner|1',
    ),
  ],
);

@riverpod
MealIdeaSection mealIdeaSection(Ref ref, MealCategory category) =>
    switch (category) {
      MealCategory.breakfast => _breakfast,
      MealCategory.lunch => _lunch,
      MealCategory.dinner => _dinner,
    };

@riverpod
class MealIdeaFavorites extends _$MealIdeaFavorites {
  @override
  Set<String> build() => {'top|breakfast'};

  bool isFavorite(String? key) => key != null && state.contains(key);

  void toggle(String? key) {
    if (key == null) return;
    state = state.contains(key) ? ({...state}..remove(key)) : {...state, key};
  }
}
