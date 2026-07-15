import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/user_avatar.dart';
import 'package:fitness_app/features/home/domain/home_models.dart';
import 'package:fitness_app/features/home/presentation/providers/home_controller.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeCategoriesProvider);
    final recommendations = ref.watch(homeRecommendationsProvider);
    final articles = ref.watch(homeArticlesProvider);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ext.backgroundGradient),
        child: SafeArea(
          // The surrounding SafeArea already consumes the nav-bar height
          // that the shell's `extendBody: true` Scaffold reports through
          // MediaQuery padding — no manual clearance needed here.
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
            children: [
              _HomeHeader(
                onNotificationTap: () => context.push(AppRoutes.notifications),
              ),
              const SizedBox(height: 22),
              const _TodayHeroCard(),
              const SizedBox(height: 18),
              const _MetricGrid(),
              const SizedBox(height: 26),
              _SectionHeader(
                title: l10n.homeWorkoutCategories,
                action: l10n.actionExplore,
                onActionTap: () => context.go(AppRoutes.workout),
              ),
              const SizedBox(height: 14),
              _CategoryRail(
                categories: categories,
                onTap: (index) => _openCategory(context, index),
              ),
              const SizedBox(height: 26),
              _SectionHeader(
                title: l10n.homeRecommended,
                action: l10n.actionSeeAll,
                onActionTap: () => context.push(AppRoutes.workoutRecommended),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 216,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendations.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final workout = recommendations[index];
                    return _WorkoutCard(
                      workout: workout,
                      onTap:
                          () => context.push(
                            AppRoutes.exerciseDetail,
                            extra: ExerciseDetailData(
                              headerTitle: l10n.homeRecommended,
                              heroImage: workout.image,
                              title: workout.title,
                              duration: workout.duration,
                              reps: workout.calories,
                            ),
                          ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
              const _WeeklyProgressCard(),
              const SizedBox(height: 26),
              _SectionHeader(title: l10n.homeArticlesAndTips),
              const SizedBox(height: 14),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 14),
                  itemBuilder:
                      (context, index) =>
                          _ArticleCard(article: articles[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openCategory(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.workout);
      case 1:
        context.push(AppRoutes.workoutLogs);
      case 2:
        context.go(AppRoutes.nutrition);
      case 3:
        context.go(AppRoutes.community);
    }
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.onNotificationTap});

  final VoidCallback onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        UserAvatar(
          radius: 26,
          borderColor: Theme.of(context).colorScheme.primary,
          borderWidth: 2,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.homeGreeting('Madison'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ext.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.homeTagline,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: ext.textMuted),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        _HeaderIcon(
          icon: Icons.search_rounded,
          onTap: () => context.push(AppRoutes.search),
        ),
        const SizedBox(width: 10),
        _HeaderIcon(
          icon: Icons.notifications_none_rounded,
          onTap: onNotificationTap,
        ),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: ext.glassFill,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: ext.glassBorder),
        ),
        child: Icon(icon, color: ext.textPrimary, size: 22),
      ),
    );
  }
}

class _TodayHeroCard extends StatelessWidget {
  const _TodayHeroCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          colors: [AppColors.seedViolet, AppColors.seedInk],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.seedViolet.withValues(alpha: 0.30),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            right: -30,
            child: Icon(
              Icons.fitness_center_rounded,
              size: 160,
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _StatusPill(
                      label: l10n.homeTodayPlanLabel,
                      icon: Icons.bolt_rounded,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: ext.accentGradient,
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: ext.onAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                l10n.homeHeroTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  height: 1.02,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.homeHeroSubtitle(42, 8, l10n.workoutLevelIntermediate),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.72),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  _HeroChip(
                    icon: Icons.timer_outlined,
                    label: l10n.homeHeroDuration(42),
                  ),
                  const SizedBox(width: 10),
                  _HeroChip(
                    icon: Icons.local_fire_department_outlined,
                    label: l10n.homeHeroCalories(380),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  const _HeroChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: Colors.white.withValues(alpha: 0.85)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _MetricCard(
            label: l10n.homeMetricCalories,
            value: '640',
            unit: l10n.homeUnitKcal,
            icon: Icons.local_fire_department_rounded,
            color: AppColors.electricOrange,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: l10n.homeMetricSteps,
            value: '8.2K',
            unit: l10n.homeUnitToday,
            icon: Icons.directions_walk_rounded,
            color: AppColors.seedLime,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: l10n.homeMetricDuration,
            value: '52',
            unit: l10n.homeUnitMin,
            icon: Icons.timer_rounded,
            color: AppColors.aquaBlue,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ext.textPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$label · $unit',
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: ext.textMuted),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.action, this.onActionTap});

  final String title;
  final String? action;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ext.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        if (action != null)
          TextButton(onPressed: onActionTap, child: Text(action!)),
      ],
    );
  }
}

class _CategoryRail extends StatelessWidget {
  const _CategoryRail({required this.categories, required this.onTap});

  final List<HomeCategory> categories;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final accents = [
      AppColors.seedLime,
      AppColors.aquaBlue,
      AppColors.electricOrange,
      AppColors.seedViolet,
    ];
    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          final accent = accents[index % accents.length];
          return InkWell(
            onTap: () => onTap(index),
            borderRadius: BorderRadius.circular(26),
            child: Container(
              width: 104,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: accent.withValues(alpha: 0.22)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: ext.glassFill,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: Image.asset(category.image),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    category.name.replaceAll('\n', ' '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ext.textPrimary,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.workout, required this.onTap});

  final RecommendedWorkout workout;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 238,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(workout.image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.24),
              BlendMode.darken,
            ),
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [Colors.transparent, scaffoldBg.withValues(alpha: 0.92)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _StatusPill(
                label: l10n.homeRecommendedBadge,
                icon: Icons.star_rounded,
              ),
              const SizedBox(height: 12),
              Text(
                workout.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.02,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.white.withValues(alpha: 0.70),
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    workout.duration,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.70),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: AppColors.electricOrange,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    workout.calories,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.70),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeeklyProgressCard extends StatelessWidget {
  const _WeeklyProgressCard();

  static const _bars = [0.52, 0.78, 0.44, 0.88, 0.68, 0.96, 0.58];
  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                l10n.homeWeeklyProgress,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ext.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              _StatusPill(
                label: l10n.homeWeeklyProgressPercent(82),
                icon: Icons.trending_up_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l10n.homeWeeklyProgressSummary(5, 2),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: ext.textMuted),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 122,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < _bars.length; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: _bars[i],
                                widthFactor: 0.58,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(999),
                                    gradient:
                                        i == 5
                                            ? ext.accentGradient
                                            : LinearGradient(
                                              colors: [
                                                ext.glassBorder,
                                                ext.glassFill,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _days[i],
                            style: TextStyle(
                              color: i == 5 ? ext.accentGlow : ext.textMuted,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
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
  const _ArticleCard({required this.article});

  final ArticleTip article;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      width: 232,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        image: DecorationImage(
          image: AssetImage(article.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.28),
            BlendMode.darken,
          ),
        ),
        border: Border.all(color: ext.glassBorder),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            colors: [Colors.transparent, scaffoldBg.withValues(alpha: 0.88)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Text(
          article.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

/// Status/badge pill. [color] defaults to the fixed brand accent (correct
/// for the two dark-scrim contexts it's used in — hero card, photo cards);
/// pass the theme's `colorScheme.primary` explicitly when placing it on a
/// theme-aware surface like the glass progress card, so it stays readable
/// in light mode too.
class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.icon, this.color});

  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final pillColor = color ?? AppColors.seedLime;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: pillColor.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: pillColor.withValues(alpha: 0.24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: pillColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: pillColor,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
