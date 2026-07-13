import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../providers/meal_breakfast_controller.dart';

class MealPlanBreakfastPage extends ConsumerWidget {
  const MealPlanBreakfastPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(mealBreakfastControllerProvider);
    final controller = ref.read(mealBreakfastControllerProvider.notifier);
    final selectedIndex = ref.watch(selectedBreakfastIndexProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutHeader(title: l10n.nutritionTabMealPlans),
          const SizedBox(height: 16),
          Text(
            l10n.mealPlanBreakfastTitle,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.mealPlanBreakfastBody,
            style: TextStyle(fontSize: 12, color: ext.textMuted),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = options[index];
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(selectedBreakfastIndexProvider.notifier)
                        .select(index);
                    context.push(AppRoutes.mealDetail, extra: item.toDetail());
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.secondary,
                            width: 3,
                          ),
                        ),
                        child:
                            isSelected
                                ? Center(
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: theme.colorScheme.primary,
                                  ),
                                )
                                : null,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ext.cardColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: ext.glassBorder),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: ext.textPrimary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/time.png',
                                              color: ext.textMuted,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              item.time,
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: ext.textMuted,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Image.asset(
                                              'assets/calories.png',
                                              color: ext.textMuted,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              item.calories,
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: ext.textMuted,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        item.image,
                                        fit: BoxFit.cover,
                                        width: 110,
                                        height: double.infinity,
                                      ),
                                      Positioned(
                                        right: 8,
                                        top: 8,
                                        child: GestureDetector(
                                          onTap:
                                              () => controller.toggleFavorite(
                                                index,
                                              ),
                                          child: Icon(
                                            Icons.star,
                                            color:
                                                item.isFavorite
                                                    ? theme.colorScheme.primary
                                                    : Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: GestureDetector(
              onTap: () => context.push(AppRoutes.mealIdeaDiscover),
              child: Container(
                width: 180,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.primary,
                ),
                alignment: Alignment.center,
                child: Text(
                  l10n.mealPlanSeeRecipe,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
