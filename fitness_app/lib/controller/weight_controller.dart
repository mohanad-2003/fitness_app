import 'package:get/get.dart';

class WeightController extends GetxController {
  var selectedWeight = 75.obs;

  void setWeight(var weight) {
    selectedWeight.value = weight;
  }
}
