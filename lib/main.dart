import 'package:example_30_may_24/app/module/user/splash/binding/initial_binding.dart';
import 'package:example_30_may_24/app/routes/app_pages.dart';
import 'package:example_30_may_24/app/routes/app_routes.dart';
import 'package:example_30_may_24/app_firebase_messaging_service.dart';
import 'package:example_30_may_24/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppFirebaseMessagingService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.appPages(),
      initialRoute: AppRoutes.splash,
      initialBinding: InitialBinding(),
    );
  }
}
