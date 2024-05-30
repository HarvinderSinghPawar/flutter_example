
import 'package:example_30_may_24/app/module/user/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }
}
