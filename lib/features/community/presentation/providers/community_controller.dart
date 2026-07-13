import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/community_models.dart';

part 'community_controller.g.dart';

enum CommunityTab { forum, challenges }

@riverpod
class CommunityTabController extends _$CommunityTabController {
  @override
  CommunityTab build() => CommunityTab.forum;

  void select(CommunityTab tab) => state = tab;
}

@riverpod
List<ChallengeItem> communityChallenges(Ref ref) => const [
  ChallengeItem(
    image: 'assets/cyc.png',
    name: 'Cycling Challenge',
    details:
        '15 minutes a day, 7 days straight. Log a ride of any intensity to keep your streak alive and climb the weekly leaderboard.',
  ),
  ChallengeItem(
    image: 'assets/power.png',
    name: 'Power Squat',
    details:
        '5 sets of squats at increasing depth each day this week. Built to build raw leg strength and improve mobility.',
  ),
  ChallengeItem(
    image: 'assets/leg_press.png',
    name: 'Press Leg Ultimate',
    details:
        'A 4-week progressive leg press program — start light, add weight every session, and track your one-rep max at the finish.',
  ),
  ChallengeItem(
    image: 'assets/cycling.png',
    name: 'Cycling',
    details:
        'Cover 50km this week at your own pace, indoors or out. Split it however works for your schedule.',
  ),
];

@riverpod
List<ForumThread> communityForums(Ref ref) => const [
  ForumThread(
    title: 'Strength Training Techniques',
    subtitle: ' Discussion on training methods',
    allLabel: 'See All',
    date: 'Today 17:05',
  ),
  ForumThread(
    title: 'Nutrition and Diet Strategies',
    subtitle: ' Discussion on training methods',
    allLabel: 'See All',
    date: 'Today 17:05',
  ),
  ForumThread(
    title: 'Cardiovascular Fitness',
    subtitle: ' Discussion on training methods',
    allLabel: 'See All',
    date: 'Today 17:05',
  ),
  ForumThread(
    title: 'Strength Training Techniques',
    subtitle: ' Discussion on training methods',
    allLabel: 'See All',
    date: 'Today 17:05',
  ),
];
