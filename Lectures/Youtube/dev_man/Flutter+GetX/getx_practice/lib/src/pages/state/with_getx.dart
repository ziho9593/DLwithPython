import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  const WithGetX({super.key});

  Widget _button(String id) {
    return ElevatedButton(
        onPressed: () {
          Get.find<CountControllerWithGetX>().increase(id);
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 30),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "GetX",
            style: TextStyle(fontSize: 30),
          ),
          GetBuilder<CountControllerWithGetX>(
              id: "first",
              builder: (controller) {
                return Text(
                  "${controller.count}",
                  style: const TextStyle(fontSize: 50),
                );
              }),
          GetBuilder<CountControllerWithGetX>(
              id: "second",
              builder: (controller) {
                return Text(
                  "${controller.count}",
                  style: const TextStyle(fontSize: 50),
                );
              }),
          _button("first"),
          _button("second"),
        ],
      ),
    );
  }
}
