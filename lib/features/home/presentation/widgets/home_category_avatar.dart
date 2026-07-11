import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/home/domain/home_models.dart';
import 'package:flutter/material.dart';

class HomeCategoryAvatar extends StatelessWidget {
  const HomeCategoryAvatar({
    super.key,
    required this.category,
    this.isSelected = false,
    this.onTap,
  });

  final HomeCategory category;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const radius = 28.0;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              child: Image.asset(category.image, width: radius, height: radius),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: radius * 2.45,
              child: Text(
                category.name,
                style: TextStyle(
                  color: isSelected ? AppColors.seedLime : AppColors.seedViolet,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
