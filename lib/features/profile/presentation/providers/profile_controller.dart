import 'package:fitness_app/features/profile/domain/profile_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
UserProfile currentUserProfile(Ref ref) => const UserProfile(
  name: 'Madison Smith',
  email: 'madisons@example.com',
  birthday: 'April 1st',
  weightKg: '75 Kg',
  ageYears: '28',
  heightM: '1.65 m',
  fitnessLevel: 'Intermediate',
  completedWorkouts: 128,
  caloriesBurned: 42600,
  trainingDays: 96,
  currentStreak: 7,
);

@riverpod
List<DocumentItem> userDocuments(Ref ref) => const [
  DocumentItem(
    title: 'Document 1',
    description: 'Description or details of document 1',
  ),
  DocumentItem(
    title: 'Document 2',
    description: 'Description or details of document 2',
  ),
  DocumentItem(
    title: 'Document 3',
    description: 'Description or details of document 3',
  ),
  DocumentItem(
    title: 'Document 4',
    description: 'Description or details of document 4',
  ),
  DocumentItem(
    title: 'Document 5',
    description: 'Description or details of document 5',
  ),
];
