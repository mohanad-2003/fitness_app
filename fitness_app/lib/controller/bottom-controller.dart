import 'package:get/get.dart';

class BottomController extends GetxController {
  var curruntIndex = 0.obs;

  void selectIndex(int index) {
    curruntIndex.value = index;
  }
}
