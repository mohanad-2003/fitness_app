import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Vertical fill-bar chart primitive. Renamed from the legacy `Bar` widget
/// (lib/view/bar.dart) and moved to core since it's a generic chart mark,
/// not workout-specific.
class FillBar extends StatelessWidget {
  const FillBar({super.key, required this.fillFraction});

  final double fillFraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 147,
      decoration: BoxDecoration(
        color: AppColors.lightOutline,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightOutline,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            FractionallySizedBox(
              heightFactor: fillFraction.clamp(0.0, 1.0),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.seedLime,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
