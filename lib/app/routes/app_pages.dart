
import 'package:example_30_may_24/app/module/user/home/binding/home_binding.dart';
import 'package:example_30_may_24/app/module/user/home/view/home_view.dart';
import 'package:example_30_may_24/app/module/user/splash/binding/initial_binding.dart';
import 'package:example_30_may_24/app/module/user/splash/view/splash_view.dart';
import 'package:example_30_may_24/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {

  static appRoutes() => [

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: InitialBinding(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),


    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),

  ];
}