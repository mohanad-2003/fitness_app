import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../domain/community_models.dart';

class ForumDetailPage extends StatelessWidget {
  const ForumDetailPage({super.key, required this.thread});

  final ForumThread thread;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    final posts = [
      l10n.communityPost1,
      l10n.communityPost2,
      l10n.communityPost3,
      l10n.communityPost4,
      l10n.communityPost5,
    ];

    return PremiumScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PremiumHeader(
            title: thread.title,
            subtitle: thread.subtitle.trim(),
            showBack: true,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 8),
              itemCount: posts.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder:
                  (context, index) => _DiscussionCard(
                    ext: ext,
                    featured: index == 0,
                    body: posts[index],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscussionCard extends StatelessWidget {
  const _DiscussionCard({
    required this.ext,
    required this.featured,
    required this.body,
  });

  final AppThemeExtension ext;
  final bool featured;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return PremiumGlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 24,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Madison',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: ext.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      featured
                          ? l10n.communityTopContribution
                          : l10n.communityMember,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: ext.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                featured ? Icons.star_rounded : Icons.star_border_rounded,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            body,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(color: ext.textMuted),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 14,
            runSpacing: 8,
            children: [
              _Stat(icon: Icons.star_rounded, value: '30,254'),
              _Stat(icon: Icons.message_rounded, value: '12,254'),
              _Stat(icon: Icons.visibility_rounded, value: '1,254'),
            ],
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
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 18),
        const SizedBox(width: 5),
        Text(
          value,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ext.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
