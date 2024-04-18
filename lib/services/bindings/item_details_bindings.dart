import 'package:get/get.dart';

import '../../controller/item_details_controller.dart';

class ItemDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemDetailsController>(() => ItemDetailsController());
  }

}