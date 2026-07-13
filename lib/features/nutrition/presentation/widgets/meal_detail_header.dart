import 'package:flutter/material.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../domain/nutrition_models.dart';

/// Reusable ingredients/preparation layout, replacing the legacy
/// `CommonDetailsHeader` (lib/view/common_details_header.dart) — used by
/// every meal detail screen (recipe of the day, recommended, recipes,
/// breakfast options).
class MealDetailHeader extends StatelessWidget {
  const MealDetailHeader({
    super.key,
    required this.meal,
    required this.tagText,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  final MealDetail meal;
  final String tagText;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

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
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onFavoriteTap,
                    child: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? ext.danger : ext.textMuted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/time.png',
                    color: theme.colorScheme.secondary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    meal.time,
                    style: TextStyle(fontSize: 12, color: ext.textPrimary),
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/calories.png',
                    color: theme.colorScheme.secondary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    meal.calories,
                    style: TextStyle(fontSize: 12, color: ext.textPrimary),
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
          decoration: BoxDecoration(
            color: ext.glassFill,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ext.glassBorder),
          ),
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
                Text(
                  l10n.mealIngredients,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                for (final ingredient in meal.ingredients)
                  _bullet(ingredient, theme, ext),
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
                Text(
                  l10n.mealPreparation,
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.colorScheme.primary,
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
                      style: TextStyle(
                        fontSize: 13,
                        color: ext.textMuted,
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

  Widget _bullet(String text, ThemeData theme, AppThemeExtension ext) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 13, color: ext.textPrimary),
              ),
            ),
          ],
        ),
      );
}
