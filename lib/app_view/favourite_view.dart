// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/item_details_view.dart';

import '../app_model/favorites_post_model.dart';
import '../controller/item_details_controller.dart';
import '../services/bindings/item_details_bindings.dart';
import '../services/data_not_found.dart';

class FavouriteView extends GetView<ItemDetailsController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title: Text("My Favorite post"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.blue,
      ),
      // body: SafeArea(
      //   child: DataNotFound(),
      // ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getFavorites(), 
          builder: (BuildContext context, AsyncSnapshot<List<FavPostModel>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
               return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                ),
              );
            }
            if(snapshot.hasError || snapshot.data!.isEmpty){
              return Center(
                child: DataNotFound(),
              );
            }
            if(snapshot.hasData){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context , int){
                   return Card(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                     ),
                     color: Colors.white,
                     elevation: 5,
                     child: ListTile(
                       onTap: (){
                           Get.to(()=>ItemDetailsView(postId: snapshot.data![int].favPostId.toString(),), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
                       },
                       title: Text(snapshot.data![int].post!.postContent.toString()),
                       titleTextStyle: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                       subtitle: Text(snapshot.data![int].likedAt.toString()),
                      //  leading: Image.network(snapshot.data![int].postThumbnailUrl.toString()),
                      //  trailing: IconButton(
                      //   onPressed: (){}, 
                      //   icon: Icon(Icons.edit,color: Colors.black,),
                      //  ),
                     ),
                   );
                }
              );
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            );

          }
        ),
      ),
    );
  }
}