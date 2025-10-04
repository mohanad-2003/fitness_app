import 'package:fitness_app/controller/onboarding_controller.dart';
import 'package:fitness_app/view/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Onboardingscreen extends StatelessWidget {
  OnboardingController onboardingController = Get.put(OnboardingController());
  Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onboardingController.pages.length,
            controller: onboardingController.pageController,
            itemBuilder: (context, index) {
              final item = onboardingController.pages[index];
              return OnboardPage(
                image: item['image'] ?? " ",
                icon: item['icon'] ?? "",
                title: item['title'] ?? "",
              );
            },
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => onboardingController.skip(),
              child: Row(
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      height: 17.h,
                      fontSize: 20.sp,
                      color: Color(0xffE2F163),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_left_outlined, color: Color(0xffE2F163)),
                ],
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: GestureDetector(
                onTap: onboardingController.goToNextPage,
                child: Container(
                  width: 211,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Obx(() => Text(
                          onboardingController.currentIndex.value ==
                                  onboardingController.pages.length - 1
                              ? "Get Started"
                              : "Next",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}


// import 'package:fitness_app/view/login_page.dart';
// import 'package:fitness_app/view/onboard_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OnboardingScreen extends StatefulWidget{
//    OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
  

  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//             controller: _controller,
//             itemCount: pages.length,
//             onPageChanged: (index) => setState(() => _currentIndex = index),
//             itemBuilder: (context, index) {
//               final item = pages[index];
//               return OnboardPage(
//                 image: item['image']!,
//                 icon: item['icon']!,
//                 title: item['title']!,
//               );
//             },
//           ),

//           // Skip
//           Positioned(
//             top: 40,
//             right: 20,
//             child: GestureDetector(
//               onTap: () => Get.offAll(() => LoginPage()),
//               child: Row(
//                 children: const [
//                   Text(
//                     "Skip",
//                     style: TextStyle(
//                       color: Color(0xffE2F163),
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Icon(Icons.arrow_right, color: Color(0xffE2F163), size: 30),
//                 ],
//               ),
//             ),
//           ),

//           // Next / Get Started
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 60),
//               child: GestureDetector(
//                 onTap: _goToNextPage,
//                 child: Container(
//                   width: 211,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white.withOpacity(0.5),
//                         blurRadius: 2,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       _currentIndex == pages.length - 1
//                           ? "Get Started"
//                           : "Next",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
