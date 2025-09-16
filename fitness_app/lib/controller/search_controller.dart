import 'package:get/get.dart';

class SearchController1 extends GetxController {
  var currentTap = 0.obs; // متغير لتتبع الفئة المحددة

  void SelectedTap(int value) {
    currentTap.value = value; // تحديث القيمة بناءً على الفئة المحددة
  }

  List<Map<String, dynamic>> workout = [
      {
      "image": "assets/squat.png",
      "name": "Squat Exercise",
      "time": "12 Minutes",
      "calory": "120 Kcal",
      "type": "Workout",
    },
    {
      "image": "assets/fullbody.png",
      "name": "Full Body Stretching",
      "time": "12 Minutes",
      "calory": "120 Kcal",
      "type": "Workout",
    },
  ];
  List<Map<String, dynamic>> allSearch = [
    {
      "image": "assets/circuit.png",
      "name": "Circuit Training",
      "time": "50 Minutes",
      "calory": "1300 Kcal",
      "exercises":"5 exercises",
      "type": "Workout",
    },
    {
      "image": "assets/delights.png",
      "name": "Delights with\n Greek Yogurt",
      "time": "6 Minutes",
      "calory": "200 Cal",
      "type": "Nutrition",
    },
    {
      "image": "assets/split.png",
      "name": "Split Strength\n Training",
      "time": "12 Minutes",
      "calory": "1250 Kcal",
      "type": "Workout",
      "exercises":"5 exercises",
    },
    {
      "image": "assets/turkey.png",
      "name": "Turkey and\n Avocado Wrap",
      "time": "15 Minutes",
      "calory": "230 Cal",
      "type": "Nutrition",
    },
  ];

  RxList<Map<String, dynamic>> displayItem =
      <Map<String, dynamic>>[].obs; // العناصر التي سيتم عرضها في الواجهة

  // دالة لتصفية العناصر بناءً على الفئة المحددة
  void fillterItem(String fillterType) {
    if (fillterType == 'All') {
      displayItem.value = List.from(allSearch); // عرض جميع العناصر
    } else {
      displayItem.value =
          allSearch
              .where((element) => element['type'] == fillterType)
              .toList(); // تصفية العناصر حسب النوع
    }
  }

  @override
  void onInit() {
    super.onInit();
    fillterItem('All'); // تصفية العناصر عند بداية تحميل الكنترولر
  }
}
