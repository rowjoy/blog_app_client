// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, avoid_print, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/search_view.dart';
import 'package:kickapp/component/app_drawer.dart';

import '../component/item_design.dart';
import '../controller/main_view_controller.dart';
import '../local_data/catagori_list.dart';
import '../services/bindings/search_bindings.dart';

class MainAppView extends GetView<MainViewController> {
   MainAppView({super.key});
  @override
  Widget build(BuildContext context) {
    // print("Build ${boxStorage.read(Keys.token)}");
    return  Scaffold(
      appBar: AppBar(
        //key: controller.scaffoldKey,
        title: Obx(()=> Text("${ controller.categoryData.value.isEmpty ? "Recommended" : controller.categoryData.value}")),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(()=>AppSearchView(),binding: SearchBindings(), transition: Transition.rightToLeft);
            }, 
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: mainDrawer(context, controller),
      body: SafeArea(
        child: DefaultTabController(
              length: catagoryBlogType.length, // Set the number of tabs dynamically
              child: Column(
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    onTap: (value){
                      if( catagoryBlogType[value] == "Discover"){
                         controller.postType.value = "MAGIC";
                      }else if(catagoryBlogType[value] == "Closed Deals"){
                        controller.postType.value = "Ending Soon";
                      }else if (catagoryBlogType[value] == "Newest"){
                        controller.postType.value = "";
                      }
                      else{
                        controller.postType.value = catagoryBlogType[value];
                      }
                      controller.getpostWithCatagory();
                      print(controller.postType.value);
                    },
                    tabs: catagoryBlogType.map<Widget>((data) {
                      return Tab(text: data);
                    }).toList(), // Create tabs dynamically based on API response
                  ),
                  Expanded(
                    child: Obx(()=> controller.isLodder.value == true ? SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            backgroundColor: Colors.blue,
                          ) ,
                        ),
                      ) : TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            discover(context, postData: controller.postList, discover: "Discover"),
                            populer(context, postData: controller.postList, discover: "populer"),
                            newpost(context, postData: controller.postList, discover: "newest"),
                            endingSoon(context,postData: controller.postList,discover: "Ending soon"),
                          ],
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}


/*


return TabBarView(
    children: [
      discover(context, postData: builder.data!, discover: "Discover"),
      populer(context, postData: builder.data!, discover: "populer"),
      newpost(context, postData: builder.data!, discover: "newest"),
      endingSoon(context,postData: builder.data!,discover: "Ending soon"),
    ],
);



 */



/**
 

 */
