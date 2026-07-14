import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_routine_controller.g.dart';

const _library = [
  RoutineExercise(
    id: 'barbell_rows',
    image: 'assets/barbell.png',
    name: 'Barbell Rows',
    muscleGroup: MuscleGroup.back,
    time: '10 Minutes',
    defaultSets: 3,
    defaultReps: 12,
    isFavorite: true,
  ),
  RoutineExercise(
    id: 'hammer_curls',
    image: 'assets/hammer.png',
    name: 'Hammer Curls',
    muscleGroup: MuscleGroup.arms,
    time: '15 Minutes',
    defaultSets: 4,
    defaultReps: 12,
  ),
  RoutineExercise(
    id: 'leg_press',
    image: 'assets/leg_press.png',
    name: 'Leg Press',
    muscleGroup: MuscleGroup.legs,
    time: '15 Minutes',
    defaultSets: 4,
    defaultReps: 10,
  ),
  RoutineExercise(
    id: 'plank',
    image: 'assets/plank.png',
    name: 'Plank',
    muscleGroup: MuscleGroup.strength,
    time: '10 Minutes',
    defaultSets: 3,
    defaultReps: 1,
    isFavorite: true,
  ),
  RoutineExercise(
    id: 'cable_chest_press',
    image: 'assets/cable.png',
    name: 'Cable Chest Press',
    muscleGroup: MuscleGroup.chest,
    time: '10 Minutes',
    defaultSets: 3,
    defaultReps: 12,
  ),
  RoutineExercise(
    id: 'tricep_dips',
    image: 'assets/tricep.png',
    name: 'Tricep Dips',
    muscleGroup: MuscleGroup.arms,
    time: '15 Minutes',
    defaultSets: 4,
    defaultReps: 12,
  ),
  RoutineExercise(
    id: 'push_ups',
    image: 'assets/push_up.png',
    name: 'Push-Ups',
    muscleGroup: MuscleGroup.chest,
    time: '10 Minutes',
    defaultSets: 3,
    defaultReps: 15,
    isFavorite: true,
  ),
  RoutineExercise(
    id: 'trx_straps',
    image: 'assets/trx.png',
    name: 'TRX Suspension Straps',
    muscleGroup: MuscleGroup.cardio,
    time: '10 Minutes',
    defaultSets: 3,
    defaultReps: 12,
  ),
];

@riverpod
class CreateRoutineController extends _$CreateRoutineController {
  @override
  CreateRoutineState build() => const CreateRoutineState(library: _library);

  void setName(String name) => state = state.copyWith(name: name);

  void setGoal(RoutineGoal goal) => state = state.copyWith(goal: goal);

  void setDifficulty(WorkoutLevel difficulty) =>
      state = state.copyWith(difficulty: difficulty);

  void toggleDay(Weekday day) {
    final days = {...state.selectedDays};
    if (!days.add(day)) days.remove(day);
    state = state.copyWith(selectedDays: days);
  }

  void toggleFavorite(String exerciseId) {
    state = state.copyWith(
      library: [
        for (final e in state.library)
          if (e.id == exerciseId) e.copyWith(isFavorite: !e.isFavorite) else e,
      ],
    );
  }

  bool isSelected(String exerciseId) =>
      state.selected.any((s) => s.exerciseId == exerciseId);

  void toggleExercise(String exerciseId) {
    if (isSelected(exerciseId)) {
      removeExercise(exerciseId);
      return;
    }
    final entry = state.library.firstWhere((e) => e.id == exerciseId);
    state = state.copyWith(
      selected: [
        ...state.selected,
        SelectedExercise(
          exerciseId: exerciseId,
          sets: entry.defaultSets,
          reps: entry.defaultReps,
        ),
      ],
    );
  }

  void removeExercise(String exerciseId) {
    state = state.copyWith(
      selected:
          state.selected.where((s) => s.exerciseId != exerciseId).toList(),
    );
  }

  void updateSets(String exerciseId, int delta) {
    state = state.copyWith(
      selected: [
        for (final s in state.selected)
          if (s.exerciseId == exerciseId)
            s.copyWith(sets: (s.sets + delta).clamp(1, 10))
          else
            s,
      ],
    );
  }

  void updateReps(String exerciseId, int delta) {
    state = state.copyWith(
      selected: [
        for (final s in state.selected)
          if (s.exerciseId == exerciseId)
            s.copyWith(reps: (s.reps + delta).clamp(1, 50))
          else
            s,
      ],
    );
  }

  /// [newIndex] is pre-adjusted by [SliverReorderableList.onReorderItem] for
  /// the removed item at [oldIndex] — insert directly, no offset needed.
  void reorder(int oldIndex, int newIndex) {
    final selected = [...state.selected];
    final item = selected.removeAt(oldIndex);
    selected.insert(newIndex, item);
    state = state.copyWith(selected: selected);
  }
}
