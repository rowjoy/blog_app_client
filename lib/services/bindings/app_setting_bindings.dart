import 'package:get/get.dart';
import 'package:kickapp/controller/app_setting_controller.dart';

class AppSettingBindings extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<AppSettingController>(() => AppSettingController());
  }

}