import 'package:fitness_app/features/profile/domain/profile_models.dart';
import 'package:flutter/material.dart';

/// The Weight/Age/Height stat row duplicated between ProfilePage and
/// EditProfilePage.
class ProfileStatRow extends StatelessWidget {
  const ProfileStatRow({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Stat(label: profile.weightKg, subLabel: 'Weight'),
        _Divider(),
        _Stat(label: profile.ageYears, subLabel: 'Years Old'),
        _Divider(),
        _Stat(label: profile.heightM, subLabel: 'Height'),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.subLabel});
  final String label;
  final String subLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Text(
          subLabel,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    height: 40,
    color: Colors.white.withValues(alpha: 0.7),
  );
}
