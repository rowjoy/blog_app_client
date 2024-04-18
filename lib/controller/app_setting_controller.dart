import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kickapp/services/helpers.dart';
import 'package:kickapp/services/server.dart';

class AppSettingController extends GetxController {
 

  ApiServer apiServer = ApiServer();
  RxBool isLodder = false.obs;
  TextEditingController textEditingController = TextEditingController();


  Future verifyEmail ({required String email})async{
      isLodder.value = true;
      await apiServer.postData(
        url: "user/resend-verification-email", 
        data: {
           "email": "$email"
        }
      ).then((value) {
        isLodder.value = false;
        Helpers.fluttertoast(value["message"]);

      });
  }


}