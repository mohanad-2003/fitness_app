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
        'Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.',
  ),
  ChallengeItem(
    image: 'assets/power.png',
    name: 'Power Squat',
    details:
        'Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.',
  ),
  ChallengeItem(
    image: 'assets/leg_press.png',
    name: 'Press Leg Ultimate',
    details:
        'Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.',
  ),
  ChallengeItem(
    image: 'assets/cycling.png',
    name: 'Cycling',
    details:
        'Lorem ipsum dolor sit amet consectetur. Magnis pellentesque felis ullamcorper imperdiet.',
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
