import 'dart:async';

import 'package:get/get.dart';
import 'package:myplayer/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    goToHome();
    super.onReady();
  }

  Future goToHome() async {
    await Future.delayed(
        const Duration(seconds: 5), (() => {Get.toNamed(Routes.home)}));
  }
}
