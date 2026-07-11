import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/nutrition_models.dart';

/// Reusable ingredients/preparation layout, replacing the legacy
/// `CommonDetailsHeader` (lib/view/common_details_header.dart) — used by
/// every meal detail screen (recipe of the day, recommended, recipes,
/// breakfast options).
class MealDetailHeader extends StatelessWidget {
  const MealDetailHeader({
    super.key,
    required this.meal,
    this.tagText = 'Recipe Of The Day',
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  final MealDetail meal;
  final String tagText;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      meal.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.seedLime,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onFavoriteTap,
                    child: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/time.png', color: AppColors.seedViolet),
                  const SizedBox(width: 5),
                  Text(
                    meal.time,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/calories.png',
                    color: AppColors.seedViolet,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    meal.calories,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 242,
          color: const Color(0xffB3A0FF),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                meal.image,
                width: 323,
                height: 198,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        if (meal.ingredients.isNotEmpty) ...[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                for (final ingredient in meal.ingredients) _bullet(ingredient),
              ],
            ),
          ),
        ],
        if (meal.preparation.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Preparation',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.seedLime,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                for (var i = 0; i < meal.preparation.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      meal.preparation.length > 1
                          ? '${i + 1}. ${meal.preparation[i]}'
                          : meal.preparation[i],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        height: 1.4,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _bullet(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 6),
          decoration: const BoxDecoration(
            color: AppColors.seedViolet,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
