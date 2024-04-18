

import 'package:get/get.dart';
import 'package:kickapp/controller/login_controller.dart';

class LoginViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}