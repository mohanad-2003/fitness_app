import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/favorite_models.dart';
import '../providers/favorite_controller.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(favoriteFilterControllerProvider);
    final items = ref.watch(filteredFavoritesProvider);

    return PremiumScaffold(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 104),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap:
                      () =>
                          context.canPop()
                              ? context.pop()
                              : context.go(AppRoutes.home),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.seedLime,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                      color: AppColors.seedViolet,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => context.push(AppRoutes.search),
                  icon: const Icon(Icons.search, color: AppColors.seedViolet),
                ),
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
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Sort By:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.seedLime,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 34,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: FavoriteFilter.values.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final f = FavoriteFilter.values[index];
                        final isSelected = f == filter;
                        return GestureDetector(
                          onTap:
                              () => ref
                                  .read(
                                    favoriteFilterControllerProvider.notifier,
                                  )
                                  .select(f),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:
                                  isSelected
                                      ? AppColors.seedLime
                                      : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                _label(f),
                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Colors.black
                                          : AppColors.seedViolet,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final item = items[index];
                return item.type == FavoriteType.video
                    ? _VideoCard(item: item)
                    : _ArticleCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }

  String _label(FavoriteFilter filter) => switch (filter) {
    FavoriteFilter.all => 'All',
    FavoriteFilter.video => 'Video',
    FavoriteFilter.article => 'Article',
  };
}

class _VideoCard extends StatelessWidget {
  const _VideoCard({required this.item});
  final FavoriteItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset('assets/time.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.duration ?? '',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Image.asset('assets/calories.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.calories ?? '',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset('assets/run.png', width: 12, height: 12),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.exercises ?? '',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.star, color: AppColors.seedLime),
                ),
                const CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.seedViolet,
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.item});
  final FavoriteItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  if (item.text != null)
                    Text(
                      item.text!,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 6),
                  if (item.duration != null && item.calories != null)
                    Row(
                      children: [
                        Image.asset('assets/time.png', width: 12, height: 12),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.duration!,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.local_fire_department, size: 12),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.calories!,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
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
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
