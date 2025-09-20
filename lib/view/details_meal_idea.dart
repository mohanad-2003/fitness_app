// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fitness_app/controller/meal_idea_controller.dart';

// class TopRecipeDetails extends StatelessWidget {
//   const TopRecipeDetails({super.key, required this.controller});
//   final MealIdeaController controller;

//   @override
//   Widget build(BuildContext context) {
//     final r = controller.topRecipe;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
     
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: () => controller.showTopDetails.value = false,
//                 child: Container(
//                   width: 25.w,
//                   height: 25.h,
//                   decoration: BoxDecoration(
//                     color: Colors.amber,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 16.sp,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 12.w),
//               Text(
//                 "Meal Ideas",
//                 style: TextStyle(
//                   color: Color(0xffE2F163),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 16.h),

//         // ===== الاسم + الوقت + السعرات =====
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 // ✅ لتفادي overflow
//                 child: Text(
//                   r['name'] ?? '',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 20.sp,
//                     color: Color(0xffE2F163),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8.w),
//               GestureDetector(
//                 onTap: () {},
//                 child: const Icon(Icons.star_outlined, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 6.h),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Row(
//             children: [
//               Icon(Icons.access_time, size: 16.sp, color: Color(0xff896CFE)),
//               SizedBox(width: 5.w),
//               Text(
//                 r['time'] ?? '',
//                 style: TextStyle(color: Colors.white, fontSize: 14.sp),
//               ),
//               SizedBox(width: 12.w),
//               Icon(
//                 Icons.local_fire_department,
//                 size: 16.sp,
//                 color: Color(0xff896CFE),
//               ),
//               SizedBox(width: 6.w),
//               Text(
//                 r['calory'] ?? '',
//                 style: TextStyle(color: Colors.white, fontSize: 14.sp),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12.h),

//         // ===== صورة =====
//         Container(
//           width: double.infinity,
//           color: const Color(0xffB3A0FF),
//           padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
//           child: Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.r),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Image.asset(r['image'] ?? '', fit: BoxFit.cover),
//                     ),
//                     Positioned(
//                       top: 0.h,
//                       right: 0.w,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10.w,
//                           vertical: 4.h,
//                         ),
//                         decoration: BoxDecoration(
//                           color: const Color(0xffE2F163),
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20),
//                           ),
//                         ),
//                         child: Text(
//                           'Recipe Of The Day',
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             color: const Color(0xff232323),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

//         SizedBox(height: 16.h),

//         // ===== المكونات =====
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Ingredients',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: const Color(0xffE2F163),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               ...List<String>.from(r['ingredients'] ?? const [])
//                   .map(
//                     (ing) => Padding(
//                       padding: EdgeInsets.only(bottom: 6.h),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '• ',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                           Expanded(
//                             child: Text(
//                               ing,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                   ,

//               SizedBox(height: 16.h),

//               // ===== التحضير =====
//               Text(
//                 'Preparation',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: const Color(0xffE2F163),
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Text(
//                 (r['preparation'] ?? '').toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 14.sp,
//                   height: 1.5,
//                 ),
//               ),
//               SizedBox(height: 24.h),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
