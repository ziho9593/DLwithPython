import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/home.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Named Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text("뒤로 이동"),
            onPressed: () {
              Get.back();
            },
          ),
          ElevatedButton(
            child: const Text("홈으로 이동"),
            onPressed: () {
              Get.offAllNamed("/");
            },
          )
        ],
      )),
    );
  }
}
