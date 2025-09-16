

// onboarding_screen.dart
import 'package:fitness_app/view/login_page.dart';
import 'package:fitness_app/view/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/ob2.png',
      'icon': 'assets/work.png',
      'title': 'Start Your Journey Towards A\nMore Active Lifestyle',
    },
    {
      'image': 'assets/ob3.png',
      'icon': 'assets/apple.png',
      'title': 'Find nutrition tips that fit\nyour lifestyle',
    },
    {
      'image': 'assets/ob4.png',
      'icon': 'assets/Community.png',
      'title': 'A community for you,\nchallenge yourself',
    },
  ];

  void _goToNextPage() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final item = pages[index];
              return OnboardPage(
                image: item['image']!,
                icon: item['icon']!,
                title: item['title']!,
              );
            },
          ),

          // Skip
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => Get.offAll(() => LoginPage()),
              child: Row(
                children: const [
                  Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0xffE2F163),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_right, color: Color(0xffE2F163), size: 30),
                ],
              ),
            ),
          ),

          // Next / Get Started
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: GestureDetector(
                onTap: _goToNextPage,
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
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _currentIndex == pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
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
