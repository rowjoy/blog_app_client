// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kickapp/component/item_overview.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../app_model/post_details_model.dart';
import '../controller/item_details_controller.dart';
import '../local_data/catagori_list.dart';


class ItemDetailsView extends GetView<ItemDetailsController> {
  final String postId;
  const ItemDetailsView({super.key,required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Post details"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        leading: IconButton(onPressed: (){
          Get.back();
          
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        
      ),
      ),
       body: SafeArea(
         child: SingleChildScrollView(
           child: FutureBuilder(
             future:  controller.getPostinfo(postId: postId.toString()), 
             builder:(BuildContext context, AsyncSnapshot<PostDetailsModel> snapshot){
               if(snapshot.connectionState == ConnectionState.waiting){
                   return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                    ),
                  );
               }
               if(snapshot.hasError){
                 return Center(
                    child: Text("Some thing wrong.Contact support"),
                 );
               }
               if(snapshot.hasData){
                  var  videoId = YoutubePlayer.convertUrlToId(snapshot.data!.postUrl.toString());
                 return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 300,
                          child: Stack(
                            children: [
                              YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: videoId.toString(),
                                    flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        //hideControls: true,
                                        mute: true,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.amber,
                                  progressColors: const ProgressBarColors(
                                    playedColor: Colors.amber,
                                    handleColor: Colors.amberAccent,
                                  ),
                                  onReady: () {
                                     
                                  },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: (){
                                            Get.back();
                                          }, 
                                          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 18,)
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: (){
                                                    Helpers.clipBoard(data: "${snapshot.data!.postTitle} \n ${snapshot.data!.postSubTitle}");
                                                  }, 
                                                  icon: Icon(Icons.share,color: Colors.black,size: 18,)
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: (){
                                                    controller.addFavorites(postId: snapshot.data!.postId.toString());
                                                    print("Onr");
                                                  }, 
                                                  icon: Icon(Icons.favorite,color: Colors.red,size: 18,)
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                     backgroundColor: Colors.greenAccent,
                                     child: ClipOval(
                                       //.svg
                                       child:snapshot.data!.authorAvatarUrl!.contains(".svg") == true ?  SvgPicture.network(snapshot.data!.authorAvatarUrl!) : Image.network(snapshot.data!.authorAvatarUrl!),
                                     ),
                                   ),
                                    SizedBox(width: 8,),
                                    Text("${snapshot.data!.authorFullName}",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(snapshot.data!.postTitle.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(snapshot.data!.postSubTitle.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(snapshot.data!.postContent.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 500,
                          child: DefaultTabController(
                            length: productInfo.length, // Set the number of tabs dynamically
                            child: Column(
                              children: [
                                TabBar(
                                  tabAlignment: TabAlignment.start,
                                  isScrollable: true,
                                  onTap: (value){
                                    print(value);
                                  },
                                  tabs: productInfo.map<Widget>((data) {
                                    return Tab(text: data);
                                  }).toList(), // Create tabs dynamically based on API response
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      aboutBussiness(context,snapshot),
                                      targetMarket(context,snapshot),
                                      salesMarket(context,snapshot),
                                      modelandStrategy(context,snapshot),
                                      investmentandValuation(context,snapshot),
                                      teamRoles(context,snapshot),
                                      futurePlans(context,snapshot),
                                      faQ(context,snapshot),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                                      ),
                        ),
                    ],
                  );
               }
               return Center(
                child: CircularProgressIndicator(
                   strokeWidth: 1.0,
                )
               );
             }
           ),
         ),

         /*
         child: Column(
           children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 300,
                child: Stack(
                  children: [
                    YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: videoId.toString(),
                          flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: true,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        ),
                        onReady: () {
                        },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child: IconButton(
                                onPressed: (){
                                  Get.back();
                                }, 
                                icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 18,)
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: (){}, 
                                        icon: Icon(Icons.share,color: Colors.black,size: 18,)
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: (){}, 
                                        icon: Icon(Icons.favorite,color: Colors.black,size: 18,)
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: productInfo.length, // Set the number of tabs dynamically
                  child: Column(
                    children: [
                      TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        onTap: (value){
                          print(value);
                        },
                        tabs: productInfo.map<Widget>((data) {
                          return Tab(text: data);
                        }).toList(), // Create tabs dynamically based on API response
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            aboutBussiness(context),
                            targetMarket(context),
                            salesMarket(context),
                            modelandStrategy(context),
                            investmentandValuation(context),
                            teamRoles(context),
                            futurePlans(context),
                            faQ(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                             ),
              ),
           ],
         ),
         */
        
       ),
    );
  }
}