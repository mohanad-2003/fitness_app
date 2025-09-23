import 'package:get/state_manager.dart';

class ComunityController extends GetxController {
  var currentCategory = 0.obs;
  final List<String> categories = ["Discussion Forum", "Challenges",];

  void selectCategory(int index) {
    currentCategory.value = index;
  }
}
