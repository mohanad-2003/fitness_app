import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_exercises_controller.g.dart';

@riverpod
List<PopularExerciseItem> popularExercises(Ref ref) => const [
  PopularExerciseItem(
    image: 'assets/squat.png',
    name: 'Squat Exercise',
    time: '12 Minutes',
    calories: '120 Kcal',
    difficulty: 'Easy',
  ),
  PopularExerciseItem(
    image: 'assets/fullbody.png',
    name: 'Full Body Stretching',
    time: '12 Minutes',
    calories: '120 Kcal',
    difficulty: 'Easy',
  ),
  PopularExerciseItem(
    image: 'assets/dum.png',
    name: 'Dumbbell Step Up',
    time: '12 Minutes',
    calories: '120 Kcal',
    difficulty: 'Medium',
  ),
  PopularExerciseItem(
    image: 'assets/full_body.png',
    name: 'Full Body Stretching',
    time: '12 Minutes',
    calories: '120 Kcal',
    difficulty: 'Easy',
  ),
];
