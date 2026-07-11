import 'package:fitness_app/features/home/domain/home_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

/// Mock data provider — a straight Provider (not a Notifier) since nothing
/// on the home dashboard is mutated, matching the legacy `Homecontroller`
/// which never called `.obs`. Swap the body for a repository call once a
/// backend exists; the page never needs to change.
@riverpod
List<HomeCategory> homeCategories(Ref ref) => const [
  HomeCategory(image: 'assets/workout.png', name: 'Workout'),
  HomeCategory(image: 'assets/progress.png', name: 'Progress\nTracking'),
  HomeCategory(image: 'assets/nutrition.png', name: 'Nutrition'),
  HomeCategory(image: 'assets/community2.png', name: 'Community'),
];

@riverpod
List<RecommendedWorkout> homeRecommendations(Ref ref) => const [
  RecommendedWorkout(
    image: 'assets/squat.png',
    title: 'squat Exercise',
    duration: '12 Minutes',
    calories: '120 Kcal',
  ),
  RecommendedWorkout(
    image: 'assets/fullbody.png',
    title: 'Full Body stretching',
    duration: '10 Minutes',
    calories: '100 Kcal',
  ),
];

@riverpod
List<ArticleTip> homeArticles(Ref ref) => const [
  ArticleTip(image: 'assets/article1.png', description: 'Supplement Guide...'),
  ArticleTip(
    image: 'assets/article2.png',
    description: '15 Quick & Effective\n Daily Routines...',
  ),
];
