import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/featured_card.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../providers/nutrition_controller.dart';
import '../widgets/nutrition_summary_card.dart';
import '../widgets/premium_recipe_card.dart';

class NutritionPage extends ConsumerWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(nutritionTabControllerProvider);
    final recommended = ref.watch(nutritionRecommendedProvider);
    final recipes = ref.watch(nutritionRecipesProvider);
    final summary = ref.watch(dailyNutritionSummaryProvider);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final compact = MediaQuery.sizeOf(context).height < 720;
    final spacing = compact ? 10.0 : 14.0;
    final heroHeight = compact ? 150.0 : 200.0;

    return PremiumScaffold(
      // The whole page is one CustomScrollView: header/summary/chips/hero/
      // Recommended row live in a single SliverToBoxAdapter, and "Recipes
      // for you" is a SliverList right below it — one real scroll view, so
      // vertical overflow is structurally impossible regardless of device.
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WorkoutHeader(title: l10n.navNutrition),
                const SizedBox(height: 6),
                Text(
                  l10n.nutritionSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: ext.textMuted),
                ),
                SizedBox(height: spacing),
                NutritionSummaryCard(summary: summary),
                SizedBox(height: spacing),
                Row(
                  children: [
                    Expanded(
                      child: PremiumPill(
                        label: l10n.nutritionTabMealPlans,
                        icon: Icons.calendar_month_rounded,
                        selected: tab == NutritionTab.mealPlans,
                        onTap: () {
                          ref
                              .read(nutritionTabControllerProvider.notifier)
                              .select(NutritionTab.mealPlans);
                          context.push(AppRoutes.mealPlanIntro);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: PremiumPill(
                        label: l10n.nutritionTabMealIdeas,
                        icon: Icons.restaurant_menu_rounded,
                        selected: tab == NutritionTab.mealIdeas,
                        onTap: () {
                          ref
                              .read(nutritionTabControllerProvider.notifier)
                              .select(NutritionTab.mealIdeas);
                          context.push(AppRoutes.mealIdea);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: spacing),
                FeaturedCard(
                  image: 'assets/carrot.png',
                  badge: l10n.nutritionRecipeOfTheDay,
                  // Nutrition's secondary accent per the design system.
                  badgeColor: AppColors.seedViolet,
                  title: l10n.nutritionFeaturedRecipeName,
                  metas: [
                    FeaturedCardMeta(
                      icon: 'assets/time.png',
                      label: l10n.nutritionFeaturedRecipeDuration,
                    ),
                    FeaturedCardMeta(
                      icon: 'assets/calories.png',
                      label: l10n.nutritionFeaturedRecipeCalories,
                    ),
                  ],
                  height: heroHeight,
                ),
                SizedBox(height: compact ? 14 : 22),
                PremiumSectionHeader(title: l10n.nutritionRecommended),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 284,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = recommended[index];
                return PremiumRecipeCard(
                  image: item.image,
                  name: item.name,
                  time: item.time,
                  calories: item.calories,
                  subtitle: item.subtitle,
                  protein: item.protein,
                  carbs: item.carbs,
                  fat: item.fat,
                  rating: item.rating,
                  difficulty: item.difficulty,
                  imageHeight: 104,
                );
              },
              childCount: recommended.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: compact ? 14 : 22),
                PremiumSectionHeader(title: l10n.nutritionRecipesForYou),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SliverList.separated(
            itemCount: recipes.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = recipes[index];
              return PremiumRecipeListTile(
                image: item.image,
                name: item.name,
                time: item.time,
                calories: item.calories,
                rating: item.rating,
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),
    );
  }
}
