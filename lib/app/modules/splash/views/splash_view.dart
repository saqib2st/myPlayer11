import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 1,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 136, 217, 255),
              Color.fromARGB(179, 37, 186, 255),
              Colors.blueAccent,
              Color.fromARGB(255, 87, 85, 255),
              Color.fromARGB(255, 93, 64, 255),
            ])),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            Lottie.asset('assets/football.json'),
            SizedBox(
              height: Get.height * 0.2,
            ),
            const Text.rich(TextSpan(
                text: 'My',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 50, 90),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
                children: [
                  TextSpan(
                    text: 'Player',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextSpan(
                      text: '11',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 238, 0),
                      ))
                ]))
          ],
        ),
      ),
    );
  }
}
