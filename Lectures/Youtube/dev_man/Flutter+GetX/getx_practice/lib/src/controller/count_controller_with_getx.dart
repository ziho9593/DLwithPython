import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {
  static CountControllerWithGetX get to => Get.find();

  int count = 0;

  void increase(String id) {
    count++;
    update([id]);
  }
}
