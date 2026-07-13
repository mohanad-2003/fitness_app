import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_profile_controller.g.dart';

enum Gender { male, female }

enum ActivityLevel { beginner, intermediate, advanced }

/// Stable identifiers for fitness goals — the UI maps these to localized
/// labels, so a language switch mid-wizard keeps the selection intact.
enum FitnessGoal { loseWeight, gainWeight, muscleMassGain, shapeBody, others }

class OnboardingProfile {
  const OnboardingProfile({
    this.gender,
    this.age = 28,
    this.heightCm = 165,
    this.weightKg = 75,
    this.goal,
    this.activityLevel,
  });

  final Gender? gender;
  final int age;
  final int heightCm;
  final int weightKg;
  final FitnessGoal? goal;
  final ActivityLevel? activityLevel;

  OnboardingProfile copyWith({
    Gender? gender,
    int? age,
    int? heightCm,
    int? weightKg,
    FitnessGoal? goal,
    ActivityLevel? activityLevel,
  }) {
    return OnboardingProfile(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      goal: goal ?? this.goal,
      activityLevel: activityLevel ?? this.activityLevel,
    );
  }
}

/// Single source of truth for the whole profile-setup wizard, replacing
/// five separate near-identical GetX controllers (GenderController,
/// AgeControllert, HeightController, WeightController, GoalController)
/// that each only held one primitive value.
@riverpod
class OnboardingProfileController extends _$OnboardingProfileController {
  @override
  OnboardingProfile build() => const OnboardingProfile();

  void selectGender(Gender gender) => state = state.copyWith(gender: gender);
  void setAge(int age) => state = state.copyWith(age: age);
  void setHeight(int heightCm) => state = state.copyWith(heightCm: heightCm);
  void setWeight(int weightKg) => state = state.copyWith(weightKg: weightKg);
  void selectGoal(FitnessGoal goal) => state = state.copyWith(goal: goal);
  void selectActivityLevel(ActivityLevel level) =>
      state = state.copyWith(activityLevel: level);
}
