class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.birthday,
    required this.weightKg,
    required this.ageYears,
    required this.heightM,
    this.avatar = 'assets/profile.png',
  });

  final String name;
  final String email;
  final String birthday;
  final String weightKg;
  final String ageYears;
  final String heightM;
  final String avatar;
}

class DocumentItem {
  const DocumentItem({required this.title, required this.description});
  final String title;
  final String description;
}
