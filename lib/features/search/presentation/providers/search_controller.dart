import 'package:fitness_app/features/search/domain/search_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

enum SearchTab { all, workoutSuggestions, nutritionSuggestions }

@riverpod
class SearchTabController extends _$SearchTabController {
  @override
  SearchTab build() => SearchTab.all;

  void select(SearchTab tab) => state = tab;
}

@riverpod
List<SearchResultItem> searchFeaturedWorkouts(Ref ref) => const [
  SearchResultItem(
    image: 'assets/squat.png',
    name: 'Squat Exercise',
    time: '12 Minutes',
    calories: '120 Kcal',
    type: SearchResultType.workout,
  ),
  SearchResultItem(
    image: 'assets/fullbody.png',
    name: 'Full Body Stretching',
    time: '12 Minutes',
    calories: '120 Kcal',
    type: SearchResultType.workout,
  ),
];

@riverpod
List<SearchResultItem> searchAllResults(Ref ref) => const [
  SearchResultItem(
    image: 'assets/circuit.png',
    name: 'Circuit Training',
    time: '50 Minutes',
    calories: '1300 Kcal',
    type: SearchResultType.workout,
    exercises: '5 exercises',
  ),
  SearchResultItem(
    image: 'assets/delights.png',
    name: 'Delights with\n Greek Yogurt',
    time: '6 Minutes',
    calories: '200 Cal',
    type: SearchResultType.nutrition,
  ),
  SearchResultItem(
    image: 'assets/split.png',
    name: 'Split Strength\n Training',
    time: '12 Minutes',
    calories: '1250 Kcal',
    type: SearchResultType.workout,
    exercises: '5 exercises',
  ),
  SearchResultItem(
    image: 'assets/turkey.png',
    name: 'Turkey and\n Avocado Wrap',
    time: '15 Minutes',
    calories: '230 Cal',
    type: SearchResultType.nutrition,
  ),
];
