import 'package:flutter/material.dart';

/// Small glowing dot marking an unread notification, with a gentle pulse so
/// it draws the eye without being distracting.
class UnreadIndicator extends StatefulWidget {
  const UnreadIndicator({super.key, required this.color, this.size = 9});

  final Color color;
  final double size;

  @override
  State<UnreadIndicator> createState() => _UnreadIndicatorState();
}

class _UnreadIndicatorState extends State<UnreadIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow = 0.25 + (_controller.value * 0.35);
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: glow),
                blurRadius: 8,
                spreadRadius: 1.5,
              ),
            ],
          ),
        );
      },
    );
  }
}
