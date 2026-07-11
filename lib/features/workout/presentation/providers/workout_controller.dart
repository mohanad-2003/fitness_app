import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_controller.g.dart';

@riverpod
class WorkoutTab extends _$WorkoutTab {
  @override
  WorkoutLevel build() => WorkoutLevel.beginner;

  void select(WorkoutLevel level) => state = level;
}

const _beginner = [
  WorkoutListItem(
    image: 'assets/upper.png',
    name: 'Upper Body',
    time: '60 Minutes',
    calories: '1320 Kcal',
    exercises: '5 exercises',
    isFavorite: true,
  ),
  WorkoutListItem(
    image: 'assets/fullbody.png',
    name: 'Full body\nstretching',
    time: '45 Minutes',
    calories: '1450 Kcal',
    exercises: '5 exercises',
  ),
  WorkoutListItem(
    image: 'assets/glutes.png',
    name: 'Glutes & Abs',
    time: '12 Minutes',
    calories: '120 Cal',
  ),
];

const _intermediate = [
  WorkoutListItem(
    image: 'assets/circuit.png',
    name: 'Circuit Training',
    time: '50 Minutes',
    calories: '1300 Kcal',
    exercises: '5 exercises',
  ),
  WorkoutListItem(
    image: 'assets/split.png',
    name: 'Split Strength\nTraining',
    time: '12 Minutes',
    calories: '1250 Kcal',
    exercises: '5 exercises',
    isFavorite: true,
  ),
  WorkoutListItem(
    image: 'assets/res.png',
    name: 'Resistance\nTraining',
    time: '12 Minutes',
    calories: '120 Cal',
    isFavorite: true,
  ),
];

const _advanced = [
  WorkoutListItem(
    image: 'assets/boxing.png',
    name: 'cardio boxing',
    time: '50 Minutes',
    calories: '1300 Kcal',
    exercises: '5 exercises',
  ),
  WorkoutListItem(
    image: 'assets/legs.png',
    name: 'Hypertrophy-\nLegs',
    time: '12 Minutes',
    calories: '1250 Kcal',
    exercises: '5 exercises',
    isFavorite: true,
  ),
  WorkoutListItem(image: 'assets/rest.png', name: 'Rest or Active\nRecovery'),
];

@riverpod
class WorkoutListByLevel extends _$WorkoutListByLevel {
  @override
  List<WorkoutListItem> build(WorkoutLevel level) {
    return switch (level) {
      WorkoutLevel.beginner => _beginner,
      WorkoutLevel.intermediate => _intermediate,
      WorkoutLevel.advanced => _advanced,
    };
  }

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
