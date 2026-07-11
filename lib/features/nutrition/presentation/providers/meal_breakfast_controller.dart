import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/nutrition_models.dart';

part 'meal_breakfast_controller.g.dart';

const _options = [
  BreakfastOption(
    name: 'Delights with Greek yogurt',
    time: '6 Minutes',
    calories: '200 Cal',
    image: 'assets/delights.png',
    isFavorite: true,
    ingredients: [
      '1 cup Greek yogurt',
      'Fresh berries (strawberries, blueberries, blackberries)',
      'Granola or nuts',
      '1 tsp honey',
    ],
    preparation: [
      'Place one cup of Greek yogurt in a bowl.',
      'Add fresh berries on top.',
      'Sprinkle granola or nuts.',
      'Drizzle with honey and serve.',
    ],
  ),
  BreakfastOption(
    name: 'Spinach And tomato omelette',
    time: '10 Minutes',
    calories: '220 Cal',
    image: 'assets/spinach.png',
    ingredients: [
      '2 eggs',
      'Chopped spinach',
      'Sliced tomatoes',
      'Salt and pepper',
      '1 tsp oil or butter',
    ],
    preparation: [
      'Beat two eggs with salt and pepper.',
      'Heat oil or butter in a pan.',
      'Add spinach and tomatoes, sauté briefly.',
      'Pour in eggs and cook until set.',
      'Fold omelette and serve warm.',
    ],
  ),
  BreakfastOption(
    name: 'Avocado And egg toast',
    time: '15 Minutes',
    calories: '150 Cal',
    image: 'assets/avocado.png',
    ingredients: [
      '1 slice wholemeal bread',
      '1 ripe avocado',
      '1 egg (poached or fried)',
      'Salt and pepper',
      'Fresh herbs (optional)',
    ],
    preparation: [
      'Toast the bread slice.',
      'Mash avocado with salt and pepper and spread on toast.',
      'Top with a poached or fried egg.',
      'Garnish with fresh herbs and serve.',
    ],
  ),
  BreakfastOption(
    name: 'Protein shake with fruits',
    time: '9 Minutes',
    calories: '180 Cal',
    image: 'assets/protein.png',
    ingredients: [
      '1 cup milk (or plant-based)',
      '1 banana',
      'Strawberries and mixed berries',
      '1 scoop protein powder',
    ],
    preparation: [
      'Add milk to a blender.',
      'Add banana, strawberries, and berries.',
      'Add one scoop of protein powder.',
      'Blend until smooth and creamy, then serve.',
    ],
  ),
];

@riverpod
class MealBreakfastController extends _$MealBreakfastController {
  @override
  List<BreakfastOption> build() => _options;

  void toggleFavorite(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isFavorite: !state[i].isFavorite)
        else
          state[i],
    ];
  }
}

@riverpod
class SelectedBreakfastIndex extends _$SelectedBreakfastIndex {
  @override
  int build() => -1;

  void select(int index) => state = index;
}
