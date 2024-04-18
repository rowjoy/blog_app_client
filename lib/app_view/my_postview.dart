// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/app_view/item_details_view.dart';
import 'package:kickapp/services/app_keys.dart';

import '../app_model/my_post_model.dart';
import '../controller/new_postcontroller.dart';
import '../services/bindings/created_post_bindings.dart';
import '../services/bindings/item_details_bindings.dart';
import '../services/data_not_found.dart';
import 'post_view.dart';

class MyPostView extends GetView<CreatedPostController> {
  const MyPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Get.back();
          }, 
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
        ),
        title: Text("My post"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.mypost(), 
          builder: (BuildContext context, AsyncSnapshot<List<MyPostModel>> snapshot){
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
                           
                           Get.to(()=>ItemDetailsView(postId: snapshot.data![int].postId.toString(),), binding: ItemDetailsBindings(), transition: Transition.rightToLeft);
                       },
                       title: Text(snapshot.data![int].postTitle.toString()),
                       titleTextStyle: TextStyle(
                         color: Colors.black,
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                       subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(snapshot.data![int].postSubTitle.toString()),
                           Text(snapshot.data![int].postStatus.toString(),
                             style: TextStyle(
                               color: snapshot.data![int].postStatus.toString() == "APPROVED" ? Colors.blue : Colors.red,
                             ),
                           ),
                         ],
                       ),
                       leading: Image.network(snapshot.data![int].postThumbnailUrl.toString()),
                       trailing: IconButton(
                        onPressed: (){
                            var data = snapshot.data![int];
                            controller.postTitle .text  = data.postTitle!;
                            controller.postSubTitle.text  = data.postSubTitle!;
                            controller.postContent.text  = data.postContent!;
                            controller.postUrl.text  = data.postUrl!;
                            controller.postCategory.text  = data.postCategory!;
                            controller.postOriginCountry.text  = data.postOriginCountry!;
                            controller.targetPrice.text  =  data.targetPrice!;
                            controller.targetEquity.text  = data.targetEquity!;
                            controller.aboutProduct1.text  = data.aboutProduct1!;
                            controller.aboutProduct2.text  = data.aboutProduct2!;
                            controller.aboutProduct3.text  = data.aboutProduct3!;
                            controller.aboutProduct4.text  = data.aboutProduct4!;
                            controller.aboutProduct5.text  = data.aboutProduct5!;
                            controller.aboutMarket1.text  = data.aboutMarket1!;
                            controller.aboutMarket2.text  = data.aboutMarket2!;
                            controller.aboutMarket3.text  = data.aboutMarket3!;
                            controller.aboutMarket4.text  = data.aboutMarket4!;
                            controller.aboutMarket5.text  = data.aboutMarket5!;
                            controller.aboutSales1.text  = data.aboutSales1!;
                            controller.aboutSales2.text  = data.aboutSales2!;
                            controller.aboutSales3.text  = data.aboutSales3!;
                            controller.aboutSales4.text  = data.aboutSales4!;
                            controller.aboutSales5.text  = data.aboutSales5!;
                            controller.businessPlan1.text  = data.businessPlan1!;
                            controller.businessPlan2.text  = data.businessPlan2!;
                            controller.businessPlan3.text  = data.businessPlan3!;
                            controller.businessPlan4.text  = data.businessPlan4!;
                            controller.businessPlan5.text  = data.businessPlan4!;
                            controller.investmentPlan1.text  = data.investmentPlan1!;
                            controller.investmentPlan2.text  = data.investmentPlan2!;
                            controller.investmentPlan3.text  = data.investmentPlan3!;
                            controller.investmentPlan4.text  = data.investmentPlan4!;
                            controller.investmentPlan5.text  = data.investmentPlan5!;
                            controller.aboutTeam1.text  = data.aboutTeam1!;
                            controller.aboutTeam2.text  =  data.aboutTeam2!;
                            controller.aboutTeam3.text  =  data.aboutTeam3!;
                            controller.aboutTeam4.text  =  data.aboutTeam4!;
                            controller.aboutTeam5.text  =  data.aboutTeam5!;
                            controller.futurePlan1.text  = data.futurePlan1!;
                            controller.futurePlan2.text  = data.futurePlan2!;
                            controller.futurePlan3.text  = data.futurePlan3!;
                            controller.futurePlan4.text  = data.futurePlan4!;
                            controller.futurePlan5.text  = data.futurePlan5!;
                            controller.faq1.text  = data.faq1!;
                            controller.faqA1.text  = data.faqA1!;
                            controller.faq2.text  = data.faq2!;
                            controller.faqA2.text  = data.faqA2!;
                            controller.faq3.text  = data.faq3!;
                            controller.faqA3.text  = data.faqA3!;
                            controller.faq4.text  = data.faq4!;
                            controller.faqA4.text  = data.faqA4!;
                            controller.faq5.text  = data.faq5!;
                            controller.faqA5.text  = data.faqA5!;
                            boxStorage.write(Keys.tempPostId, data.postId.toString());
                            Get.to(()=> PostView(), binding: CreatedPostBindings(), arguments: "Update", transition:Transition.leftToRight);
                        }, 
                        icon: Icon(Icons.edit,color: Colors.black,),
                       ),
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