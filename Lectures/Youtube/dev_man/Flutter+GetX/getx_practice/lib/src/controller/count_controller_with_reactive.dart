import 'dart:developer';

import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String? name;
  int? age;
  User({this.name, this.age});
}

class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs;
  RxDouble double = 0.0.obs;
  RxString str = "".obs;
  Rx<NUM> nums = NUM.FIRST.obs;
  Rx<User> users = User(name: "사쿠라", age: 25).obs;
  RxList<String> li = [""].obs;

  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }

  void example() {
    double.value++;
    double(442);

    nums(NUM.SECOND);

    users(User());
    users.update((user) {
      user!.name = "카즈하";
    });

    li.addAll([""]);
    li.add("");
    li.addIf(users.value.name == "사쿠라", "Okay");
  }

  @override
  void onInit() {
    ever(count, (_) => log("매번 호출"));
    once(count, (_) => log("처음 한 번만 호출"));
    debounce(count, (_) => log("마지막 변경이 끝나고 3초 후에 호출"),
        time: const Duration(seconds: 3));
    interval(count, (_) => log("변경되고 있는 동안 1초마다 호출"),
        time: const Duration(seconds: 1));
    super.onInit();
  }
}
