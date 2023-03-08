import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/count_controller_with_getx.dart';
import 'package:getx_practice/src/controller/count_controller_with_provider.dart';
import 'package:getx_practice/src/pages/state/with_getx.dart';
import 'package:getx_practice/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetX());
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순 상태 관리"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: WithGetX()),
          Expanded(
              child: ChangeNotifierProvider<CountControllerWithProvider>(
            create: (_) => CountControllerWithProvider(),
            child: const WithProvider(),
          )),
        ],
      )),
    );
  }
}
