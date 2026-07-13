import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_menu_tile.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (context.canPop())
                      PremiumIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => context.pop(),
                      ),
                    const Spacer(),
                    Text(
                      l10n.profileMyProfile,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        color: ext.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Spacer(),
                    PremiumIconButton(
                      icon: Icons.edit_rounded,
                      onTap: () => context.push(AppRoutes.editProfile),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: ext.accentGradient,
                        ),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: ext.cardColor,
                          backgroundImage: AssetImage(profile.avatar),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ext.cardColor,
                            border: Border.all(
                              color: ext.glassBorder,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.verified_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    profile.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ext.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    profile.email,
                    style: TextStyle(fontSize: 13, color: ext.textMuted),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: l10n.profileBirthdayLabel,
                          style: TextStyle(
                            color: ext.textMuted,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: profile.birthday,
                          style: TextStyle(
                            color: ext.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                PremiumGlassCard(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: ProfileStatRow(profile: profile),
                ),
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
                    onTap: () => context.push(AppRoutes.editProfile),
                  );
                case 1:
                  return ProfileMenuTile(
                    icon: Icons.star_border_rounded,
                    title: l10n.profileMenuFavorite,
                    onTap: () => context.push(AppRoutes.favorite),
                  );
                default:
                  return ProfileMenuTile(
                    icon: Icons.lock_outline_rounded,
                    title: l10n.profileMenuPrivacyPolicy,
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
                    onTap: () => context.push(AppRoutes.settings),
                  );
                case 1:
                  return ProfileMenuTile(
                    icon: Icons.support_agent_rounded,
                    title: l10n.profileMenuHelp,
                    onTap: () => context.push(AppRoutes.help),
                  );
                default:
                  return ProfileMenuTile(
                    icon: Icons.logout_rounded,
                    title: l10n.profileMenuLogout,
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
