import 'package:get/get.dart';
import 'package:kickapp/app_view/main_view.dart';
import 'package:kickapp/services/bindings/main_view_bindings.dart';

class AppSplashController extends GetxController {
  RxDouble value = 3.0.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2),(){
      Get.off(()=>MainAppView(),binding: MainViewBindings(),transition: Transition.fade);
    });
    super.onInit();
  }
}