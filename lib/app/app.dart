import 'package:flutter/material.dart';
import 'package:flutter_graphql_architecture/utils/theme.dart';
import 'package:flutter_graphql_architecture/view/home/home_page.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: AppTheme.lightTheme,
        locale: Get.deviceLocale,
        home: const HomePage());
  }
}
