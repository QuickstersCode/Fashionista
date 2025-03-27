import 'dart:async';

import 'package:fashionista_app/screens/bottom_bar.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    Timer(Duration(seconds: 2), () => Get.off(BottomBar()));
  }
}
