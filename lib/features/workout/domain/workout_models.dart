/// Replaces the `Map<String, dynamic>`/`RxMap` items used throughout the
/// legacy workout controllers with typed, immutable value objects.
enum WorkoutLevel { beginner, intermediate, advanced }

class WorkoutListItem {
  const WorkoutListItem({
    required this.image,
    required this.name,
    this.time,
    this.calories,
    this.exercises,
    this.isFavorite = false,
  });

  final String image;
  final String name;
  final String? time;
  final String? calories;
  final String? exercises;
  final bool isFavorite;

  WorkoutListItem copyWith({bool? isFavorite}) => WorkoutListItem(
    image: image,
    name: name,
    time: time,
    calories: calories,
    exercises: exercises,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}

class RoutineExercise {
  const RoutineExercise({
    required this.image,
    required this.name,
    required this.time,
    required this.rep,
    this.isFavorite = false,
    this.isAdded = false,
  });

  final String image;
  final String name;
  final String time;
  final String rep;
  final bool isFavorite;
  final bool isAdded;

  RoutineExercise copyWith({bool? isFavorite, bool? isAdded}) =>
      RoutineExercise(
        image: image,
        name: name,
        time: time,
        rep: rep,
        isFavorite: isFavorite ?? this.isFavorite,
        isAdded: isAdded ?? this.isAdded,
      );
}

class RoutineItem {
  const RoutineItem({
    required this.image,
    required this.title,
    required this.time,
    required this.rep,
    this.isFavorite = false,
  });

  final String image;
  final String title;
  final String time;
  final String rep;
  final bool isFavorite;

  RoutineItem copyWith({bool? isFavorite}) => RoutineItem(
    image: image,
    title: title,
    time: time,
    rep: rep,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}

class ActivityLogItem {
  const ActivityLogItem({
    required this.image,
    required this.name,
    required this.calories,
    required this.date,
    required this.duration,
  });

  final String image;
  final String name;
  final String calories;
  final String date;
  final String duration;
}

class PopularExerciseItem {
  const PopularExerciseItem({
    required this.image,
    required this.name,
    required this.time,
    required this.calories,
  });

  final String image;
  final String name;
  final String time;
  final String calories;
}

class WeeklyRound {
  const WeeklyRound({
    required this.name,
    required this.time,
    required this.intensity,
  });

  final String name;
  final String time;
  final String intensity;
}
