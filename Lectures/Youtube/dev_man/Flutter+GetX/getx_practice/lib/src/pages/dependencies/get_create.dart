import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/dependency_controller.dart';

class GetCreate extends StatelessWidget {
  const GetCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print(Get.find<DependencyController>().hashCode);
              Get.find<DependencyController>().increase();
            },
            child: const Text(""),
          ),
        ));
  }
}
