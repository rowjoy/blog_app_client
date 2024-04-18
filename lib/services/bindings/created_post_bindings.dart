

import 'package:get/get.dart';

import '../../controller/new_postcontroller.dart';

class CreatedPostBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatedPostController>(() => CreatedPostController());
  }

}