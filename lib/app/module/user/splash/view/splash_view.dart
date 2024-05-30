import 'package:example_30_may_24/app/module/user/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel splashVM = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashVM.splashVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150), // Show Flutter default logo
            SizedBox(height: 20),
            CircularProgressIndicator(), // Show a loading indicator
          ],
        ),
      ),
    );
  }
}