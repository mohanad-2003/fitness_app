import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_routine_controller.g.dart';

const _initial = [
  RoutineExercise(
    image: 'assets/barbell.png',
    name: 'Barbell Rows',
    time: '10 Minutes',
    rep: '3 Rep',
    isFavorite: true,
    isAdded: true,
  ),
  RoutineExercise(
    image: 'assets/hammer.png',
    name: 'Hammer Curls',
    time: '15 Minutes',
    rep: '4 Rep',
    isAdded: true,
  ),
  RoutineExercise(
    image: 'assets/leg_press.png',
    name: 'Leg Press',
    time: '15 Minutes',
    rep: '4 Rep',
    isAdded: true,
  ),
  RoutineExercise(
    image: 'assets/plank.png',
    name: 'Plank',
    time: '10 Minutes',
    rep: '3 Rep',
    isFavorite: true,
  ),
  RoutineExercise(
    image: 'assets/cable.png',
    name: 'Cable Chest Press',
    time: '10 Minutes',
    rep: '3 Rep',
  ),
  RoutineExercise(
    image: 'assets/tricep.png',
    name: 'Tricep Dips',
    time: '15 Minutes',
    rep: '4 Rep',
    isAdded: true,
  ),
  RoutineExercise(
    image: 'assets/push_up.png',
    name: 'Push-Ups',
    time: '10 Minutes',
    rep: '3 Rep',
    isFavorite: true,
  ),
  RoutineExercise(
    image: 'assets/trx.png',
    name: 'TRX Suspension Straps',
    time: '10 Minutes',
    rep: '3 Rep',
  ),
];

@riverpod
class CreateRoutineController extends _$CreateRoutineController {
  @override
  List<RoutineExercise> build() => _initial;

  void toggleFavorite(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isFavorite: !state[i].isFavorite)
        else
          state[i],
    ];
  }

  void toggleAdded(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(isAdded: !state[i].isAdded)
        else
          state[i],
    ];
  }
}
