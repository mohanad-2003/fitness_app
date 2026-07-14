import 'package:flutter/material.dart';

/// Passed via GoRouter `extra` to the generic [ExerciseDetailPage] —
/// replaces 5 near-identical legacy screens (squat_page, kettlball,
/// video_advance, details_page, details_dumple_setup) that only differed
/// by these values.
class ExerciseDetailData {
  const ExerciseDetailData({
    required this.headerTitle,
    required this.heroImage,
    required this.title,
    this.description =
        'Keep your core braced and move through the full range of motion with control. Focus on steady breathing and stop if you feel sharp pain.',
    this.duration = '30 seconds',
    this.reps = '3 Rep',
    this.level = 'Beginner',
    this.muscleGroup = 'Full Body',
    this.equipment = 'Bodyweight',
  });

  final String headerTitle;
  final String heroImage;
  final String title;
  final String description;
  final String duration;
  final String reps;
  final String level;
  final String muscleGroup;
  final String equipment;
}

/// A single tappable round entry inside a [CategoryDetailData] round group.
class RoundExerciseItem {
  const RoundExerciseItem({
    required this.name,
    required this.time,
    required this.reps,
    required this.accent,
    this.exerciseDetail,
  });

  final String name;
  final String time;
  final String reps;
  final Color accent;

  /// When set, tapping this round item pushes [ExerciseDetailPage] with
  /// this data; otherwise the item is inert (matches legacy behavior where
  /// most round items had no `onTap`).
  final ExerciseDetailData? exerciseDetail;
}

class RoundGroup {
  const RoundGroup({required this.title, required this.items});

  final String title;
  final List<RoundExerciseItem> items;
}

/// Passed via GoRouter `extra` to the generic [CategoryDetailPage] —
/// replaces 3 near-identical legacy screens (advance_category,
/// intermediate_category, functional_page).
class CategoryDetailData {
  const CategoryDetailData({
    required this.headerTitle,
    required this.heroImage,
    required this.heroLabel,
    required this.time,
    required this.calories,
    required this.levelLabel,
    required this.rounds,
  });

  final String headerTitle;
  final String heroImage;
  final String heroLabel;
  final String time;
  final String calories;
  final String levelLabel;
  final List<RoundGroup> rounds;
}
