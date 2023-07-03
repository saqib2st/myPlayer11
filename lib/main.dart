import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myplayer/app/modules/splash/bindings/splash_binding.dart';
import 'package:myplayer/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    );
  }
}
