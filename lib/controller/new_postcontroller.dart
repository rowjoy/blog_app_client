// ignore_for_file: unnecessary_this, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickapp/app_model/my_post_model.dart';
import 'package:kickapp/local_data/catagori_list.dart';
import 'package:kickapp/services/server.dart';

import '../app_view/main_view.dart';
import '../services/app_keys.dart';
import '../services/bindings/main_view_bindings.dart';
import '../services/helpers.dart';




class CreatedPostController extends GetxController {


    RxString selectCatagory = categorydropDown.first.obs;
    final TextEditingController tocken = TextEditingController();
    final TextEditingController filePath  = TextEditingController();
    final TextEditingController postTitle  = TextEditingController();
    final TextEditingController postSubTitle = TextEditingController();
    final TextEditingController postContent = TextEditingController();
    final TextEditingController postUrl = TextEditingController();
    final TextEditingController postCategory = TextEditingController();
    final TextEditingController postOriginCountry = TextEditingController();
    final TextEditingController targetPrice = TextEditingController();
    final TextEditingController targetEquity = TextEditingController();
    final TextEditingController aboutProduct1 = TextEditingController();
    final TextEditingController aboutProduct2 = TextEditingController();
    final TextEditingController aboutProduct3 = TextEditingController();
    final TextEditingController aboutProduct4 = TextEditingController();
    final TextEditingController aboutProduct5 = TextEditingController();
    final TextEditingController aboutMarket1 = TextEditingController();
    final TextEditingController aboutMarket2 = TextEditingController();
    final TextEditingController aboutMarket3 = TextEditingController();
    final TextEditingController aboutMarket4 = TextEditingController();
    final TextEditingController aboutMarket5 = TextEditingController();
    final TextEditingController aboutSales1 = TextEditingController();
    final TextEditingController aboutSales2 = TextEditingController();
    final TextEditingController aboutSales3 = TextEditingController();
    final TextEditingController aboutSales4 = TextEditingController();
    final TextEditingController aboutSales5 = TextEditingController();
    final TextEditingController businessPlan1 = TextEditingController();
    final TextEditingController businessPlan2 = TextEditingController();
    final TextEditingController businessPlan3 = TextEditingController();
    final TextEditingController businessPlan4 = TextEditingController();
    final TextEditingController businessPlan5 = TextEditingController();
    final TextEditingController investmentPlan1 = TextEditingController();
    final TextEditingController investmentPlan2 = TextEditingController();
    final TextEditingController investmentPlan3 = TextEditingController();
    final TextEditingController investmentPlan4 = TextEditingController();
    final TextEditingController investmentPlan5 = TextEditingController();
    final TextEditingController aboutTeam1 = TextEditingController();
    final TextEditingController aboutTeam2 = TextEditingController();
    final TextEditingController aboutTeam3 = TextEditingController();
    final TextEditingController aboutTeam4 = TextEditingController();
    final TextEditingController aboutTeam5 = TextEditingController();
    final TextEditingController futurePlan1 = TextEditingController();
    final TextEditingController futurePlan2 = TextEditingController();
    final TextEditingController futurePlan3 = TextEditingController();
    final TextEditingController futurePlan4 = TextEditingController();
    final TextEditingController futurePlan5 = TextEditingController();
    final TextEditingController faq1 = TextEditingController();
    final TextEditingController faqA1 = TextEditingController();
    final TextEditingController faq2 = TextEditingController();
    final TextEditingController faqA2 = TextEditingController();
    final TextEditingController faq3 = TextEditingController();
    final TextEditingController faqA3 = TextEditingController();
    final TextEditingController faq4 = TextEditingController();
    final TextEditingController faqA4 = TextEditingController();
    final TextEditingController faq5 = TextEditingController();
    final TextEditingController faqA5 = TextEditingController();



  // setUserProfile (XFile file){
  //    // this.filePath.text = file;
  // }

  late File imageFile;
Future setUserProfile (XFile file) async{
     this.filePath.text = file.path.split("/").last;
     imageFile = File(file.path);
  }


RxBool ispostLodder = false.obs;


Future createdpostRequest ()async{

  ispostLodder.value = true;
  var headers = {
  'Authorization': 'Bearer ${boxStorage.read(Keys.token)}'
};
var request = http.MultipartRequest('POST', Uri.parse('https://api.terrawhales.com/api/v1/post/'));
request.fields.addAll({
  'postTitle': '${this.postTitle.text}',
  'postSubTitle': '${this.postSubTitle.text}',
  'postContent': '${this.postContent.text}',
  'postUrl': '${this.postUrl.text}',
  'postCategory': '${this.selectCatagory}',
  'postOriginCountry': '${this.postOriginCountry.text}',
  'targetPrice': '${this.targetPrice.text}',
  'targetEquity': '${this.targetEquity.text}',
  'AboutProduct1': '${this.aboutProduct1.text}',
  'AboutProduct2': '${this.aboutProduct2.text}',
  'AboutProduct3': '${this.aboutProduct3.text}',
  'AboutProduct4': '${this.aboutProduct4.text}',
  'AboutProduct5': '${this.aboutProduct5.text}',
  'AboutMarket1': '${this.aboutMarket1.text}',
  'AboutMarket2': '${this.aboutMarket2.text}',
  'AboutMarket3': '${this.aboutMarket3.text}',
  'AboutMarket4': '${this.aboutMarket4.text}',
  'AboutMarket5': '${this.aboutMarket5.text}',
  'AboutSales1': '${this.aboutSales1.text}',
  'AboutSales2': '${this.aboutSales2.text}',
  'AboutSales3': '${this.aboutSales3.text}',
  'AboutSales4': '${this.aboutSales4.text}',
  'AboutSales5': '${this.aboutSales5.text}',
  'BusinessPlan1': '${this.businessPlan1.text}',
  'BusinessPlan2': '${this.businessPlan2.text}',
  'BusinessPlan3': '${this.businessPlan3.text}',
  'BusinessPlan4': '${this.businessPlan4.text}',
  'BusinessPlan5': '${this.businessPlan5.text}',
  'InvestmentPlan1': '',
  'InvestmentPlan2': '',
  'InvestmentPlan3': '',
  'InvestmentPlan4': '',
  'InvestmentPlan5': '',
  'AboutTeam1': '${this.aboutTeam1.text}',
  'AboutTeam2': '${this.aboutTeam2.text}',
  'AboutTeam3': '${this.aboutTeam3.text}',
  'AboutTeam4': '${this.aboutTeam4.text}',
  'AboutTeam5': '${this.aboutTeam5.text}',
  'FuturePlan1': '${this.futurePlan1.text}',
  'FuturePlan2': '${this.futurePlan2.text}',
  'FuturePlan3': '${this.futurePlan3.text}',
  'FuturePlan4': '${this.futurePlan4.text}',
  'FuturePlan5': '${this.futurePlan5.text}',
  'faq1': '${this.faq1.text}',
  'faqA1': '${this.faqA1.text}',
  'faq2': '${this.faq2.text}',
  'faqA2': '${this.faqA2.text}',
  'faq3': '${this.faq3.text}',
  'faqA3': '${this.faqA3.text}',
  'faq4': '${this.faq4.text}',
  'faqA4': '${this.faqA4.text}',
  'faq5': '${this.faq5.text}',
  'faqA5': '${this.faqA5.text}'
});
request.files.add(await http.MultipartFile.fromPath(
    "thumbnail", 
      imageFile.path,
      filename:  imageFile.path.toString().split("/").last,
      contentType: MediaType('image', 'jpg'),
    ),
);
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
ispostLodder.value = false;
print(response.request);
print(boxStorage.read(Keys.token));
  if (response.statusCode == 200) {
      var data = await http.Response.fromStream(response);
      var ty = jsonDecode(data.body);
      Helpers.fluttertoast("${ty["status"]}");
      postAlart(Get.context!, ispostDone: true, PostAlart: "Thanks for your submission! Expect a response within 10 business days via email.");
     // Get.off(()=> MainAppView(),binding: MainViewBindings(),transition: Transition.leftToRight);
  }else {
   var data = await http.Response.fromStream(response);
   var ty = jsonDecode(data.body);
   print(ty);
   Helpers.fluttertoast("${ty["status"]}");
 }
}


// List<MyPostModel> myPostList = <MyPostModel>[].obs;
Future<List<MyPostModel>> mypost ()async{
  ApiServer apiServer = ApiServer();
  var responce = await apiServer.getData(url: "user/myposts", tocken: boxStorage.read(Keys.token));
  List data = responce["data"]["posts"];
  return data.map((e) => MyPostModel.fromJson(e)).toList();
}


Future updatePost ({ required String postId}) async{
   ispostLodder.value = true;
    var headers = {
       'Authorization': 'Bearer ${boxStorage.read(Keys.token)}'
    };
    var request = http.MultipartRequest('PATCH', Uri.parse('https://api.terrawhales.com/api/v1/post/'));
    request.fields.addAll({
      'postId': '${boxStorage.read(Keys.tempPostId)}',
      'postTitle': '${this.postTitle.text}',
      'postSubTitle': '${this.postSubTitle.text}',
      'postContent': '${this.postContent.text}',
      'postUrl': '${this.postUrl.text}',
      'postCategory': '${this.selectCatagory}',
      'postOriginCountry': '${this.postOriginCountry.text}',
      'targetPrice': '${this.targetPrice.text}',
      'targetEquity': '${this.targetEquity.text}',
      'AboutProduct1': '${this.aboutProduct1.text}',
      'AboutProduct2': '${this.aboutProduct2.text}',
      'AboutProduct3': '${this.aboutProduct3.text}',
      'AboutProduct4': '${this.aboutProduct4.text}',
      'AboutProduct5': '${this.aboutProduct5.text}',
      'AboutMarket1': '${this.aboutMarket1.text}',
      'AboutMarket2': '${this.aboutMarket2.text}',
      'AboutMarket3': '${this.aboutMarket3.text}',
      'AboutMarket4': '${this.aboutMarket4.text}',
      'AboutMarket5': '${this.aboutMarket5.text}',
      'AboutSales1': '${this.aboutSales1.text}',
      'AboutSales2': '${this.aboutSales2.text}',
      'AboutSales3': '${this.aboutSales3.text}',
      'AboutSales4': '${this.aboutSales4.text}',
      'AboutSales5': '${this.aboutSales5.text}',
      'BusinessPlan1': '${this.businessPlan1.text}',
      'BusinessPlan2': '${this.businessPlan2.text}',
      'BusinessPlan3': '${this.businessPlan3.text}',
      'BusinessPlan4': '${this.businessPlan4.text}',
      'BusinessPlan5': '${this.businessPlan5.text}',
      'InvestmentPlan1': '',
      'InvestmentPlan2': '',
      'InvestmentPlan3': '',
      'InvestmentPlan4': '',
      'InvestmentPlan5': '',
      'AboutTeam1': '${this.aboutTeam1.text}',
      'AboutTeam2': '${this.aboutTeam2.text}',
      'AboutTeam3': '${this.aboutTeam3.text}',
      'AboutTeam4': '${this.aboutTeam4.text}',
      'AboutTeam5': '${this.aboutTeam5.text}',
      'FuturePlan1': '${this.futurePlan1.text}',
      'FuturePlan2': '${this.futurePlan2.text}',
      'FuturePlan3': '${this.futurePlan3.text}',
      'FuturePlan4': '${this.futurePlan4.text}',
      'FuturePlan5': '${this.futurePlan5.text}',
      'faq1': '${this.faq1.text}',
      'faqA1': '${this.faqA1.text}',
      'faq2': '${this.faq2.text}',
      'faqA2': '${this.faqA2.text}',
      'faq3': '${this.faq3.text}',
      'faqA3': '${this.faqA3.text}',
      'faq4': '${this.faq4.text}',
      'faqA4': '${this.faqA4.text}',
      'faq5': '${this.faq5.text}',
      'faqA5': '${this.faqA5.text}'
    });
    request.files.add(await http.MultipartFile.fromPath(
        "thumbnail", 
          imageFile.path,
          filename:  imageFile.path.toString().split("/").last,
          contentType: MediaType('image', 'jpg'),
        ),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    ispostLodder.value = false;
    if (response.statusCode == 200) {
        var data = await http.Response.fromStream(response);
        var ty = jsonDecode(data.body);
        Helpers.fluttertoast("${ty["status"]}");
        postAlart(Get.context!, ispostDone: true, PostAlart: "Thanks for your submission! Expect a response within 10 business days via email.");
    }else {
        var data = await http.Response.fromStream(response);
        var ty = jsonDecode(data.body);
        print(ty);
        Helpers.fluttertoast("${ty["status"]}");
  }

}


    Future<void> postAlart(BuildContext context,{required String PostAlart, required bool ispostDone }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Post Alart"),
          actions: [
            TextButton(
                  onPressed: (){
                    if(ispostDone == false){
                       Get.back();
                    }else {
                      Get.off(()=> MainAppView(),binding: MainViewBindings(),transition: Transition.leftToRight);
                    }
                    
                  }, 
                  child: Text("Ok")
                ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                 Text("$PostAlart"),
              ],
            ),
          ),
        );
      },
    );
  }


@override
  void onInit() {
    if(Get.arguments == true){
      Future.delayed(Duration(milliseconds: 200),(){
        postAlart(Get.context!, ispostDone: false ,PostAlart: "Before submitting your answers, please note that you have the option to leave any box blank. Simply submit with the answers you have. Additionally, if you have sensitive information you prefer not to submit through the app, please email us instead.");
      });
    }

    if(Get.arguments.toString() != "Update"){
      cashClear();
    }
    super.onInit();
  }







  cashClear (){
    this.tocken.clear();
    this.filePath .clear();
    this.postTitle .clear();
    this.postSubTitle.clear();
    this.postContent.clear();
    this.postUrl.clear();
    this.postCategory.clear();
    this.postOriginCountry.clear();
    this.targetPrice.clear();
    this.targetEquity.clear();
    this.aboutProduct1.clear();
    this.aboutProduct2.clear();
    this.aboutProduct3.clear();
    this.aboutProduct4.clear();
    this.aboutProduct5.clear();
    this.aboutMarket1.clear();
    this.aboutMarket2.clear();
    this.aboutMarket3.clear();
    this.aboutMarket4.clear();
    this.aboutMarket5.clear();
    this.aboutSales1.clear();
    this.aboutSales2.clear();
    this.aboutSales3.clear();
    this.aboutSales4.clear();
    this.aboutSales5.clear();
    this.businessPlan1.clear();
    this.businessPlan2.clear();
    this.businessPlan3.clear();
    this.businessPlan4.clear();
    this.businessPlan5.clear();
    this.investmentPlan1.clear();
    this.investmentPlan2.clear();
    this.investmentPlan3.clear();
    this.investmentPlan4.clear();
    this.investmentPlan5.clear();
    this.aboutTeam1.clear();
    this.aboutTeam2.clear();
    this.aboutTeam3.clear();
    this.aboutTeam4.clear();
    this.aboutTeam5.clear();
    this.futurePlan1.clear();
    this.futurePlan2.clear();
    this.futurePlan3.clear();
    this.futurePlan4.clear();
    this.futurePlan5.clear();
    this.faq1.clear();
    this.faqA1.clear();
    this.faq2.clear();
    this.faqA2.clear();
    this.faq3.clear();
    this.faqA3.clear();
    this.faq4.clear();
    this.faqA4.clear();
    this.faq5.clear();
    this.faqA5.clear();
  }






}