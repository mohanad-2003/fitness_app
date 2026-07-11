import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();

    _logoScale = Tween<double>(
      begin: 0.86,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go(AppRoutes.welcome);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.seedInk,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/ob1.png',
              fit: BoxFit.cover,
              color: Colors.black.withValues(alpha: 0.34),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.seedInk.withValues(alpha: 0.96),
                    AppColors.seedInk.withValues(alpha: 0.74),
                    AppColors.graphite.withValues(alpha: 0.92),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -90,
            child: _SplashGlow(color: AppColors.seedLime, size: 260),
          ),
          Positioned(
            bottom: 90,
            left: -140,
            child: _SplashGlow(color: AppColors.electricOrange, size: 320),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeIn.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Transform.scale(
                          scale: _logoScale.value,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(34),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.seedLime.withValues(
                                    alpha: 0.20,
                                  ),
                                  blurRadius: 40,
                                  offset: const Offset(0, 18),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Image.asset('assets/FB.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'FIT',
                                style: TextStyle(
                                  color: AppColors.seedLime,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const TextSpan(text: 'BODY'),
                            ],
                          ),
                          style: Theme.of(
                            context,
                          ).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 58,
                            height: 0.94,
                            letterSpacing: -2,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Fitness + strength + health + progress.',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.78),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: const [
                            _MetricPill(label: '12K+', value: 'Workouts'),
                            SizedBox(width: 10),
                            _MetricPill(label: 'Pro', value: 'Plans'),
                          ],
                        ),
                        const SizedBox(height: 42),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: LinearProgressIndicator(
                            minHeight: 5,
                            value: _controller.value,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.10,
                            ),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.seedLime,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.seedLime,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.70)),
          ),
        ],
      ),
    );
  }
}

class _SplashGlow extends StatelessWidget {
  const _SplashGlow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: 0.28), color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}
