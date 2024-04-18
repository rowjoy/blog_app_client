import 'package:get/get.dart';

import '../../controller/main_view_controller.dart';

class MainViewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewController>(() => MainViewController());
  }

}