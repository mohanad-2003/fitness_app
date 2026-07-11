import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
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

    return PremiumScaffold(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const WorkoutHeader(title: 'Nutrition'),
          const SizedBox(height: 8),
          Text(
            'Fuel your training with meals that actually fit your day.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.62),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: PremiumPill(
                  label: 'Meal Plans',
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
                  label: 'Meal Ideas',
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
          const SizedBox(height: 22),
          PremiumImageCard(
            image: 'assets/carrot.png',
            height: 236,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const PremiumPill(
                  label: 'Recipe of the day',
                  icon: Icons.bolt_rounded,
                  selected: true,
                ),
                const SizedBox(height: 14),
                Text(
                  'Carrot and orange smoothie',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.02,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _Meta(icon: Icons.timer_outlined, label: '10 Minutes'),
                    const SizedBox(width: 14),
                    _Meta(
                      icon: Icons.local_fire_department_outlined,
                      label: '70 Cal',
                      color: AppColors.electricOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const PremiumSectionHeader(title: 'Recommended'),
          const SizedBox(height: 14),
          SizedBox(
            height: 196,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recommended.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder:
                  (context, index) => _MealCard(item: recommended[index]),
            ),
          ),
          const SizedBox(height: 26),
          const PremiumSectionHeader(title: 'Recipes for you'),
          const SizedBox(height: 14),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipes.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) => _RecipeTile(item: recipes[index]),
          ),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({required this.item});

  final MealItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 216,
      child: PremiumImageCard(
        image: item.image,
        height: 196,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1.06,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _Meta(icon: Icons.timer_outlined, label: item.time),
                const Spacer(),
                _Meta(
                  icon: Icons.local_fire_department_outlined,
                  label: item.calories,
                  color: AppColors.electricOrange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RecipeTile extends StatelessWidget {
  const _RecipeTile({required this.item});

  final MealItem item;

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _Meta(icon: Icons.timer_outlined, label: item.time),
                    const SizedBox(width: 12),
                    _Meta(
                      icon: Icons.local_fire_department_outlined,
                      label: item.calories,
                      color: AppColors.electricOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.seedLime),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.label, this.color});

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 17,
          color: color ?? Colors.white.withValues(alpha: 0.72),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.72),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
