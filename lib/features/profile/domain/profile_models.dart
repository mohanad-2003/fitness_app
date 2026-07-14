class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.birthday,
    required this.weightKg,
    required this.ageYears,
    required this.heightM,
    required this.fitnessLevel,
    required this.completedWorkouts,
    required this.caloriesBurned,
    required this.trainingDays,
    required this.currentStreak,
    this.avatar = 'assets/profile.png',
  });

  final String name;
  final String email;
  final String birthday;
  final String weightKg;
  final String ageYears;
  final String heightM;

  /// Display label for the user's current fitness level (e.g. "Intermediate").
  final String fitnessLevel;

  /// Lifetime achievement stats shown on the Profile Statistics grid.
  final int completedWorkouts;
  final int caloriesBurned;
  final int trainingDays;
  final int currentStreak;

  final String avatar;
}

class DocumentItem {
  const DocumentItem({required this.title, required this.description});
  final String title;
  final String description;
}
