import 'package:get/get.dart';

class AgeControllert extends GetxController {
  var selectedAge = 28.obs;

  void setAge(var age) {
    selectedAge.value = age;
  }
}
