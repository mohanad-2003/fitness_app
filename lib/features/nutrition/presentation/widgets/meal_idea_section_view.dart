import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/nutrition_models.dart';

/// Renders a meal-idea section (hero banner + Recommended row + Recipes
/// list). Replaces the legacy `CommonMealIdeaPage`
/// (lib/view/common_mealidea_page.dart), reusing [MealDetail] instead of
/// two separate ad-hoc item classes.
class MealIdeaSectionView extends StatelessWidget {
  const MealIdeaSectionView({
    super.key,
    required this.section,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onOpenDetail,
  });

  final MealIdeaSection section;
  final bool Function(String? key) isFavorite;
  final void Function(String? key) onToggleFavorite;
  final void Function(MealDetail meal, String tag) onOpenDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onOpenDetail(section.top, 'Recipe Of The Day'),
          child: Container(
            width: double.infinity,
            height: 242,
            color: const Color(0xffB3A0FF),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        section.top.image,
                        width: 323,
                        height: 198,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 125,
                        height: 25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          color: AppColors.seedLime,
                        ),
                        child: const Center(
                          child: Text(
                            'Recipe of the day',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff232323),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.black.withValues(alpha: 0.45),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    section.top.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.seedLime,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:
                                      () => onToggleFavorite(
                                        section.top.favoriteKey,
                                      ),
                                  child: Icon(
                                    isFavorite(section.top.favoriteKey)
                                        ? Icons.star
                                        : Icons.star_border,
                                    color:
                                        isFavorite(section.top.favoriteKey)
                                            ? Colors.red
                                            : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/time.png',
                                  color: Colors.white,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  section.top.time,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/calories.png',
                                  color: Colors.white,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  section.top.calories,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (section.recommended.isNotEmpty) ...[
                const Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: section.recommended.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final item = section.recommended[index];
                      return _RecommendedCard(
                        item: item,
                        isFavorite: isFavorite(item.favoriteKey),
                        onFavoriteTap: () => onToggleFavorite(item.favoriteKey),
                        onPlayTap: () => onOpenDetail(item, 'Recommended'),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
              if (section.recipes.isNotEmpty) ...[
                const Text(
                  'Recipes For you',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    itemCount: section.recipes.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 5),
                    itemBuilder: (context, index) {
                      final item = section.recipes[index];
                      return _RecipeRow(
                        item: item,
                        isFavorite: isFavorite(item.favoriteKey),
                        onFavoriteTap: () => onToggleFavorite(item.favoriteKey),
                        onTap: () => onOpenDetail(item, 'Recipe'),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({
    required this.item,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onPlayTap,
  });

  final MealDetail item;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onPlayTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  item.image,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: onFavoriteTap,
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: -15,
                right: 10,
                child: InkWell(
                  onTap: onPlayTap,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.seedViolet,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(
                      'assets/time.png',
                      color: AppColors.seedViolet,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.time,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(width: 14),
                    Image.asset(
                      'assets/calories.png',
                      color: AppColors.seedViolet,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.calories,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
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

class _RecipeRow extends StatelessWidget {
  const _RecipeRow({
    required this.item,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
  });

  final MealDetail item;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff232323),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/time.png',
                          color: const Color(0xff232323),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          item.time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff212020),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Image.asset(
                          'assets/calories.png',
                          color: const Color(0xff232323),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          item.calories,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff212020),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      item.image,
                      width: 148,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onFavoriteTap,
                      child: Icon(
                        isFavorite ? Icons.star : Icons.star_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
