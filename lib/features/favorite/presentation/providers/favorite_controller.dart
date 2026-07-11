import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/favorite_models.dart';

part 'favorite_controller.g.dart';

enum FavoriteFilter { all, video, article }

@riverpod
class FavoriteFilterController extends _$FavoriteFilterController {
  @override
  FavoriteFilter build() => FavoriteFilter.all;

  void select(FavoriteFilter filter) => state = filter;
}

const _allItems = [
  FavoriteItem(
    image: 'assets/upper.png',
    title: 'Upper Body',
    type: FavoriteType.video,
    duration: '60 Minutes',
    calories: '1320 Kcal',
    exercises: '5 Exercises',
  ),
  FavoriteItem(
    image: 'assets/loop.png',
    title: 'Loop Band Exercises',
    type: FavoriteType.video,
    duration: '45 Minutes',
    calories: '785 Kcal',
    exercises: '5 Exercises',
  ),
  FavoriteItem(
    image: 'assets/dumbbell.png',
    title: 'Dumbbell Step Up',
    type: FavoriteType.video,
    duration: '12 Minutes',
    calories: '1385 Kcal',
    exercises: '3 Exercises',
  ),
  FavoriteItem(
    image: 'assets/split.png',
    title: 'Split Strength Training',
    type: FavoriteType.video,
    duration: '12 Minutes',
    calories: '1250 Kcal',
    exercises: '5 Exercises',
  ),
  FavoriteItem(
    image: 'assets/boost.png',
    title: 'Boost Energy & Vitality',
    type: FavoriteType.article,
    text:
        'Incorporating physical exercise into your daily routine can boost...',
  ),
  FavoriteItem(
    image: 'assets/pull.png',
    title: 'Pull Out',
    type: FavoriteType.video,
    duration: '30 Minutes',
    calories: '1210 Kcal',
    exercises: '10 Exercises',
  ),
  FavoriteItem(
    image: 'assets/avocado.png',
    title: 'Avocado & Egg Toast',
    type: FavoriteType.article,
    duration: '15 Minutes',
    calories: '150 Cal',
  ),
  FavoriteItem(
    image: 'assets/lower.png',
    title: 'Lower Body Blast',
    type: FavoriteType.article,
    text:
        'A lower body blast is a high-intensity workout focused on targeting...',
  ),
  FavoriteItem(
    image: 'assets/fruit.png',
    title: 'Fruit Smoothie',
    type: FavoriteType.article,
    duration: '12 Minutes',
    calories: '120 Cal',
  ),
  FavoriteItem(
    image: 'assets/hydrate.png',
    title: 'Hydrate Properly',
    type: FavoriteType.article,
    text:
        'Stay hydrated before, during, and after your workouts to optimize...',
  ),
];

@riverpod
List<FavoriteItem> filteredFavorites(Ref ref) {
  final filter = ref.watch(favoriteFilterControllerProvider);
  return switch (filter) {
    FavoriteFilter.all => _allItems,
    FavoriteFilter.video =>
      _allItems.where((i) => i.type == FavoriteType.video).toList(),
    FavoriteFilter.article =>
      _allItems.where((i) => i.type == FavoriteType.article).toList(),
  };
}
