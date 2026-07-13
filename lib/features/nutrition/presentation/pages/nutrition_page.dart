import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/featured_card.dart';
import '../../../../core/widgets/icon_stat.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../../domain/nutrition_models.dart';
import '../providers/nutrition_controller.dart';

class NutritionPage extends ConsumerWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(nutritionTabControllerProvider);
    final recommended = ref.watch(nutritionRecommendedProvider);
    final recipes = ref.watch(nutritionRecipesProvider);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final compact = MediaQuery.sizeOf(context).height < 720;
    final spacing = compact ? 10.0 : 14.0;
    final heroHeight = compact ? 150.0 : 200.0;

    return PremiumScaffold(
      // The whole page is one CustomScrollView: header/chips/hero/
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 206,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _MealGridCard(item: recommended[index]),
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
            itemBuilder:
                (context, index) => _RecipeTile(item: recipes[index]),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),
    );
  }
}

/// Recommended-grid card: photo on top, then name + short description +
/// time/calories underneath, so the card is self-explanatory at a glance
/// (no bare photos without context).
class _MealGridCard extends StatelessWidget {
  const _MealGridCard({required this.item});

  final MealItem item;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 96,
            width: double.infinity,
            child: Image.asset(item.image, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ext.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: ext.textMuted, fontSize: 11),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconStat(
                        icon: 'assets/time.png',
                        label: item.time,
                        color: ext.textMuted,
                        fontSize: 11,
                      ),
                      const SizedBox(width: 8),
                      IconStat(
                        icon: 'assets/calories.png',
                        label: item.calories,
                        color: ext.textMuted,
                        fontSize: 11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeTile extends StatelessWidget {
  const _RecipeTile({required this.item});

  final MealItem item;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return PremiumGlassCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              item.image,
              width: 104,
              height: 104,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _Meta(
                      icon: Icons.timer_outlined,
                      label: item.time,
                      textColor: ext.textMuted,
                    ),
                    const SizedBox(width: 12),
                    _Meta(
                      icon: Icons.local_fire_department_outlined,
                      label: item.calories,
                      color: Theme.of(context).colorScheme.secondary,
                      textColor: ext.textMuted,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({
    required this.icon,
    required this.label,
    this.color,
    this.textColor,
  });

  final IconData icon;
  final String label;

  /// Icon color. Defaults to white @ 72% — correct on the photo-overlay
  /// cards this is normally used in, regardless of theme.
  final Color? color;

  /// Label text color, independent of [color]. Defaults to match [color]
  /// so photo-overlay usages (white/accent) are unaffected; pass an
  /// explicit muted theme color when placing this on a glass card instead.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Colors.white.withValues(alpha: 0.72);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17, color: iconColor),
        const SizedBox(width: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: textColor ?? iconColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
