import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_progress_controller.g.dart';

enum ProgressTab { logs, charts }

@riverpod
class WorkoutProgressTab extends _$WorkoutProgressTab {
  @override
  ProgressTab build() => ProgressTab.logs;

  void select(ProgressTab tab) => state = tab;
}

@riverpod
List<ActivityLogItem> activityLog(Ref ref) => const [
  ActivityLogItem(
    image: 'assets/active_upper.png',
    name: 'Upper Body Workout',
    calories: '120 Kcal',
    date: 'June 09',
    duration: '25 Mins',
  ),
  ActivityLogItem(
    image: 'assets/active_upper.png',
    name: 'Pull out',
    calories: '130 Kcal',
    date: 'April 15 - 4:00 pM',
    duration: '30 Mins',
  ),
];
