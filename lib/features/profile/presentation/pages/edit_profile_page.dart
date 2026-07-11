import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_stat_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider);

    return PremiumScaffold(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xffB3A0FF),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.canPop() ? context.pop() : null,
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.seedLime,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(profile.avatar),
                        ),
                        const Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.seedLime,
                            child: Icon(Icons.edit, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profile.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    profile.email,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Overlaps the header/body seam without needing to know the
            // header's rendered height (avoids the overflow bugs a fixed
            // percentage-of-screen-height container caused at some sizes).
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.seedViolet,
                    borderRadius: BorderRadius.circular(12),
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(label: 'Full Name', hint: profile.name),
                  const SizedBox(height: 15),
                  AppTextField(label: 'Email', hint: profile.email),
                  const SizedBox(height: 15),
                  const AppTextField(
                    label: 'Mobile Number',
                    hint: '+123 567 89000',
                  ),
                  const SizedBox(height: 15),
                  const AppTextField(
                    label: 'Date of Birth',
                    hint: '01 / 04 / 199X',
                  ),
                  const SizedBox(height: 15),
                  AppTextField(label: 'Weight', hint: profile.weightKg),
                  const SizedBox(height: 15),
                  AppTextField(label: 'Height', hint: profile.heightM),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () => context.pop(),
                child: Container(
                  width: 160,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.seedLime,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}
