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
    protein: '18g',
    carbs: '6g',
    fat: '17g',
    rating: 4.7,
    difficulty: 'Easy',
    servings: '2',
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
    tips: [
      'Whisk the eggs longer for a fluffier, airier omelette.',
      'Pat the spinach dry first so the pan stays hot and doesn\'t steam the eggs.',
    ],
    benefits: [
      'High in protein to keep you full through the morning.',
      'Spinach adds iron and vitamin A with almost no added calories.',
    ],
    favoriteKey: 'top|breakfast',
  ),
  recommended: [
    MealDetail(
      image: 'assets/green.png',
      name: 'Green Celery Juice',
      time: '7 Minutes',
      calories: '120 Cal',
      protein: '2g',
      carbs: '14g',
      fat: '0g',
      rating: 4.3,
      difficulty: 'Easy',
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
      protein: '8g',
      carbs: '32g',
      fat: '5g',
      rating: 4.6,
      difficulty: 'Easy',
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
      protein: '14g',
      carbs: '24g',
      fat: '5g',
      rating: 4.8,
      difficulty: 'Easy',
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
      protein: '9g',
      carbs: '16g',
      fat: '8g',
      rating: 4.6,
      difficulty: 'Easy',
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
    protein: '26g',
    carbs: '9g',
    fat: '19g',
    rating: 4.8,
    difficulty: 'Easy',
    servings: '1',
    ingredients: [
      'Fresh salmon (baked or grilled)',
      '1 avocado, sliced',
      'Mixed greens',
      'Olive oil, lemon, salt & pepper',
    ],
    preparation: [
      'Combine mixed greens, avocado slices, and cooked salmon. Dress with olive oil and lemon, season with salt & pepper.',
    ],
    tips: [
      'Chill the salmon before slicing for cleaner, firmer pieces.',
      'Dress the greens right before serving so they stay crisp.',
    ],
    benefits: [
      'Rich in omega-3 fatty acids for heart and brain health.',
      'Avocado adds heart-healthy monounsaturated fats and fiber.',
    ],
    favoriteKey: 'top|lunch',
  ),
  recommended: [
    MealDetail(
      image: 'assets/qui.png',
      name: 'Quinoa salad',
      time: '25 Minutes',
      calories: '300 Cal',
      protein: '10g',
      carbs: '42g',
      fat: '9g',
      rating: 4.5,
      difficulty: 'Easy',
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
      protein: '9g',
      carbs: '34g',
      fat: '8g',
      rating: 4.4,
      difficulty: 'Easy',
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
      protein: '34g',
      carbs: '38g',
      fat: '9g',
      rating: 4.7,
      difficulty: 'Medium',
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
      protein: '31g',
      carbs: '2g',
      fat: '24g',
      rating: 4.9,
      difficulty: 'Medium',
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
    protein: '28g',
    carbs: '8g',
    fat: '10g',
    rating: 4.6,
    difficulty: 'Easy',
    servings: '1',
    ingredients: [
      'Grilled chicken breast, sliced',
      'Spinach & lettuce',
      'Cherry tomatoes',
      'Light dressing',
    ],
    preparation: [
      'Slice the grilled chicken and mix with spinach, lettuce, and tomatoes. Add a light dressing and serve.',
    ],
    tips: [
      'Let the chicken rest a few minutes before slicing to keep it juicy.',
      'Toast the dressing\'s herbs briefly for a deeper flavor.',
    ],
    benefits: [
      'Lean protein that supports muscle recovery after training.',
      'Low in calories relative to protein — great for a cutting phase.',
    ],
    favoriteKey: 'top|dinner',
  ),
  recommended: [
    MealDetail(
      image: 'assets/ch.png',
      name: 'Chickpea salad',
      time: '20 Minutes',
      calories: '300 Cal',
      protein: '12g',
      carbs: '38g',
      fat: '10g',
      rating: 4.4,
      difficulty: 'Easy',
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
      protein: '13g',
      carbs: '30g',
      fat: '2g',
      rating: 4.5,
      difficulty: 'Easy',
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
      protein: '20g',
      carbs: '18g',
      fat: '9g',
      rating: 4.6,
      difficulty: 'Easy',
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
      protein: '30g',
      carbs: '4g',
      fat: '12g',
      rating: 4.7,
      difficulty: 'Medium',
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
