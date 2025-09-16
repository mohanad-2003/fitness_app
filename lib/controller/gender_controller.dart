import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  bool isSelected(String gender) {
    return selectedGender.value == gender;
  }

  bool isGenderChosen() {
    return selectedGender.value.isNotEmpty;
  }
}
