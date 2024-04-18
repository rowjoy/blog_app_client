import 'package:get/get.dart';
import 'package:kickapp/app_model/search_post_model.dart';
import 'package:kickapp/services/server.dart';

class SearchViewController extends GetxController {
  ApiServer apiServer = ApiServer();

  RxList<SearchPostModel> searchPostList = <SearchPostModel>[].obs;
  RxInt searchResult = 0.obs;
  RxBool islodding = false.obs;

  Future searchPost (String quary)async{
    islodding.value = true;
    await apiServer.getData(url: "post/search?keyword=$quary&page=1&limit=10", 
    tocken: "").then((value) {
      searchPostList.clear();
      islodding.value = false;
      if(value["data"]["posts"] != null){
        for(var i in value["data"]["posts"] ){
            searchPostList.add(SearchPostModel.fromJson(i));
        }
      }
    });
  }



}