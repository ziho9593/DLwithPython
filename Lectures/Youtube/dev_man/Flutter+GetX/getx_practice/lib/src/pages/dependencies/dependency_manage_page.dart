import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/controller/dependency_controller.dart';
import 'package:getx_practice/src/pages/dependencies/get_create.dart';
import 'package:getx_practice/src/pages/dependencies/get_lazyput.dart';
import 'package:getx_practice/src/pages/dependencies/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("의존성 주입")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const GetPut(), binding: BindingsBuilder(() {
                      Get.put(DependencyController());
                    }));
                  },
                  child: const Text("Get.put")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const GetLazyPut(),
                        binding: BindingsBuilder(() {
                      Get.lazyPut<DependencyController>(
                          () => DependencyController());
                    }));
                  },
                  child: const Text("Get.lazyPut")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const GetPut(), binding: BindingsBuilder(() {
                      Get.putAsync<DependencyController>(() async {
                        await Future.delayed(const Duration(seconds: 5));
                        return DependencyController();
                      });
                    }));
                  },
                  child: const Text("Get.putAsync")),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => const GetCreate(),
                        binding: BindingsBuilder(() {
                      Get.create<DependencyController>(
                          () => DependencyController());
                    }));
                  },
                  child: const Text("Get.create")),
            ],
          ),
        ));
  }
}
