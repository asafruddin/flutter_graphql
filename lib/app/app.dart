import 'package:flutter/material.dart';
import 'package:flutter_graphql_architecture/view/login/login_page.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(locale: Get.deviceLocale, home: const LoginPage());
  }
}
