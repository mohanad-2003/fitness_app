// import 'package:get/get.dart';

// class CreateRoutineController extends GetxController {
//   final RxList<Map<String, dynamic>> createRoutine =
//       <Map<String, dynamic>>[
//         {
//           "image": "assets/barbell.png",
//           "name": "Barbell Rows",
//           "time": "10 Minutes",
//           "rep": "3 Rep",
//           "isFavorit": true,
//         },
//         {
//           "image": "assets/hammer.png",
//           "name": "Hammer Curls",
//           "time": "15 Minutes",
//           "rep": "4 Rep",
//           "isFavorit": false,
//         },
//         {
//           "image": "assets/leg_press.png",
//           "name": "Leg Press",
//           "time": "15 Minutes",
//           "rep": "4 Rep",
//           "isFavorit": false,
//         },
//         {
//           "image": "assets/plank.png",
//           "name": "Plank",
//           "time": "10 Minutes",
//           "rep": "3 Rep",
//           "isFavorit": true,
//         },
//         {
//           "image": "assets/cable.png",
//           "name": "Cable Chest Press",
//           "time": "10 Minutes",
//           "rep": "3 Rep",
//           "isFavorit": false,
//         },
//         {
//           "image": "assets/tricep.png",
//           "name": "Tricep Dips",
//           "time": "15 Minutes",
//           "rep": "4 Rep",
//           "isFavorit": false,
//         },
//         {
//           "image": "assets/push_up.png",
//           "name": "Push-Ups",
//           "time": "10 Minutes",
//           "rep": "3 Rep",
//           "isFavorit": true,
//         },
//         {
//           "image": "assets/trx.png",
//           "name": "TRX Suspension Straps",
//           "time": "10 Minutes",
//           "rep": "3 Rep",
//           "isFavorit": false,
//         },
//       ].obs;

//   void toggleFavorit(int index) {
//     final item = createRoutine[index];
//     item['isFavorit'] = !(item['isFavorit'] ?? false);
//     createRoutine[index] = Map<String, dynamic>.from(item); // للتحديث
//   }
// }
import 'package:get/get.dart';

class CreateRoutineController extends GetxController {
  final RxList<Map<String, dynamic>> createRoutine =
      <Map<String, dynamic>>[
        {
          "image": "assets/barbell.png",
          "name": "Barbell Rows",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": true,
          "isAdded": true,
        },
        {
          "image": "assets/hammer.png",
          "name": "Hammer Curls",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": false,
          "isAdded": true,
        },
        {
          "image": "assets/leg_press.png",
          "name": "Leg Press",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": false,
          "isAdded": true,
        },
        {
          "image": "assets/plank.png",
          "name": "Plank",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": true,
          "isAdded": false,
        },
        {
          "image": "assets/cable.png",
          "name": "Cable Chest Press",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": false,
          "isAdded": false,
        },
        {
          "image": "assets/tricep.png",
          "name": "Tricep Dips",
          "time": "15 Minutes",
          "rep": "4 Rep",
          "isFavorit": false,
          "isAdded": true,
        },
        {
          "image": "assets/push_up.png",
          "name": "Push-Ups",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": true,
          "isAdded": false,
        },
        {
          "image": "assets/trx.png",
          "name": "TRX Suspension Straps",
          "time": "10 Minutes",
          "rep": "3 Rep",
          "isFavorit": false,
          "isAdded": false,
        },
      ].obs;

  void toggleFavorit(int index) {
    final item = createRoutine[index];
    item['isFavorit'] = !(item['isFavorit'] ?? false);
    createRoutine[index] = Map<String, dynamic>.from(item);
  }

  void toggleAdded(int index) {
    final item = createRoutine[index];
    item['isAdded'] = !(item['isAdded'] ?? false);
    createRoutine[index] = Map<String, dynamic>.from(item);
  }
}
