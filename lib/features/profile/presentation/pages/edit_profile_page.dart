import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
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
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    return PremiumScaffold(
      child: SingleChildScrollView(
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
                  l10n.editProfileTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: ext.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 44),
              ],
            ),
            const SizedBox(height: 20),
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
                        border: Border.all(color: ext.glassBorder, width: 2),
                      ),
                      child: Icon(
                        Icons.edit_rounded,
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
                  color: ext.textPrimary,
                  fontWeight: FontWeight.bold,
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
            const SizedBox(height: 22),
            PremiumGlassCard(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: ProfileStatRow(profile: profile),
            ),
            const SizedBox(height: 26),
            AppTextField(label: l10n.editProfileFullName, hint: profile.name),
            const SizedBox(height: 15),
            AppTextField(label: l10n.authEmail, hint: profile.email),
            const SizedBox(height: 15),
            AppTextField(
              label: l10n.editProfileMobileNumber,
              hint: '+123 567 89000',
            ),
            const SizedBox(height: 15),
            AppTextField(
              label: l10n.editProfileDateOfBirth,
              hint: '01 / 04 / 199X',
            ),
            const SizedBox(height: 15),
            AppTextField(label: l10n.editProfileWeight, hint: profile.weightKg),
            const SizedBox(height: 15),
            AppTextField(label: l10n.editProfileHeight, hint: profile.heightM),
            const SizedBox(height: 26),
            Center(
              child: InkWell(
                onTap: () => context.pop(),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 180,
                  height: 46,
                  decoration: BoxDecoration(
                    gradient: ext.accentGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: ext.accentGlow.withValues(alpha: 0.3),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      l10n.editProfileUpdate,
                      style: TextStyle(
                        fontSize: 16,
                        color: ext.onAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
