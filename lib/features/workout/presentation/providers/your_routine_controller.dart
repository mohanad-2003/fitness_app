import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'your_routine_controller.g.dart';

const _initial = [
  RoutineItem(
    image: 'assets/barbell.png',
    title: 'Barbell Rows',
    time: '10 Minutes',
    rep: '3 Rep',
    muscleGroup: MuscleGroup.back,
    isFavorite: true,
  ),
  RoutineItem(
    image: 'assets/hammer.png',
    title: 'Hammer Curls',
    time: '15 Minutes',
    rep: '4 Rep',
    muscleGroup: MuscleGroup.arms,
  ),
  RoutineItem(
    image: 'assets/legs_routine.png',
    title: 'leg press',
    time: '15 Minutes',
    rep: '4 Rep',
    muscleGroup: MuscleGroup.legs,
  ),
  RoutineItem(
    image: 'assets/tricep.png',
    title: 'Tricep Dips',
    time: '15 Minutes',
    rep: '4 Rep',
    muscleGroup: MuscleGroup.arms,
    isFavorite: true,
  ),
];

@riverpod
class YourRoutineController extends _$YourRoutineController {
  @override
  List<RoutineItem> build() => _initial;

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
