import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../workout/presentation/widgets/workout_header.dart';
import '../../domain/community_models.dart';

class ForumDetailPage extends StatelessWidget {
  const ForumDetailPage({super.key, required this.thread});

  final ForumThread thread;

  @override
  Widget build(BuildContext context) {
    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WorkoutHeader(title: thread.title),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder:
                  (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.seedLime),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/profile.png',
                                ),
                                radius: 25,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Madison',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.star_border,
                                color: AppColors.seedLime,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            maxLines: 2,
                            'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.seedLime,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _Stat(icon: Icons.star, value: '30,254'),
                              _Stat(icon: Icons.message, value: '12,254'),
                              _Stat(icon: Icons.visibility, value: '1,254'),
                            ],
                          ),
                        ],
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

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.value});
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.seedViolet),
        const SizedBox(width: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 13, color: AppColors.seedLime),
        ),
      ],
    );
  }
}
