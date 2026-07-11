class ChallengeItem {
  const ChallengeItem({
    required this.image,
    required this.name,
    required this.details,
  });
  final String image;
  final String name;
  final String details;
}

class ForumThread {
  const ForumThread({
    required this.title,
    required this.subtitle,
    required this.allLabel,
    required this.date,
  });
  final String title;
  final String subtitle;
  final String allLabel;
  final String date;
}
