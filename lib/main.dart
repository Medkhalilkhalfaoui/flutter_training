import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/utils/constants.dart';
import 'package:e_commerce_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'views/screens/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-commerce-app',
      navigatorKey: Constants.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authController.connected.value?const HomePage():LoginScreen(),
    ));
  }
}


