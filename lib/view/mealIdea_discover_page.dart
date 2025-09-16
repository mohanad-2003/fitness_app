// import 'package:fitness_app/view/mealIdeaPage.dart';
// import 'package:fitness_app/view/notification_page.dart';
// import 'package:fitness_app/view/profile_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/instance_manager.dart';

// class MealideaDiscoverPage extends StatelessWidget {
//   const MealideaDiscoverPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff232323),
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/m_i.png",
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.black.withOpacity(0.3),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 0.045.sh,
//               horizontal: 0.040.sw,
//             ),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () => Get.back(),
//                   child: Icon(
//                     Icons.arrow_left_outlined,
//                     color: Colors.white,
//                     size: 30.sp,
//                   ),
//                 ),
//                 Spacer(),
//                 GestureDetector(
//                   onTap: () => Get.to(NotificationPage()),
//                   child: Icon(Icons.notifications, color: Colors.white),
//                 ),
//                 SizedBox(width: 10.w),
//                 GestureDetector(
//                   onTap: () => Get.to(ProfilePage()),
//                   child: Icon(Icons.person, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 140.h,
//                   color: Color(0xffB3A0FF),
//                   child: Center(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 20.h,
//                         horizontal: 30.w,
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset("assets/apple.png"),
//                               SizedBox(width: 10.h),
//                               Text(
//                                 "Meal Ideas",
//                                 style: TextStyle(
//                                   fontSize: 20.sp,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 10.h),
//                           Text(
//                             textAlign: TextAlign.center,
//                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
//                             style: TextStyle(
//                               fontSize: 13.sp,
//                               color: Color(0xff232323),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.h),
//                 GestureDetector(
//                   onTap: () => Get.to(MealIdeaPage()),
//                   child: Container(
//                     width: 250.w,
//                     height: 39.h,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.26),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Discover",
//                         style: TextStyle(
//                           fontSize: 20.sp,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:fitness_app/view/mealIdeaPage.dart';
import 'package:fitness_app/view/notification_page.dart';
import 'package:fitness_app/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MealideaDiscoverPage extends StatelessWidget {
  const MealideaDiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    // قيَم متجاوبة مع حدود عليا/دنيا لتفادي التضخيم/التصغير المبالغ فيه
    final double headerHPad = (16.w).clamp(12.0, 24.0).toDouble();
    final double headerVPad = (12.h).clamp(8.0, 20.0).toDouble();
    final double iconSize = (24.sp).clamp(22.0, 30.0).toDouble();
    final double iconsGap = (10.w).clamp(8.0, 16.0).toDouble();

    final double cardHeight = (140.h).clamp(120.0, 180.0).toDouble();
    final double cardHPad = (30.w).clamp(20.0, 40.0).toDouble();
    final double cardVPad = (20.h).clamp(12.0, 28.0).toDouble();
    final double titleSize = (20.sp).clamp(18.0, 24.0).toDouble();
    final double bodySize = (13.sp).clamp(12.0, 16.0).toDouble();
    final double rowGap = (10.w).clamp(8.0, 16.0).toDouble();
    final double appleSize = (28.h).clamp(22.0, 36.0).toDouble();

    final double btnWidth = (250.w).clamp(200.0, 320.0).toDouble();
    final double btnHeight = (48.h).clamp(44.0, 56.0).toDouble();
    final double btnRadius = (20.r).clamp(14.0, 26.0).toDouble();
    final double btnText = (20.sp).clamp(16.0, 22.0).toDouble();

    return Scaffold(
      backgroundColor: const Color(0xff232323),
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset("assets/m_i.png", fit: BoxFit.cover),
          ),
          // طبقة تعتيم
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // شريط علوي
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: headerVPad,
                horizontal: headerHPad,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_left_outlined,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.to(() => NotificationPage()),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                  SizedBox(width: iconsGap),
                  GestureDetector(
                    onTap: () => Get.to(() => const ProfilePage()),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // المحتوى الأوسط
          Center(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // البطاقة التعريفية
                    Container(
                      width: double.infinity,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xffB3A0FF),
                        //   borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: cardVPad,
                          horizontal: cardHPad,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/apple.png",
                                  height: appleSize,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: rowGap),
                                Text(
                                  "Meal Ideas",
                                  style: TextStyle(
                                    fontSize: titleSize,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (10.h).clamp(8.0, 16.0).toDouble(),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: bodySize,
                                color: const Color(0xff232323),
                                height: 1.3,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: (20.h).clamp(14.0, 28.0).toDouble()),

                    // زر الاستكشاف
                    GestureDetector(
                      onTap: () => Get.to(() => MealIdeaPage()),
                      child: Container(
                        width: btnWidth,
                        height: btnHeight, // يحقق متطلبات الوصولية (>=44)
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.26),
                          borderRadius: BorderRadius.circular(btnRadius),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.white.withOpacity(0.35),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Discover",
                          style: TextStyle(
                            fontSize: btnText,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
