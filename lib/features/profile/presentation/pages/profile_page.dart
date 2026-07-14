import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_stat_card.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_stat_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      // One CustomScrollView: the header/avatar/stats card lives in a
      // SliverToBoxAdapter, and each menu section is its own SliverList —
      // a single real scroll view, so vertical overflow is structurally
      // impossible regardless of device or content length.
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeader(
              title: l10n.profileMyProfile,
              avatar: profile.avatar,
              name: profile.name,
              email: profile.email,
              fitnessLevel: profile.fitnessLevel,
              motivation: l10n.profileMotivation,
              onBack: context.canPop() ? () => context.pop() : null,
              onEdit: () => context.push(AppRoutes.editProfile),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeSlideIn(
              delay: const Duration(milliseconds: 90),
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const spacing = 10.0;
                    final columns = constraints.maxWidth >= 420 ? 4 : 2;
                    final itemWidth =
                        (constraints.maxWidth - spacing * (columns - 1)) /
                        columns;
                    final stats = [
                      (
                        Icons.fitness_center_rounded,
                        '${profile.completedWorkouts}',
                        l10n.profileStatWorkouts,
                      ),
                      (
                        Icons.local_fire_department_rounded,
                        '${profile.caloriesBurned}',
                        l10n.profileStatCalories,
                      ),
                      (
                        Icons.calendar_month_rounded,
                        '${profile.trainingDays}',
                        l10n.profileStatDays,
                      ),
                      (
                        Icons.bolt_rounded,
                        '${profile.currentStreak}',
                        l10n.profileStatStreak,
                      ),
                    ];
                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: [
                        for (final stat in stats)
                          SizedBox(
                            width: itemWidth,
                            child: ProfileStatCard(
                              icon: stat.$1,
                              value: stat.$2,
                              label: stat.$3,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeSlideIn(
              delay: const Duration(milliseconds: 140),
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: PremiumGlassCard(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: ProfileStatRow(profile: profile),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                PremiumSectionHeader(title: l10n.profileSectionAccount),
                const SizedBox(height: 12),
              ],
            ),
          ),
          SliverList.separated(
            itemCount: 3,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ProfileMenuTile(
                    icon: Icons.person_outline_rounded,
                    title: l10n.profileMenuProfile,
                    subtitle: l10n.profileMenuProfileSubtitle,
                    onTap: () => context.push(AppRoutes.editProfile),
                  );
                case 1:
                  return ProfileMenuTile(
                    icon: Icons.star_border_rounded,
                    title: l10n.profileMenuFavorite,
                    subtitle: l10n.profileMenuFavoriteSubtitle,
                    onTap: () => context.push(AppRoutes.favorite),
                  );
                default:
                  return ProfileMenuTile(
                    icon: Icons.lock_outline_rounded,
                    title: l10n.profileMenuPrivacyPolicy,
                    subtitle: l10n.profileMenuPrivacyPolicySubtitle,
                    onTap: () => context.push(AppRoutes.privacy),
                  );
              }
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                PremiumSectionHeader(title: l10n.profileSectionPreferences),
                const SizedBox(height: 12),
              ],
            ),
          ),
          SliverList.separated(
            itemCount: 3,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ProfileMenuTile(
                    icon: Icons.settings_outlined,
                    title: l10n.profileMenuSetting,
                    subtitle: l10n.profileMenuSettingSubtitle,
                    onTap: () => context.push(AppRoutes.settings),
                  );
                case 1:
                  return ProfileMenuTile(
                    icon: Icons.support_agent_rounded,
                    title: l10n.profileMenuHelp,
                    subtitle: l10n.profileMenuHelpSubtitle,
                    onTap: () => context.push(AppRoutes.help),
                  );
                default:
                  return ProfileMenuTile(
                    icon: Icons.logout_rounded,
                    title: l10n.profileMenuLogout,
                    subtitle: l10n.profileMenuLogoutSubtitle,
                    iconColor: ext.danger,
                    onTap: () => _showLogoutConfirmation(context),
                  );
              }
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet<void>(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      // Without this, the sheet is pushed onto the shell branch's nested
      // Navigator, whose Overlay sits *below* the outer Scaffold's
      // bottomNavigationBar slot — the floating nav bar then paints over
      // the bottom of the sheet. The root Navigator's Overlay sits above
      // the whole app shell, so the sheet renders fully on top of it.
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: ext.cardColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              border: Border.all(color: ext.glassBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: ext.glassBorder,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.profileLogoutConfirm,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: ext.textPrimary,
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _LogoutButton(
                      text: l10n.actionCancel,
                      isPrimary: false,
                      onTap: () => context.pop(),
                    ),
                    const SizedBox(width: 10),
                    _LogoutButton(
                      text: l10n.profileLogoutYes,
                      isPrimary: true,
                      onTap: () {
                        context.pop();
                        context.go(AppRoutes.login);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 44,
        decoration: BoxDecoration(
          gradient: isPrimary ? ext.accentGradient : null,
          color: isPrimary ? null : ext.glassFill,
          borderRadius: BorderRadius.circular(20),
          border: isPrimary ? null : Border.all(color: ext.glassBorder),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? ext.onAccent : ext.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
