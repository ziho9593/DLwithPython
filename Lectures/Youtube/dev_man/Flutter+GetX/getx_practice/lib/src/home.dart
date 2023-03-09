import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/pages/normal/first.dart';
import 'package:getx_practice/src/pages/reactive_state_manage_page.dart';
import 'package:getx_practice/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("라우트 관리 홈"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text("일반적인 라우트"),
            onPressed: () {
              Get.to(() => const FirstPage());
            },
          ),
          ElevatedButton(
            child: const Text("네임드 라우트"),
            onPressed: () {
              Get.toNamed("/first");
            },
          ),
          ElevatedButton(
            child: const Text("Arguments 전달"),
            onPressed: () {
              Get.toNamed("/next", arguments: User(name: "사쿠라", age: 25));
            },
          ),
          ElevatedButton(
            child: const Text("동적 URL"),
            onPressed: () {
              Get.toNamed("/user/20230308?name=사쿠라&age=25");
            },
          ),
          ElevatedButton(
            child: const Text("단순 상태 관리"),
            onPressed: () {
              Get.to(() => const SimpleStateManagePage());
            },
          ),
          ElevatedButton(
            child: const Text("반응형 상태 관리"),
            onPressed: () {
              Get.to(() => const ReactiveStateManagePage());
            },
          ),
        ],
      )),
    );
  }
}

class User {
  String? name;
  int? age;

  User({this.name, this.age});
}
