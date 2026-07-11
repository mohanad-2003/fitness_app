import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/fill_bar.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/presentation/providers/workout_progress_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/progress_tab_bar.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryChartsPage extends StatelessWidget {
  const CategoryChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WorkoutHeader(title: 'Progress Tracking'),
              const SizedBox(height: 20),
              ProgressTabBar(
                selected: ProgressTab.charts,
                onLogsTap: () => context.pop(),
              ),
              const SizedBox(height: 20),
              Text(
                'My Progress',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.seedLime,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'January 12th',
                style: TextStyle(fontSize: 24, color: AppColors.seedLime),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 285,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Steps',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.seedLime,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '170',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '165',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '155',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                '150',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 147,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FillBar(fillFraction: 0.60),
                                  FillBar(fillFraction: 0.80),
                                  FillBar(fillFraction: 0.40),
                                  FillBar(fillFraction: 0.40),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Colors.white.withValues(alpha: 0.14)),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (final month in const [
                              'Jan',
                              'Feb',
                              'Mar',
                              'Apr',
                            ])
                              Text(
                                month,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _DailyDetail(
                day: 'Thu',
                numDay: '14',
                steps: '3,679',
                duration: '1hr40m',
              ),
              const SizedBox(height: 10),
              _DailyDetail(
                day: 'Wed',
                numDay: '20',
                steps: '5,789',
                duration: '1hr20m',
              ),
              const SizedBox(height: 10),
              _DailyDetail(
                day: 'Sat',
                numDay: '22',
                steps: '1,859',
                duration: '1hr10m',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyDetail extends StatelessWidget {
  const _DailyDetail({
    required this.day,
    required this.numDay,
    required this.steps,
    required this.duration,
  });

  final String day;
  final String numDay;
  final String steps;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.seedViolet, AppColors.electricOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  numDay,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(width: 1, height: 40, color: Colors.white),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Steps',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  steps,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Duration',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset('assets/time.png', color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
