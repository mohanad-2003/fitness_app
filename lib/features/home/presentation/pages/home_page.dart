import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
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

    return Scaffold(
      backgroundColor: AppColors.seedInk,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.midnight, AppColors.seedInk, AppColors.graphite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 104),
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
                title: 'Workout Categories',
                action: 'Explore',
                onActionTap: () => context.go(AppRoutes.workout),
              ),
              const SizedBox(height: 14),
              _CategoryRail(
                categories: categories,
                onTap: (index) => _openCategory(context, index),
              ),
              const SizedBox(height: 26),
              _SectionHeader(
                title: 'Recommended',
                action: 'See All',
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
                              headerTitle: 'Recommendations',
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
              const _SectionHeader(title: 'Articles & Tips'),
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
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.seedLime, width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning, Madison',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Train hard. Recover smart. Repeat.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.62),
                ),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

class _TodayHeroCard extends StatelessWidget {
  const _TodayHeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        image: DecorationImage(
          image: const AssetImage('assets/fullbody.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.34),
            BlendMode.darken,
          ),
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.seedInk.withValues(alpha: 0.92),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const _StatusPill(label: 'TODAY PLAN', icon: Icons.bolt_rounded),
            const SizedBox(height: 14),
            Text(
              'Upper Body Strength',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                height: 1.02,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '42 min · 8 movements · intermediate intensity',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _MetricCard(
            label: 'Calories',
            value: '640',
            unit: 'kcal',
            icon: Icons.local_fire_department_rounded,
            color: AppColors.electricOrange,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: 'Steps',
            value: '8.2K',
            unit: 'today',
            icon: Icons.directions_walk_rounded,
            color: AppColors.seedLime,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: 'Duration',
            value: '52',
            unit: 'min',
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$label · $unit',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.58),
            ),
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
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
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
                      color: Colors.white.withValues(alpha: 0.12),
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
                    style: const TextStyle(
                      color: Colors.white,
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
              colors: [
                Colors.transparent,
                AppColors.seedInk.withValues(alpha: 0.92),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const _StatusPill(label: 'RECOMMENDED', icon: Icons.star_rounded),
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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Weekly Progress',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              const _StatusPill(label: '82%', icon: Icons.trending_up_rounded),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '5 workouts completed · 2 recovery sessions planned',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.58),
            ),
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
                                    gradient: LinearGradient(
                                      colors:
                                          i == 5
                                              ? const [
                                                AppColors.seedLime,
                                                AppColors.electricOrange,
                                              ]
                                              : [
                                                Colors.white.withValues(
                                                  alpha: 0.20,
                                                ),
                                                Colors.white.withValues(
                                                  alpha: 0.08,
                                                ),
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
                              color:
                                  i == 5
                                      ? AppColors.seedLime
                                      : Colors.white.withValues(alpha: 0.52),
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
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              AppColors.seedInk.withValues(alpha: 0.88),
            ],
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

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.seedLime.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.seedLime.withValues(alpha: 0.24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.seedLime),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.seedLime,
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
