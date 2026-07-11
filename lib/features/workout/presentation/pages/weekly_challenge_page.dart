import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/workout/domain/workout_models.dart';
import 'package:fitness_app/features/workout/presentation/providers/weekly_challenge_controller.dart';
import 'package:fitness_app/features/workout/presentation/widgets/workout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeeklyChallengePage extends ConsumerWidget {
  const WeeklyChallengePage({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roundOne = ref.watch(weeklyChallengeRoundOneProvider);
    final roundTwo = ref.watch(weeklyChallengeRoundTwoProvider);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: WorkoutHeader(title: 'Weekly Challenge'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/comm.png',
                      width: double.infinity,
                      height: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.seedLime,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset(
                                'assets/time.png',
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '25 Minute',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/calories.png',
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '750 Cal',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/run.png',
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              const Expanded(
                                child: Text(
                                  '5 Exercises',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _RoundSection(title: 'Round 1', rounds: roundOne),
                  const SizedBox(height: 20),
                  _RoundSection(title: 'Round 2', rounds: roundTwo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundSection extends StatelessWidget {
  const _RoundSection({required this.title, required this.rounds});

  final String title;
  final List<WeeklyRound> rounds;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.seedLime,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        for (final round in rounds) ...[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withValues(alpha: 0.08),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
            child: ListTile(
              title: Text(
                round.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                round.time,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
              leading: const CircleAvatar(
                backgroundColor: AppColors.seedLime,
                child: Icon(Icons.play_arrow_rounded, color: AppColors.seedInk),
              ),
              trailing: Text(
                round.intensity,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.seedLime,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
