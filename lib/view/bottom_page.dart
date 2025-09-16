import 'package:fitness_app/controller/bottom-controller.dart';
import 'package:fitness_app/view/document_page.dart';
import 'package:fitness_app/view/favorite_page.dart';
import 'package:fitness_app/view/help_page.dart';
import 'package:fitness_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class BottomPage extends StatelessWidget {
  BottomController bottomController = Get.put(BottomController());
  List<Widget> pages = [HomePage(), DocumentPage(), FavoritePage(), HelpPage()];
  BottomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return pages[bottomController.curruntIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomController.curruntIndex.value,
          onTap: (index) {
            return bottomController.selectIndex(index);
          },
          backgroundColor: Color(0xffB3A0FF),

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description, color: Colors.white),
              label: "Document",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star, color: Colors.white),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic_rounded, color: Colors.white),
              label: "ٍSupport",
            ),
          ],
        );
      }),
    );
  }
}
