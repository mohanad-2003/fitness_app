import 'package:fitness_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = Get.put(PageController());
  var currentIndex = 0.obs;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/ob2.png",
      "title": "Start your journey towards a more active lifestyle",
      "icon": "assets/work.png",
    },
    {
      "image": "assets/ob3.png",
      "title": "Find nutrition tips that fit your lifestyle",
      "icon": "assets/work.png",
    },
    {
      "image": "assets/ob4.png",
      "title": "A community for you, challenge yourself",
      "icon": "assets/community.png",
    },
  ];
  void goToNextPage() {
    if (currentIndex.value < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(seconds: 3),
        curve: Curves.decelerate,
      );
    } else {
      Get.to(LoginPage());
    }
  }

  void skip() {
    Get.to(LoginPage());
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}
