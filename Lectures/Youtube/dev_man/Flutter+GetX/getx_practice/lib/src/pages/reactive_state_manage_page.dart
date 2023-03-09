import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_reactive.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: const Text("반응형 상태 관리"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GetX",
            style: TextStyle(fontSize: 30),
          ),
          Obx(() => Text(
                "${Get.find<CountControllerWithReactive>().count.value}",
                style: const TextStyle(fontSize: 50),
              )),
          ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().increase();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 30),
              )),
          ElevatedButton(
              onPressed: () {
                Get.find<CountControllerWithReactive>().putNumber;
              },
              child: const Text(
                "5로 변경",
                style: TextStyle(fontSize: 30),
              )),
        ],
      )),
    );
  }
}
