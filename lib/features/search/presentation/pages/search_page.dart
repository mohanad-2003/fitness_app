import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/search/domain/search_models.dart';
import 'package:fitness_app/features/search/presentation/providers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(searchTabControllerProvider);
    final featured = ref.watch(searchFeaturedWorkoutsProvider);
    final allResults = ref.watch(searchAllResultsProvider);

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => context.canPop() ? context.pop() : null,
                child: Icon(
                  Icons.arrow_left_sharp,
                  size: 30,
                  color: AppColors.seedLime,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Search',
                style: TextStyle(fontSize: 20, color: AppColors.seedViolet),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => context.push(AppRoutes.notifications),
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.seedViolet,
                ),
              ),
              IconButton(
                onPressed: () => context.push(AppRoutes.profile),
                icon: const Icon(Icons.person, color: AppColors.seedViolet),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              for (final t in SearchTab.values) ...[
                GestureDetector(
                  onTap:
                      () => ref
                          .read(searchTabControllerProvider.notifier)
                          .select(t),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: tab == t ? AppColors.seedLime : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _label(t),
                      style: TextStyle(
                        color: tab == t ? Colors.black : AppColors.seedViolet,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: switch (tab) {
              SearchTab.all => _AllResultsSection(
                featured: featured,
                allResults: allResults,
              ),
              SearchTab.workoutSuggestions => _SuggestionsSection(
                title: 'Workout Suggestions',
                suggestions: const [
                  'Circuit',
                  'Split',
                  'Challenge',
                  'Legs',
                  'Cardio',
                ],
              ),
              SearchTab.nutritionSuggestions => _SuggestionsSection(
                title: 'Nutrition Suggestions',
                suggestions: const [
                  'Breakfast',
                  'Yogurt',
                  'Vegetarian',
                  'Smoothie',
                  'Chicken',
                ],
              ),
            },
          ),
        ],
      ),
    );
  }

  String _label(SearchTab tab) => switch (tab) {
    SearchTab.all => 'All',
    SearchTab.workoutSuggestions => 'Workout',
    SearchTab.nutritionSuggestions => 'Nutrition',
  };
}

class _AllResultsSection extends StatelessWidget {
  const _AllResultsSection({required this.featured, required this.allResults});
  final List<SearchResultItem> featured;
  final List<SearchResultItem> allResults;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: featured.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder:
                (context, index) => _FeaturedCard(item: featured[index]),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: allResults.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder:
                (context, index) => _ResultCard(item: allResults[index]),
          ),
        ),
      ],
    );
  }
}

class _SuggestionsSection extends StatelessWidget {
  const _SuggestionsSection({required this.title, required this.suggestions});
  final String title;
  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.seedLime,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        for (final s in suggestions)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.seedLime,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: AppColors.seedViolet,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      s,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff232323),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.item});
  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff3B3B3B),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.star, color: AppColors.seedLime),
                ),
                const Positioned(
                  bottom: -15,
                  right: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.seedViolet,
                    child: Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset('assets/time.png', width: 9, height: 9),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/calories.png', width: 9, height: 9),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        item.calories,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.item});
  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xff3B3B3B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset('assets/time.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          item.time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Image.asset('assets/calories.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          item.calories,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (item.exercises != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset('assets/run.png', width: 12, height: 12),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            item.exercises!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
