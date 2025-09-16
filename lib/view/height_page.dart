import 'package:fitness_app/view/goal_page.dart';
import 'package:fitness_app/view/header_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightPage extends StatelessWidget {
  const HeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBack(),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Text(
                      "What Is Your Height",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("60", style: TextStyle(color: Colors.white)),
                            Text("60", style: TextStyle(color: Colors.white)),
                            Text("60", style: TextStyle(color: Colors.white)),
                            Text("60", style: TextStyle(color: Colors.white)),
                            Text("60", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 60,
                          height: 300,
                          color: Color(0xffB3A0FF),
                          child: Column(
                            children: List.generate(10, (index) {
                              return Container(
                                height: 20,
                                width: 2,
                                color: Colors.white,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () => Get.to(GoalPage()),
                      child: Container(
                        height: 44,
                        width: 178,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            "Start",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
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
// code height Container

// import 'package:flutter/material.dart';

// class HeightSelectorWidget extends StatefulWidget {
//   const HeightSelectorWidget({super.key});

//   @override
//   State<HeightSelectorWidget> createState() => _HeightSelectorWidgetState();
// }

// class _HeightSelectorWidgetState extends State<HeightSelectorWidget> {
//   double _height = 165.0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // ✅ القيمة بالأعلى
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               _height.toStringAsFixed(0),
//               style: const TextStyle(
//                 fontSize: 40,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 4),
//             const Text(
//               "Cm",
//               style: TextStyle(fontSize: 18, color: Colors.white70),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),

//         // ✅ الشريط العمودي التفاعلي
//         SizedBox(
//           height: 300,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               // ✅ خلفية البنفسجي
//               Container(
//                 width: 60,
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xffB3A0FF),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),

//               // ✅ الخطوط
//               Positioned.fill(
//                 child: CustomPaint(painter: HeightRulerPainter(_height)),
//               ),

//               // ✅ الشريط التفاعلي - الأهم!
//               RotatedBox(
//                 quarterTurns: -1,
//                 child: SliderTheme(
//                   data: SliderTheme.of(context).copyWith(
//                     activeTrackColor: Colors.transparent,
//                     inactiveTrackColor: Colors.transparent,
//                     thumbColor: const Color(0xffE2F163),
//                     overlayColor: const Color(0xffE2F163).withOpacity(0.2),
//                     trackHeight: 50,
//                     thumbShape: const RoundSliderThumbShape(
//                       enabledThumbRadius: 10,
//                     ),
//                     overlayShape: const RoundSliderOverlayShape(
//                       overlayRadius: 20,
//                     ),
//                   ),
//                   child: Slider(
//                     min: 140,
//                     max: 190,
//                     divisions: 100,
//                     value: _height,
//                     onChanged: (value) {
//                       setState(() => _height = value);
//                     },
//                   ),
//                 ),
//               ),

//               // ✅ السهم الجانبي
//               Positioned(
//                 right: 0,
//                 child: Container(
//                   width: 12,
//                   height: 12,
//                   decoration: const BoxDecoration(
//                     color: Color(0xffE2F163),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 20),

//         ElevatedButton(
//           onPressed: () {
//             print("تم اختيار الطول: $_height سم");
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.white24,
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: const Text("Continue", style: TextStyle(color: Colors.white)),
//         ),
//       ],
//     );
//   }
// }

// // ✅ رسام التدريجات
// class HeightRulerPainter extends CustomPainter {
//   final double selectedHeight;

//   HeightRulerPainter(this.selectedHeight);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint =
//         Paint()
//           ..color = Colors.white54
//           ..strokeWidth = 1;

//     const step = 10.0;
//     const totalSteps = 6;

//     double centerY = size.height / 2;

//     for (int i = -totalSteps; i <= totalSteps; i++) {
//       double y = centerY + (i * step);
//       double length = (i % 5 == 0) ? 20 : 10;
//       canvas.drawLine(
//         Offset(size.width / 2 - length / 2, y),
//         Offset(size.width / 2 + length / 2, y),
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
