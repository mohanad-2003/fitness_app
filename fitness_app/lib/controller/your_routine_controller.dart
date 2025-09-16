import 'package:get/get.dart';

class YourRoutineController extends GetxController {
  final RxList<Map<String, dynamic>> yourRoutine =
      <Map<String, dynamic>>[
        {
          "image": "assets/barbell.png",
          "title": "Barbell Rows",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": true,
        },
        {
          "image": "assets/hammer.png",
          "title": "Hammer Curls",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": false,
        },
        {
          "image": "assets/legs_routine.png",
          "title": "leg press",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": false,
        },
        {
          "image": "assets/tricep.png",
          "title": "Tricep Dips",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": true,
        },
      ].obs;

  void toggleFavorit(int index) {
    var item = yourRoutine[index];
    item['isFavorit'] = !(item['isFavorit'] ?? false);
    yourRoutine[index] = Map<String, dynamic>.from(item);
  }
}
