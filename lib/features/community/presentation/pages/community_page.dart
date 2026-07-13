import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/featured_card.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/community_models.dart';
import '../providers/community_controller.dart';
import 'forum_detail_page.dart';

class CommunityPage extends ConsumerWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(communityTabControllerProvider);
    final challenges = ref.watch(communityChallengesProvider);
    final forums = ref.watch(communityForumsProvider);
    final l10n = AppLocalizations.of(context);
    final compact = MediaQuery.sizeOf(context).height < 720;

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PremiumHeader(
            title: l10n.navCommunityTitle,
            subtitle: l10n.communitySubtitle,
          ),
          SizedBox(height: compact ? 10 : 14),
          Row(
            children: [
              Expanded(
                child: PremiumPill(
                  label: l10n.communityTabForum,
                  icon: Icons.forum_rounded,
                  selected: tab == CommunityTab.forum,
                  onTap:
                      () => ref
                          .read(communityTabControllerProvider.notifier)
                          .select(CommunityTab.forum),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumPill(
                  label: l10n.communityTabChallenges,
                  icon: Icons.emoji_events_rounded,
                  selected: tab == CommunityTab.challenges,
                  onTap:
                      () => ref
                          .read(communityTabControllerProvider.notifier)
                          .select(CommunityTab.challenges),
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 12 : 16),
          Expanded(
            // Smooth cross-fade when switching between the two tabs.
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 240),
              child: KeyedSubtree(
                key: ValueKey(tab),
                child:
                    tab == CommunityTab.forum
                        ? _ForumTab(forums: forums, compact: compact)
                        : _ChallengesTab(challenges: challenges),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForumTab extends StatelessWidget {
  const _ForumTab({required this.forums, required this.compact});

  final List<ForumThread> forums;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // One CustomScrollView: the hero challenge card + section header live
    // in a SliverToBoxAdapter, and "Forums" is a SliverList right below it
    // — a single real scroll view, so overflow is structurally impossible.
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeaturedCard(
                image: 'assets/comm.png',
                badge: l10n.communityChallengeBadge,
                // Community's secondary accent per the design system.
                badgeColor: AppColors.aquaBlue,
                title: l10n.communityFeaturedChallengeName,
                metas: [
                  FeaturedCardMeta(
                    icon: 'assets/time.png',
                    label: l10n.communityFeaturedChallengeDuration,
                  ),
                  FeaturedCardMeta(
                    icon: 'assets/calories.png',
                    label: l10n.communityFeaturedChallengeCalories,
                  ),
                ],
                height: compact ? 170 : 220,
              ),
              const SizedBox(height: 20),
              PremiumSectionHeader(title: l10n.communityForums),
              const SizedBox(height: 12),
            ],
          ),
        ),
        SliverList.separated(
          itemCount: forums.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder:
              (context, index) => _ForumThreadCard(thread: forums[index]),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
      ],
    );
  }
}

class _ForumThreadCard extends StatelessWidget {
  const _ForumThreadCard({required this.thread});

  final ForumThread thread;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;

    return PremiumGlassCard(
      padding: const EdgeInsets.all(16),
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ForumDetailPage(thread: thread),
            ),
          ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: ext.accentGradient,
            ),
            child: Icon(Icons.forum_rounded, color: ext.onAccent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  thread.subtitle.trim(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: ext.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                thread.allLabel,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                thread.date,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: ext.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChallengesTab extends StatelessWidget {
  const _ChallengesTab({required this.challenges});

  final List<ChallengeItem> challenges;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PremiumSectionHeader(
                title: l10n.communityChallengesAndCompetitions,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        SliverList.separated(
          itemCount: challenges.length,
          separatorBuilder: (_, _) => const SizedBox(height: 14),
          itemBuilder:
              (context, index) => _ChallengeCard(challenge: challenges[index]),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
      ],
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({required this.challenge});

  final ChallengeItem challenge;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final imageWidth = MediaQuery.sizeOf(context).width < 380 ? 92.0 : 112.0;

    return PremiumGlassCard(
      padding: const EdgeInsets.all(12),
      onTap: () => context.push(AppRoutes.communityChallenge, extra: challenge),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              challenge.image,
              width: imageWidth,
              height: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  challenge.details,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: ext.textMuted),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: ext.textMuted),
        ],
      ),
    );
  }
}
