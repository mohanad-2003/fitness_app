// // 📁 lib/view/shared_workout_page.dart

// import 'package:flutter/material.dart';
// import 'package:fitness_app/view/header_workout.dart';

// class SharedWorkoutPage extends StatelessWidget {
//   final String title;
//   final String image;
//   final String tag;
//   final String duration;
//   final String calories;
//   final String level;
//   final List<Map<String, dynamic>> rounds;

//   const SharedWorkoutPage({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.tag,
//     required this.duration,
//     required this.calories,
//     required this.level,
//     required this.rounds,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff232323),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               child: HeaderWorkout(name: level),
//             ),
//             _buildHeader(image, tag, duration, calories, level),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (int i = 0; i < rounds.length; i++) ...[
//                       if (i == 0 || rounds[i]['round'] != rounds[i - 1]['round']) ...[
//                         Text(
//                           "Round \${rounds[i]['round']}",
//                           style: const TextStyle(
//                             color: Color(0xffE2F163),
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                       _buildRound(
//                         rounds[i]['name'],
//                         rounds[i]['time'],
//                         rounds[i]['reps'],
//                         rounds[i]['color'],
//                         rounds[i]['onTap'],
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(String image, String tag, String duration, String calories, String level) {
//     return Container(
//       width: double.infinity,
//       height: 210,
//       color: const Color(0xffB3A0FF),
//       child: Center(
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(image, width: 320, height: 165, fit: BoxFit.cover),
//             ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 width: 157,
//                 height: 21,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   color: Color(0xffE2F163),
//                 ),
//                 child: Center(
//                   child: Text(
//                     tag,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Color(0xff212020),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   color: const Color(0xff212020).withOpacity(0.5),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildInfoRow("assets/time.png", duration),
//                     _buildInfoRow("assets/calories.png", calories),
//                     _buildInfoRow("assets/run.png", level),
//                     const Icon(Icons.star, color: Colors.white),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String iconPath, String text) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(iconPath, color: Colors.white, width: 14, height: 14),
//         const SizedBox(width: 5),
//         Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
//       ],
//     );
//   }

//   Widget _buildRound(
//     String name,
//     String time,
//     String reps,
//     Color color,
//     VoidCallback? onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         height: 64,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: Row(
//           children: [
//             Container(
//               width: 45,
//               height: 45,
//               decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//               child: const Center(
//                 child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(name,
//                           style: const TextStyle(
//                               fontSize: 13,
//                               color: Color(0xff232323),
//                               fontWeight: FontWeight.bold)),
//                       Text(reps, style: const TextStyle(fontSize: 13, color: Color(0xff896CFE))),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Image.asset("assets/time.png", color: Color(0xffB3A0FF)),
//                       const SizedBox(width: 5),
//                       Text(time, style: const TextStyle(color: Color(0xffB3A0FF), fontSize: 12)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
