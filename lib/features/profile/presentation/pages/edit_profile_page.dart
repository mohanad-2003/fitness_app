import 'package:fitness_app/core/localization/generated/app_localizations.dart';
import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/core/widgets/app_text_field.dart';
import 'package:fitness_app/core/widgets/fade_slide_in.dart';
import 'package:fitness_app/core/widgets/premium_scaffold.dart';
import 'package:fitness_app/core/widgets/primary_button.dart';
import 'package:fitness_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_stat_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _Gender { male, female, other }

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileController;
  late final TextEditingController _dobController;
  late final TextEditingController _weightController;
  late final TextEditingController _heightController;
  _Gender _gender = _Gender.female;
  bool _saving = false;
  String? _nameError;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController(text: '+123 567 89000');
    _dobController = TextEditingController();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _dobController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  String _genderLabel(_Gender gender, AppLocalizations l10n) => switch (gender) {
    _Gender.male => l10n.editProfileGenderMale,
    _Gender.female => l10n.editProfileGenderFemale,
    _Gender.other => l10n.editProfileGenderOther,
  };

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1996, 4, 1),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dobController.text =
          '${picked.day.toString().padLeft(2, '0')} / '
          '${picked.month.toString().padLeft(2, '0')} / ${picked.year}';
    }
  }

  Future<void> _handleSave(AppLocalizations l10n) async {
    if (_nameController.text.trim().isEmpty) {
      setState(() => _nameError = l10n.editProfileNameValidation);
      return;
    }
    setState(() {
      _nameError = null;
      _saving = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.editProfileSuccessMessage)));
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(currentUserProfileProvider);
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    final l10n = AppLocalizations.of(context);

    if (!_initialized) {
      _initialized = true;
      _nameController.text = profile.name;
      _emailController.text = profile.email;
      _weightController.text = profile.weightKg;
      _heightController.text = profile.heightM;
      _dobController.text = '01 / 04 / 1996';
    }

    return PremiumScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideIn(
              offset: const Offset(0, -0.1),
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
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
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
                              border: Border.all(
                                color: ext.glassBorder,
                                width: 2,
                              ),
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
                ],
              ),
            ),
            const SizedBox(height: 22),
            FadeSlideIn(
              delay: const Duration(milliseconds: 100),
              child: PremiumGlassCard(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: ProfileStatRow(profile: profile),
              ),
            ),
            const SizedBox(height: 26),
            FadeSlideIn(
              delay: const Duration(milliseconds: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    controller: _nameController,
                    label: l10n.editProfileFullName,
                    prefixIcon: Icons.person_outline_rounded,
                    onChanged: (_) {
                      if (_nameError != null) {
                        setState(() => _nameError = null);
                      }
                    },
                  ),
                  if (_nameError != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      _nameError!,
                      style: TextStyle(color: ext.danger, fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 15),
                  AppTextField(
                    controller: _emailController,
                    label: l10n.authEmail,
                    prefixIcon: Icons.alternate_email_rounded,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    controller: _mobileController,
                    label: l10n.editProfileMobileNumber,
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: _pickDate,
                    child: AbsorbPointer(
                      child: AppTextField(
                        controller: _dobController,
                        label: l10n.editProfileDateOfBirth,
                        prefixIcon: Icons.cake_outlined,
                        suffixIcon: const Icon(Icons.calendar_today_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    controller: _weightController,
                    label: l10n.editProfileWeight,
                    prefixIcon: Icons.monitor_weight_outlined,
                  ),
                  const SizedBox(height: 15),
                  AppTextField(
                    controller: _heightController,
                    label: l10n.editProfileHeight,
                    prefixIcon: Icons.height_rounded,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l10n.editProfileGenderLabel,
                    style: TextStyle(
                      color: ext.textPrimary,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (final gender in _Gender.values) ...[
                        if (gender != _Gender.values.first)
                          const SizedBox(width: 8),
                        Expanded(
                          child: _GenderChip(
                            label: _genderLabel(gender, l10n),
                            selected: _gender == gender,
                            onTap: () => setState(() => _gender = gender),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            FadeSlideIn(
              delay: const Duration(milliseconds: 180),
              child: PrimaryButton(
                label: l10n.editProfileUpdate,
                isLoading: _saving,
                onPressed: () => _handleSave(l10n),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _GenderChip extends StatelessWidget {
  const _GenderChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: selected ? ext.accentGradient : null,
          color: selected ? null : ext.glassFill,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.transparent : ext.glassBorder,
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? ext.onAccent : ext.textPrimary,
            fontWeight: FontWeight.w800,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}
