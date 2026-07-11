enum SearchResultType { workout, nutrition }

class SearchResultItem {
  const SearchResultItem({
    required this.image,
    required this.name,
    required this.time,
    required this.calories,
    required this.type,
    this.exercises,
  });

  final String image;
  final String name;
  final String time;
  final String calories;
  final SearchResultType type;
  final String? exercises;
}
