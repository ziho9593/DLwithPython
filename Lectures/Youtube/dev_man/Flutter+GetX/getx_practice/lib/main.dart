import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/src/home.dart';
import 'package:getx_practice/src/pages/named/first.dart';
import 'package:getx_practice/src/pages/named/second.dart';
import 'package:getx_practice/src/pages/next.dart';
import 'package:getx_practice/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: "/",
          page: () => const Home(),
          transition: Transition.fadeIn,
        ),
        GetPage(
            name: "/first",
            page: () => const FirstNamedPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/second",
            page: () => const SecondNamedPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/next",
            page: () => const NextPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: "/user/:uid",
            page: () => const UserPage(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
