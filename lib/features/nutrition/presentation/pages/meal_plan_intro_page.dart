import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_theme_extension.dart';
import '../../../../core/widgets/premium_scaffold.dart';
import '../../../../core/widgets/top_icon_actions.dart';

class MealPlanIntroPage extends StatelessWidget {
  const MealPlanIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/meal.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          DecoratedBox(
            decoration: BoxDecoration(gradient: ext.backgroundGradient),
            child: SizedBox(width: double.infinity, height: double.infinity),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.05,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.canPop() ? context.pop() : null,
                    child: Icon(
                      Icons.arrow_left_rounded,
                      size: width * 0.08,
                      color: Colors.white,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
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
                            Image.asset(
                              'assets/apple.png',
                              width: width * 0.07,
                            ),
                            SizedBox(width: width * 0.03),
                            Text(
                              l10n.mealPlanTitle,
                              style: TextStyle(
                                fontSize: width * 0.05,
                                color: ext.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.015),
                        Text(
                          textAlign: TextAlign.center,
                          l10n.mealPlanIntroBody,
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: ext.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  InkWell(
                    onTap: () => context.push(AppRoutes.mealPlanPreferences),
                    child: Container(
                      width: width * 0.55,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: ext.glassFill,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ext.glassBorder),
                      ),
                      child: Center(
                        child: Text(
                          l10n.mealPlanKnowYourPlan,
                          style: TextStyle(
                            fontSize: width * 0.05,
                            color: ext.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
