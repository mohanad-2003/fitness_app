import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key, required this.fillFraction});

  /// نسبة الجزء الأصفر من 0 إلى 1
  final double fillFraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 147,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // خلفية داكنة حول العمود
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // الجزء العلوي الرمادي الفاتح
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            // الجزء الأصفر السفلي (ممتلئ بحسب النسبة)
            FractionallySizedBox(
              heightFactor: fillFraction.clamp(0.0, 1.0),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffE2F163),
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
