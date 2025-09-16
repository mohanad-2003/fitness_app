import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavoritController extends GetxController {
  RxInt selectIndex = 0.obs; // حفظ العنصر المحدد
  ScrollController scrollController = ScrollController();

  // قائمة العناصر الأصلية مع النوع Video أو Article
  List<Map<String, dynamic>> allItems = [
    {
      "image": "assets/upper.png",
      "title": "Upper Body",
      "duration": "60 Minutes",
      "type": "Video", // نوع المحتوى Video
      "calories": "1320 Kcal",
      "exercises": "5 Exercises",
    },
    {
      "image": "assets/loop.png",
      "title": "Loop band Exercises",
      "duration": "45 Minutes",
      "type": "Video", // نوع المحتوى Video
      "calories": "785 Kcal",
      "exercises": "5 Exercises",
    },
    {
      "image": "assets/dumbbell.png",
      "title": "dumbbell step up",
      "duration": "12 Minutes",
      "type": "Video", // نوع المحتوى Video
      "calories": "1385 Kcal",
      "exercises": "3 exercises",
    },
    {
      "image": "assets/split.png",
      "title": "Split Strength Training",
      "duration": "12 Minutes",
      "type": "Video", // نوع المحتوى Video
      "calories": "1250 Kcal",
      "exercises": "5 exercises",
    },
    {
      "image": "assets/boost.png",
      "title": "Boost Energy \nand Vitality",
      "text":
          "Incorporating physical exercise into your daily routine can boost...",
      "type": "Article", // نوع المحتوى Article
    },
    {
      "image": "assets/pull.png",
      "title": "Pull Out",
      "duration": "30 Minutes",
      "type": "Video",
      "calories": "1210 Kcal",
      "exercises": "10 Exercises",
    },

    {
      "image": "assets/avocado.png",
      "title": "Avocado and\n Egg Toast",
      "type": "Article",
      "duration": "15 Minutes",
      "calories": "150 Cal",
    },
    {
      "image": "assets/lower.png",
      "title": "Lower Body Blast",
      "text":
          "A lower body blast is a\n high-intensity workout\n focused on targeting...",
      "type": "Article",
    },
    {
      "image": "assets/fruit.png",
      "title": "fruit smoothie",
      "duration": "12 Minutes",
      "calories": "120 Cal",
      "type": "Article",
    },
    {
      "image": "assets/hydrate.png",
      "title": "Hydrate Properly",
      "text":
          "Stay hydrated before,\n during, and after your\n workouts to optimize...",
      "type": "Article",
    },
  ];

  RxList<Map<String, dynamic>> displayItems = <Map<String, dynamic>>[].obs;

  // دالة لتصفية العناصر بناءً على النوع (All, Video, Article)
  void fillterItems(String fillterType) {
    if (fillterType == 'All') {
      displayItems.value = List.from(
        allItems,
      ); // عرض كل العناصر (الفيديو والمقالات)
    } else {
      displayItems.value =
          allItems.where(
            (item) => item['type'] == fillterType,
          ) // تصفية العناصر حسب النوع
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fillterItems('All'); // عند البداية نعرض جميع العناصر
  }
}
