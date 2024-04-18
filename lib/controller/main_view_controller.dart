import 'package:get/get.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/services/server.dart';

import '../app_model/post_model.dart';

class MainViewController extends GetxController {

  RxString categoryData = "".obs;
  RxString postType = "MAGIC".obs;
  RxBool isLodder = false.obs;
  // var scaffoldKey = GlobalKey<ScaffoldState>();

 RxList<mainPostModel> postList = <mainPostModel>[].obs;
 ApiServer apiServer = ApiServer();
  Future getpostWithCatagory ()async{
    isLodder.value = true;
    postList.clear();
    var responce = await apiServer.getData(url: "post/type/$postType?page=1&limit=40&category=$categoryData", tocken: "");
    isLodder.value = false;
    if(responce["status"] != "error"){
      for(var i in responce["data"]["posts"]){
         postList.add(mainPostModel.fromJson(i));
      }
    }else {
      postList.clear();
      Helpers.fluttertoast(responce["message"]);
    }
 
  }


  @override
  void onInit() {
    getpostWithCatagory();
    super.onInit();
  }

}