import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../../core/widgets/top_icon_actions.dart';

class MealIdeaDiscoverPage extends StatelessWidget {
  const MealIdeaDiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/m_i.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: ext.backgroundGradient),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.canPop() ? context.pop() : null,
                    child: const Icon(
                      Icons.arrow_left_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const Spacer(),
                  const TopIconActions(color: Colors.white),
                ],
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PremiumGlassCard(
                      color: ext.cardColor.withValues(alpha: 0.92),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/apple.png', height: 28),
                              const SizedBox(width: 10),
                              Text(
                                l10n.mealIdeasDiscoverTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ext.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.mealIdeasDiscoverBody,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: ext.textMuted,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.mealIdea),
                      child: Container(
                        width: 250,
                        height: 48,
                        decoration: BoxDecoration(
                          color: ext.glassFill,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ext.glassBorder),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          l10n.actionDiscover,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
