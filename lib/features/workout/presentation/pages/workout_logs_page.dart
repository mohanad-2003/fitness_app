import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/presentation/providers/workout_progress_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/progress_tab_bar.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutLogsPage extends ConsumerWidget {
  const WorkoutLogsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activityLogProvider);
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final accent = theme.colorScheme.primary;

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: WorkoutHeader(title: l10n.progressTitle),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _ProfileSummary(),
            ),
            const SizedBox(height: 20),
            ProgressTabBar(
              selected: ProgressTab.logs,
              onChartsTap: () => context.push(AppRoutes.workoutCharts),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const _DateHeader(),
                  const SizedBox(height: 20),
                  Text(
                    l10n.progressActivities,
                    style: TextStyle(
                      fontSize: 20,
                      color: ext.textPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (activities.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.fitness_center_outlined,
                              color: ext.textMuted,
                              size: 36,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              l10n.progressEmptyState,
                              style: TextStyle(color: ext.textMuted),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: activities.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = activities[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: ext.glassFill,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: ext.glassBorder),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    gradient: ext.accentGradient,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      item.image,
                                      width: 25,
                                      height: 27,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/calories.png',
                                            color: accent,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            item.calories,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: ext.textPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ext.textPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.date,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: ext.textMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.progressDuration,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ext.textMuted,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/time.png',
                                            color: accent,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            item.duration,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: ext.textPrimary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}

class _ProfileSummary extends StatelessWidget {
  const _ProfileSummary();

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ext.glassFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ext.glassBorder),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Madison',
                      style: TextStyle(
                        fontSize: 22,
                        color: ext.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/fe.png'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Age :',
                      style: TextStyle(
                        fontSize: 14,
                        color: ext.textMuted,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '26',
                      style: TextStyle(fontSize: 14, color: ext.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    _InfoItem(value: '75 Kg', label: 'Weight'),
                    SizedBox(width: 30),
                    _InfoItem(value: '1.65 CM', label: 'Height'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 42,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: ext.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(label, style: TextStyle(fontSize: 14, color: ext.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  const _DateHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: ext.glassBorder, thickness: 1),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Text(
                l10n.progressChooseDate,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                l10n.progressMonth,
                style: TextStyle(fontSize: 14, color: ext.textMuted),
              ),
              const SizedBox(width: 5),
              Icon(Icons.arrow_drop_down_sharp, color: ext.textMuted),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Divider(color: ext.glassBorder, thickness: 1),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final day in const [
              'MON',
              'TUE',
              'WED',
              'THU',
              'FRI',
              'SAT',
              'SUN',
            ])
              _WeekDay(day),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: ext.glassFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ext.glassBorder),
          ),
          child: Wrap(
            spacing: 20,
            runSpacing: 8,
            children: List.generate(31, (index) {
              final day = (index + 1).toString();
              final isSelectedDay = index == 8;
              return Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelectedDay
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color:
                          isSelectedDay
                              ? theme.colorScheme.onPrimary
                              : ext.textMuted,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _WeekDay extends StatelessWidget {
  const _WeekDay(this.day);
  final String day;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Container(
      width: 40,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ext.glassFill,
        border: Border.all(color: ext.glassBorder),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: ext.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
