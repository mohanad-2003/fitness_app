import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/workout/presentation/providers/workout_progress_controller.dart';
import 'package:flutter/material.dart';

/// The Workout Log / Charts tab switcher shared by [WorkoutLogsPage] and
/// [CategoryChartsPage] (previously duplicated in both legacy screens).
class ProgressTabBar extends StatelessWidget {
  const ProgressTabBar({
    super.key,
    required this.selected,
    this.onLogsTap,
    this.onChartsTap,
  });

  final ProgressTab selected;
  final VoidCallback? onLogsTap;
  final VoidCallback? onChartsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tab('Workout Log', ProgressTab.logs, onLogsTap),
        const SizedBox(width: 16),
        _tab('Charts', ProgressTab.charts, onChartsTap),
      ],
    );
  }

  Widget _tab(String label, ProgressTab tab, VoidCallback? onTap) {
    final isSelected = tab == selected;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 151,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? AppColors.seedLime : Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color:
                  isSelected ? const Color(0xff232323) : AppColors.seedViolet,
            ),
          ),
        ),
      ),
    );
  }
}
