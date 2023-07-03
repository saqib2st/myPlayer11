import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myplayer/app/modules/home/views/widgets/page_body.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        title: const Text.rich(TextSpan(
            text: 'My',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 50, 90),
                fontWeight: FontWeight.bold,
                fontSize: 22),
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
            ])),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SoccerApi()
            .getAllMatches(), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageBody(snapshot.data!.toList());
          } else {
            return Center(
              child: Lottie.asset('assets/loading.json',
                  height: Get.height * 0.07),
            );
          }
        }, 
      ),
    );
  }
}
