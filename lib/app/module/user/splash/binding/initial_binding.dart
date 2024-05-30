import 'package:example_30_may_24/app/module/user/splash/view_model/splash_view_model.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => SplashViewModel());
  }
}