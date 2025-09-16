
import 'package:get/get.dart';

class WorkOutController extends GetxController {
  var currentIndex = 0.obs;

  void SelectedIndex(int index) {
    currentIndex.value = index;
  }

  final workoutList = [
    {"name": "Beginner"},
    {"name": "Intermediate"},
    {"name": "Advanced"},
  ];
  final beginner = [
    {
      "image": "assets/upper.png",
      "name": "Upper Body",
      "time": "60 Minutes",
      "calory": "1320 Kcal",
      "exercises": "5 exercises",
      "isfavorit": true,
    }.obs,
    {
      "image": "assets/fullbody.png",
      "name": "Full body\nstretching",
      "time": "45 Minutes",
      "calory": "1450 Kcal",
      "exercises": "5 exercises",
      "isfavorit": false,
    }.obs,
    {
      "image": "assets/glutes.png",
      "name": "Glutes & Abs",
      "time": "12 Minutes",
      "calory": "120 Cal",
      "isfavorit": false,
    }.obs,
  ];
  final intermediate = [
    {
      "image": "assets/circuit.png",
      "name": "Circuit Training",
      "time": "50 Minutes",
      "calory": "1300 Kcal",
      "exercises": "5 exercises",
      "isfavorit": false,
    }.obs,
    {
      "image": "assets/split.png",
      "name": "Split Strength\nTraining",
      "time": "12 Minutes",
      "calory": "1250 Kcal",
      "exercises": "5 exercises",
      "isfavorit": true,
    }.obs,
    {
      "image": "assets/res.png",
      "name": "Resistance\nTraining",
      "time": "12 Minutes",
      "calory": "120 Cal",
      "isfavorit": true,
    }.obs,
  ];
  final advance = [
    {
      "image": "assets/boxing.png",
      "name": "cardio boxing",
      "time": "50 Minutes",
      "calory": "1300 Kcal",
      "exercises": "5 exercises",
      "isfavorit": false,
    }.obs,
    {
      "image": "assets/legs.png",
      "name": "Hypertrophy-\nLegs",
      "time": "12 Minutes",
      "calory": "1250 Kcal",
      "exercises": "5 exercises",
      "isfavorit": true,
    }.obs,
    {
      "image": "assets/rest.png",
      "name": "Rest or Active\nRecovery",
      "isfavorit": false,
    }.obs,
  ];

  void toggleFavorite(RxMap<String, dynamic> item) {
    item['isfavorit'] = !(item['isfavorit'] ?? false);
  }
}
