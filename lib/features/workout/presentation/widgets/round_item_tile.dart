import 'package:fitness_app/core/theme/app_theme_extension.dart';
import 'package:fitness_app/features/workout/domain/exercise_detail_models.dart';
import 'package:flutter/material.dart';

class RoundItemTile extends StatelessWidget {
  const RoundItemTile({super.key, required this.item, this.onTap});

  final RoundExerciseItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<AppThemeExtension>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: ext.glassFill,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ext.glassBorder),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.accent,
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: ext.onAccent,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item.name,
                            style: TextStyle(
                              color: ext.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          item.reps,
                          style: TextStyle(
                            color: ext.accentGlow,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Image.asset(
                          'assets/time.png',
                          color: ext.textMuted,
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            item.time,
                            style: TextStyle(
                              color: ext.textMuted,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
