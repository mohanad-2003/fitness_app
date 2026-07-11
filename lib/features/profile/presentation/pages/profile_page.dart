import 'package:fitness_app/core/routing/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_stat_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: const BoxDecoration(
                    color: Color(0xffB3A0FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap:
                                () => context.canPop() ? context.pop() : null,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 28,
                              color: AppColors.seedLime,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'My Profile',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CircleAvatar(
                        backgroundImage: AssetImage(profile.avatar),
                        radius: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        profile.email,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Birthday: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: profile.birthday,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.seedViolet,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ProfileStatRow(profile: profile),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _ProfileTile(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () => context.push(AppRoutes.editProfile),
                  ),
                  const SizedBox(height: 10),
                  _ProfileTile(
                    icon: Icons.star,
                    title: 'Favorite',
                    onTap: () => context.push(AppRoutes.favorite),
                  ),
                  const SizedBox(height: 10),
                  const _ProfileTile(
                    icon: Icons.lock_open,
                    title: 'Privacy Policy',
                  ),
                  const SizedBox(height: 10),
                  _ProfileTile(
                    icon: Icons.settings,
                    title: 'Setting',
                    onTap: () => context.push(AppRoutes.settings),
                  ),
                  const SizedBox(height: 10),
                  _ProfileTile(
                    icon: Icons.support_agent,
                    title: 'Help',
                    onTap: () => context.push(AppRoutes.help),
                  ),
                  const SizedBox(height: 10),
                  _ProfileTile(
                    icon: Icons.logout,
                    title: 'Log out',
                    onTap: () => _showLogoutConfirmation(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          height: 220,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xffB3A0FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              const Text(
                'Are you sure you want to\n log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LogoutButton(
                    text: 'Cancel',
                    color: Colors.white,
                    textColor: AppColors.seedViolet,
                    onTap: () => context.pop(),
                  ),
                  const SizedBox(width: 10),
                  _LogoutButton(
                    text: 'Yes, logout',
                    color: AppColors.seedLime,
                    textColor: Colors.black,
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.login);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.seedViolet,
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, color: Colors.white, size: 28)),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      trailing: const Icon(
        Icons.arrow_right,
        color: AppColors.seedLime,
        size: 28,
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 38,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
