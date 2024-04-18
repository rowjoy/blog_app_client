import 'package:get/get.dart';
import 'package:kickapp/app_model/favorites_post_model.dart';
import 'package:kickapp/app_model/post_details_model.dart';
import 'package:kickapp/services/app_keys.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/services/server.dart';

class ItemDetailsController extends GetxController {
  
  ApiServer apiServer = ApiServer();
  Future<PostDetailsModel> getPostinfo ({required String postId})async{
     var responce = await apiServer.getData(url: "post/$postId", tocken: "");
     return PostDetailsModel.fromJson(responce["data"]);
  }

  //Add a post to favorites

  Future addFavorites ({required String postId})async{
    if(boxStorage.read(Keys.token) != null){
     await apiServer.postData(
      url: "fav/", 
      token: boxStorage.read(Keys.token),
      data: {
         "postId": "$postId"
      }
    ).then((value) {
       if(value["status"] == "success"){
        Helpers.fluttertoast("Success");
       }else{
         Helpers.fluttertoast("Already added ");
       }
    });
    }else {
      Helpers.fluttertoast("Please login now . Then try again");
    }

  }


  // RxList<FavPostModel> favPostList = <FavPostModel>[].obs;
  Future<List<FavPostModel>> getFavorites ()async{
    // favPostList.clear();
    var responce = await apiServer.getData(url: "fav/?page=1&limit=50", tocken: boxStorage.read(Keys.token));
    List data = responce["data"]["posts"];
    return data.map((e) => FavPostModel.fromJson(e)).toList();
  }

  
}