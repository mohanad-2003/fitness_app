import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/top_icon_actions.dart';
import '../../domain/community_models.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key, required this.challenge});

  final ChallengeItem challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.seedInk,
      body: Stack(
        children: [
          Image.asset(
            challenge.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withValues(alpha: 0.3),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.canPop() ? context.pop() : null,
                    child: const Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  const Spacer(),
                  const TopIconActions(color: Colors.white),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xffB3A0FF),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/work.png', fit: BoxFit.cover),
                            const SizedBox(width: 10),
                            Text(
                              challenge.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.center,
                          challenge.details,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 13,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xff232323),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap:
                      () => context.push(
                        AppRoutes.weeklyChallenge,
                        extra: {
                          'image': challenge.image,
                          'name': challenge.name,
                        },
                      ),
                  child: Container(
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    child: const Center(
                      child: Text(
                        'Start Now',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
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
