import 'package:get/get.dart';
import 'package:kickapp/controller/app_splash_controller.dart';

class AppSplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSplashController>(() => AppSplashController());
  }

}