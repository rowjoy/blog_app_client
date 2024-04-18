// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/item_details_view.dart';
import 'package:kickapp/services/helpers.dart';

import '../controller/search_controller.dart';
import '../services/bindings/item_details_bindings.dart';

class AppSearchView extends GetView<SearchViewController> {
  const AppSearchView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    }, 
                    icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                  ),
                  Expanded(
                    child: SearchBar(
                      
                      hintText: "Search post here",
                      onChanged: (value){
                          //controller.searchPostList.clear();
                          Future.delayed(Duration(seconds: 1),(){
                              controller.searchPost(value);
                          });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Divider(),
              SizedBox(height: 8,),
              //Obx(()=> Text("Total Search result ${controller.searchResult.value}")),
              SizedBox(height: 8,),
              Expanded(
                    child: Obx(()=> controller.islodding.value == true ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        strokeWidth: 1.0,
                      ),
                    ) : controller.searchPostList.isEmpty ? Center(
                       child: Text("No result to show"),
                    ) : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchPostList.length,
                        itemBuilder: (BuildContext context , int){
                           return ListTile(
                               onTap: (){
                                  Helpers.keyboardhide();
                                  Get.to(()=>ItemDetailsView(postId: controller.searchPostList[int].postId!,), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
                               },
                               title:  Text(controller.searchPostList[int].postTitle!),
                               subtitle: Text(controller.searchPostList[int].authorFullName!),
                               leading: Icon(Icons.post_add,color: Colors.black,),
                               trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                          );
                        }
                      ),
                    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}