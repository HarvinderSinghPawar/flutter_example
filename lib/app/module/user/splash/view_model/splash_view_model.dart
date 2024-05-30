import 'package:example_30_may_24/app/routes/app_pages.dart';
import 'package:example_30_may_24/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {

  RxBool splashVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("1");
    once(splashVisible, (_) => goToHome());
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("2");
  }

  @override
  void dispose() {
    debugPrint("3");
    splashVisible.value = false;
    super.dispose();
  }

  @override
  void onClose() {
    debugPrint("4");
    super.onClose();
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3)).then((_){
      Get.offAllNamed(AppRoutes.home);
    });
  }

}