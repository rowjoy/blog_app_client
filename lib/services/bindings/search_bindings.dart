import 'package:get/get.dart';
import 'package:kickapp/controller/search_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchViewController>(() => SearchViewController());
  }

}