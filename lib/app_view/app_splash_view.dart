import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/controller/app_splash_controller.dart';

class AppSplashView extends GetView<AppSplashController> {
  const AppSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initialized;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio:1,
                child: Image.asset("assets/app_icon.jpg"),
              ),
              SizedBox(height: 15,),
            ],
          ),
        )
      ),
    );
  }
}