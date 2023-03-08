import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "${(Get.arguments as User).name}: ${(Get.arguments as User).age}살"),
          ElevatedButton(
            child: const Text("뒤로 이동"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      )),
    );
  }
}
