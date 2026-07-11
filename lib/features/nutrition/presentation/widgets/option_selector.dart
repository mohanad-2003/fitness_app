import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Radio-style option list, previously duplicated six times across
/// meals_planesPage1 and meal_plane_page2 (dietary preference, allergies,
/// meal types, caloric goal, cooking time, servings) with only the item
/// width/spacing differing slightly.
class OptionSelector extends StatelessWidget {
  const OptionSelector({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
    this.itemWidthFraction = 0.5,
  });

  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;

  /// Fraction of the available width each item takes (1.0 = full width,
  /// 0.5 = two columns).
  final double itemWidthFraction;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: width * 0.03,
      runSpacing: width * 0.04,
      children: [
        for (final option in options)
          GestureDetector(
            onTap: () => onSelected(option),
            child: SizedBox(
              width: width * itemWidthFraction - width * 0.09,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: width * 0.058,
                    height: width * 0.058,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.seedViolet, width: 2),
                    ),
                    child:
                        option == selected
                            ? Center(
                              child: Container(
                                width: width * 0.03,
                                height: width * 0.03,
                                decoration: const BoxDecoration(
                                  color: AppColors.seedLime,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                            : null,
                  ),
                  SizedBox(width: width * 0.02),
                  Flexible(
                    child: Text(
                      option,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
