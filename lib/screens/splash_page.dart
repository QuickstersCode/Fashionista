import 'package:fashionista_app/controllers/splash_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  SplashPageController controller = Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.amber.shade50.withOpacity(0.5),
          image: DecorationImage(
              image: AssetImage('assets/images/Splash.png'),
              fit: BoxFit.cover)),
    ));
  }
}